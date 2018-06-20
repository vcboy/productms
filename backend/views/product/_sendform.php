<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
use backend\models\Refcode;

/* @var $this yii\web\View */
/* @var $model backend\models\Product */
/* @var $form yii\widgets\ActiveForm */
$productclasslist = Refcode::getRefcodeBytype('productclass');
?>

<div class="product-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'sender_user')->textInput(['readonly'=>'readonly','value'=>$model->sender_user?$model->sender_user:Yii::$app->user->identity->name]) ?>

    <?= $form->field($model, 'send_date')->textInput(['maxlength' => true,'onfocus' => 'WdatePicker({dateFmt:"yyyy-MM-dd"})','value'=>date('Y-m-d',time())]) ?>

    <?= $form->field($model, 'send_comment')->textInput() ?>
    
    <?= $form->field($model, 'booker_user')->textInput(['readonly'=>'readonly','value'=>$model->booker_user?$model->booker_user:Yii::$app->user->identity->name]) ?>

    <?= $form->field($model, 'book_date')->textInput(['readonly'=>'readonly','maxlength' => true]) ?>

    <?= $form->field($model, 'book_comment')->textInput(['readonly'=>'readonly']) ?>

    <?= $form->field($model, 'arrive_date')->textInput(['readonly'=>'readonly','maxlength' => true]) ?>

    <?= $form->field($model, 'is_customer')->label('是否本单位')->dropDownList((empty($model->is_customer)?array(0=>'本单位'):array(1=>'其他单位')), array('readonly' => 'readonly')) ?>

    <?= $form->field($model, 'total_price')->textInput(['readonly'=>'readonly']) ?>

    <?= $form->field($model, 'customer')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    
    <table class="table table-striped table-bordered" id="product_tb">
        <tr><th colspan="4">
            <?=  Html::a('查看库存配比','javascript:;',['class'=>'btn btn-sm btn-danger','onclick'=>'_checkstore()'])?>
        </th></tr>
        <tr><th>成品分类</th><th>成品名称</th><th>配货数量</th><th>发货数量</th></tr>
        <?=$pte_arr_txt?>
    </table>

    <div class="form-group">
    <?=  Html::Button('发货', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary','onclick'=>'_checkSub()']) ?>
    <?=  Html::a('返回',Url::toRoute("sendlist"),['class'=>'btn btn-primary'])?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<script type="text/javascript">
    
    /**
     * [_changePtype 根据类型筛选成品]
     * @param  {[type]} obj     [description]
     * @param  {[type]} tempkey [description]
     * @return {[type]}         [description]
     */
    function _changePtype(obj,tempkey){
        var productclass_id = $(obj).val();
        var Content = {productclass_id: productclass_id};
        var url = "<?=Url::to(['product/getproduct'])?>";
        $.post(url,Content,function(rsp){
            if(rsp){
                var obj = JSON.parse(rsp);
                var optionstr = '<option value="">--请选择--</option>';
                for(var i in obj){
                    optionstr+="<option value="+i+">"+obj[i]+"</option>";
                }
                $(".product_"+tempkey+" option").remove();
                $(".product_"+tempkey).append(optionstr);
            }
        });
    }

    /**
     * [_deltr 删除tr]
     * @param  {[type]} tmpkey [description]
     * @return {[type]}        [description]
     */
    function _deltr(tmpkey){
        swal({ 
            title: "确定删除吗？", 
            text: "你将无法恢复该配置！", 
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: true,  
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定删除！"
        },
        function(){
            $('#tr_'+tmpkey).remove();
        });
    }

    function _checkstore(){
        var gp_arr = $('#gp_arr').val();
        if(gp_arr!=""){
            var Content = {'gp_arr': gp_arr};
            var url = "<?=Url::to(['getstoreinfo'])?>";
            $.post(url,Content,function(rsp){
                swal({ 
                  title: "当前订单配额与库存量对比",
                  text: rsp, 
                  html: true 
                });
            })
        }else{
            swal({ 
              title: "没有完整添加相关成品及数量",
              text: '没有成品或者成品数量未填写'
            });
        }
    }

    function _checkSub(){
        var gp_arr = $('#gp_arr').val();
        var Content = {'gp_arr': gp_arr};
        var url = "<?=Url::to(['hasenough'])?>";
        $.post(url,Content,function(rsp){
            if(rsp!=1){
                swal({ 
                  title: "库存数量不足,无法完成发货。",
                  text: rsp, 
                  html: true 
                });
            }else{
                swal("发货成功", "成品发货成功","success");
                $('form').submit();
            }
        });
    }
</script>