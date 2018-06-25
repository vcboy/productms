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
    <?= $form->field($model, 'inspector_user')->textInput(['readonly'=>'readonly','value'=>$model->inspector_user?$model->inspector_user:Yii::$app->user->identity->name]) ?>

    <?= $form->field($model, 'inspect_date')->textInput(['readonly'=>'readonly','maxlength' => true,'onfocus' => 'WdatePicker({dateFmt:"yyyy-MM-dd HH:mm"})','value'=>date('Y-m-d H:i',time())]) ?>



    <table class="table table-striped table-bordered" id="product_tb">
        <tr><th>成品分类</th><th>成品名称</th><th>入库数量</th><th>剩余数量</th><th>消耗数量
            <?=  Html::Button('全部消耗', ['class' => 'btn btn-primary btn-xs','onclick'=>'_consumeall()']) ?></th></tr>
        <?=$pte_arr_txt?>
    </table>

    <div class="form-group">
    <?=  Html::Button('添加消耗', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary','onclick'=>'_checkSub()']) ?>
    <?=  Html::a('返回',Url::toRoute("consume"),['class'=>'btn btn-primary'])?>
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
        var msg = "";
        $('.icount').each(function(){
            var num = $(this).attr('inputnum')-0;
            var rnum = $(this).val()-0;
            console.log(rnum);
            if(rnum == 0){
                //msg = "消耗数量必须大于0";
            }else if(num<rnum){
                msg = "消耗的数量不能大于剩余的数量。";
            }
        });
        if(msg){
            swal({ 
                title: "添加错误",
                text: msg, 
                html: true 
            });
        }else{
            swal("添加成功", "添加消耗成功","success");
            $('form').submit();
        }
    }

    function _consumeall(){
        $("input[name = 'depot_count[]']").each(function(){
            $(this).val($(this).attr('inputnum'));
        })
    }
</script>