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

    <?= $form->field($model, 'booker_user')->textInput(['value'=>$model->booker_user?$model->booker_user:Yii::$app->user->identity->name]) ?>

    <?= $form->field($model, 'book_date')->textInput(['maxlength' => true,'onfocus' => 'WdatePicker({dateFmt:"yyyy-MM-dd"})','value'=>$model->book_date]) ?>

    <?= $form->field($model, 'book_comment')->textInput() ?>

    <?= $form->field($model, 'arrive_date')->textInput(['maxlength' => true,'onfocus' => 'WdatePicker({dateFmt:"yyyy-MM-dd"})']) ?>

    <?= $form->field($model, 'is_customer')->label('是否本单位')->dropDownList(array('all'=>'--请选择--',0=>'本单位',1=>'其他单位')) ?>

    <?= $form->field($model, 'total_price')->textInput(['readonly'=>'readonly']) ?>

    <?= $form->field($model, 'customer')->textInput(['maxlength' => true]) ?>

    <input type="hidden" name="product_txt" id="product_txt">
    <input type="hidden" name="pnum_txt" id="pnum_txt">

    <table class="table table-striped table-bordered" id="product_tb">
        <tr><th colspan="4"><?=  Html::a('添加配货成品','javascript:;',['class'=>'btn btn-sm btn-success','onclick'=>'_addProduct()'])?></th></tr>
        <tr><th>成品分类</th><th>成品名称</th><th>配货数量</th><th>当前配比库存</th><th class="action-column">操作</th></tr>
        <?=$pte_arr_txt?>
    </table>

    <div class="form-group">
    <?=  Html::Button($model->isNewRecord ? '保存' : '更新', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary','onclick'=>'_checkSub()']) ?>
    <?=  Html::a('返回',Url::toRoute("index"),['class'=>'btn btn-primary'])?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<script type="text/javascript">
    /**
     *     
     * [_addPurchase 添加成品]
     */
    function _addProduct(){
        var temp = new Date().getTime();
        var txt = "<tr id='tr_"+temp+"'><td><select class='ftype form-control' onchange='_changePtype(this,"+temp+")'><option value=''>--请选择--</option><? foreach ($productclasslist as $key => $val) {echo "<option value='".$key."'>".$val."</option>";}?></select></td><td><select class='form-control fid product_"+temp+"' onchange='_getUnitprice()'><option value=''>--请选择--</option></select></td><td><input class='form-control num num_"+temp+"' onchange='_getUnitprice()'></td><td><button type='button' class='btn btn-xs btn-danger' title='删除' aria-label='删除' data-pjax='0' onclick='_deltr(\""+temp+"\")'><i class='icon-trash bigger-120'></i></button></td></tr>";
        $('#product_tb').append(txt);
    }

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

    /**
     * [_getUnitprice 计算配送总价]
     * @return {[type]} [description]
     */
    function _getUnitprice(){

        var gp_arr = "";
        $('#product_tb').find('tr').each(function(){
            var temp = $(this).attr('id');
            if(temp!=undefined){
                temp = temp.substring(3,temp.length);
                var pid = $('.product_'+temp).val();
                var num = $('.num_'+temp).val()-0;
                if(pid>0 && !isNaN(num) && num>0){
                    gp_arr = gp_arr + pid + '_' + num + "|";
                }
            }
        });
        if(gp_arr!=""){
            gp_arr = gp_arr.substring(0,gp_arr.length-1);
            var Content = {'gp_arr': gp_arr};
            var url = "<?=Url::to(['getuprice'])?>";
            $.post(url,Content,function(rsp){
                if(rsp){
                    $("#product-total_price").val(rsp);
                }
            })
        }
    }

    function _checkSub(){
        _getUnitprice();
        var flag = 1;
        var product_txt = "";
        var pnum_txt = "";
        var err_msg = "";
        if($('.ftype').size()>0){
            $('.ftype').each(function(){
                var ft_txt = $(this).val();
                if(ft_txt==""){
                    flag=0;
                    err_msg = err_msg + "成品类型没有选择。";
                }
            });

            $('.fid').each(function(){
                var ft_txt = $(this).val();
                if(ft_txt!=""){
                    product_txt = product_txt + ft_txt + ",";    
                }else{
                    flag=0;
                    err_msg = err_msg + "成品名称没有选择。";
                }
            });

            $('.num').each(function(){
                var ft_txt = $(this).val();
                if(ft_txt!=""&&!isNaN(ft_txt)){
                    pnum_txt = pnum_txt + ft_txt + ",";    
                }else{
                    flag=0;
                    err_msg = err_msg + "成品配货数量没有填写或填写有误。";
                }
            });
        }else{
            flag = 0;
            err_msg = err_msg + "请添加所需要配货的成品。";
        }
        if(flag==0){
            swal(err_msg);
        }else{
            $('#product_txt').val(product_txt.substring(0,product_txt.length-1));
            $('#pnum_txt').val(pnum_txt.substring(0,pnum_txt.length-1));
            swal("保存成功", "成品配货成功","success");
            $('form').submit();
        }
    }
</script>