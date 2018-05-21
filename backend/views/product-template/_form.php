<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use backend\models\Refcode;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model backend\models\ProductTemplate */
/* @var $form yii\widgets\ActiveForm */
$productclasslist = Refcode::getRefcodeBytype('productclass');
$productunitlist = Refcode::getRefcodeBytype('productunit');
$foodclasslist = Refcode::getRefcodeBytype('foodclass');
?>
<div class="page-header">
    <h1><?=$this->title?></h1>
</div>

<div class="product-template-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'productclass_id')->dropDownList(array(''=>'--请选择--')+$productclasslist,['id'=>'productclass_id']) ?>

    <?= $form->field($model, 'product_id')->dropDownList(array(''=>'--请选择--'),['id'=>'product_id']) ?>

    <?= $form->field($model, 'unitprice')->textInput() ?>

    <?= $form->field($model, 'unit')->dropDownList(array(''=>'--请选择--')+$productunitlist,['id'=>'unit']) ?>

    <? //$form->field($model, 'is_del')->textInput() ?>

    <table class="table table-striped table-bordered" id="food_tb">
        <tr><th colspan="4"><?=  Html::a('添加食材配额','#',['class'=>'btn btn-sm btn-success','onclick'=>'_addPurchase()'])?></th></tr>
        <tr><th>食材分类</th><th>食材名称</th><th>食材数量</th><th class="action-column">操作</th></tr>
    </table>

    <div class="form-group">
    <?=  Html::Button($model->isNewRecord ? '保存' : '更新', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary','onclick'=>'_checkSub()']) ?>
    <?=  Html::a('返回',Url::toRoute("index"),['class'=>'btn btn-primary'])?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<script type="text/javascript">
    $(document).ready(function(){
        $("#productclass_id").change(function(){
            var productclass_id = $(this).val();
            var Content = {productclass_id: productclass_id};
            var url = "<?=Url::to(['getproduct'])?>";
            $.post(url,Content,function(rsp){
                if(rsp){
                    var obj = JSON.parse(rsp);
                    var optionstr = '<option value="">--请选择--</option>';
                    for(var i in obj){
                        optionstr+="<option value="+i+">"+obj[i]+"</option>";
                    }
                    $("#product_id option").remove();
                    $("#product_id").append(optionstr);
                }
            })
        });
    });

    /**
     * [_addPurchase 添加食材]
     */
    function _addPurchase(){
        var temp = new Date().getTime();
        var txt = "<tr id='tr_"+temp+"'><td><select class='ftype' style='width:100%;' onchange='_changeFtype(this,"+temp+")'><option value=''>--请选择--</option><? foreach ($foodclasslist as $key => $val) {echo "<option value='".$key."'>".$val."</option>";}?></select></td><td><select  style='width:100%;' class='fid food_"+temp+"' onchange='_changeFood(this,"+temp+")'><option value=''>--请选择--</option></select></td><td><input class='num num_"+temp+"'></td><td><button type='button' class='btn btn-xs btn-danger' title='删除' aria-label='删除' data-pjax='0' onclick='_deltr(\""+temp+"\")'><i class='icon-trash bigger-120'></i></button></td></tr>";
        $('#food_tb').append(txt);
    }

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

    function _changeFtype(obj,tempkey){
        var id = $(obj).val();
    }

    function _checkSub(){
        var flag = 1;
        var ftype_txt = "";
        var err_msg = "";
        $('.ftype').each(function(){
            var ft_txt = $(this).val();
            if(ft_txt!=""){
                ftype_txt = ftype_txt + "";    
            }else{
                flag=0;
                err_msg = err_msg + "食品类型没有选择。";
            }
        });

        $('.fid').each(function(){
            var ft_txt = $(this).val();
            if(ft_txt!=""){
                ftype_txt = ftype_txt + "";    
            }else{
                flag=0;
                err_msg = err_msg + "食品名称没有选择。";
            }
        });

        $('.num').each(function(){
            var ft_txt = $(this).val();
            if(ft_txt!=""&&!isNaN(ft_txt)){
                ftype_txt = ftype_txt + "";    
            }else{
                flag=0;
                err_msg = err_msg + "食品配额数量没有填写或填写有误。";
            }
        });
    }
</script>