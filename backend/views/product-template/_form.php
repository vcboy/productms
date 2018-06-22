<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use backend\models\Refcode;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model backend\models\ProductTemplate */
/* @var $form yii\widgets\ActiveForm */
$productclasslist = Refcode::getRefcodeBytype('productclass');
$productunitlist = Refcode::getRefcodeBytype('productunit');
$foodclasslist = Refcode::getRefcodeBytype('foodclass');
$productlist = [];
if(!empty($model->productclass_id)){
    $productlist = ArrayHelper::map(Refcode::find()->andWhere(['pid'=>$model->productclass_id,'is_del'=>0])->all(),'id','nm');
}
?>
<div class="page-header">
    <h1><?=$this->title?></h1>
</div>

<div class="product-template-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'productclass_id')->dropDownList(array(''=>'--请选择--')+$productclasslist,['id'=>'productclass_id']) ?>

    <?= $form->field($model, 'product_id')->dropDownList(array(''=>'--请选择--')+$productlist,['id'=>'product_id']) ?>

    <?= $form->field($model, 'unitprice')->textInput(['readonly'=>'readonly']) ?>

    <?= $form->field($model, 'unit')->dropDownList(array(''=>'--请选择--')+$productunitlist,['id'=>'unit']) ?>

    <input type="hidden" name="ftype_txt" id="ftype_txt">
    <input type="hidden" name="food_txt" id="food_txt">
    <input type="hidden" name="fnum_txt" id="fnum_txt">
    <table class="table table-striped table-bordered" id="food_tb">
        <tr><th colspan="4"><?=  Html::a('添加食材配额','#',['class'=>'btn btn-sm btn-success','onclick'=>'_addPurchase()'])?></th></tr>
        <tr><th>食材分类</th><th>食材名称</th><th>食材数量</th><th class="action-column">操作</th></tr>
        <?=$pte_arr_txt?>
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
        var txt = "<tr id='tr_"+temp+"'><td><select class='ftype form-control' onchange='_changeFtype(this,"+temp+")'><option value=''>--请选择--</option><?php foreach ($foodclasslist as $key => $val) { echo "<option value='".$key."'>".$val."</option>"; } ?></select></td><td><select class='form-control fid food_"+temp+"' onchange='_getUnitprice()'><option value=''>--请选择--</option></select></td><td><input class='form-control num num_"+temp+"' onchange='_getUnitprice()'></td><td><button type='button' class='btn btn-xs btn-danger' title='删除' aria-label='删除' data-pjax='0' onclick='_deltr(\""+temp+"\")'><i class='icon-trash bigger-120'></i></button></td></tr>";
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
        var foodclass_id = $(obj).val();
        var Content = {foodclass_id: foodclass_id};
        var url = "<?=Url::to(['purchase/getfood'])?>";
        $.post(url,Content,function(rsp){
            if(rsp){
                var obj = JSON.parse(rsp);
                var optionstr = '<option value="">--请选择--</option>';
                for(var i in obj){
                    optionstr+="<option value="+i+">"+obj[i]+"</option>";
                }
                $(".food_"+tempkey+" option").remove();
                $(".food_"+tempkey).append(optionstr);
            }
        });
    }

    function _checkSub(){
        _getUnitprice();
        var flag = 1;
        var ftype_txt = "";
        var food_txt = "";
        var fnum_txt = "";
        var err_msg = "";
        if($('.ftype').size()>0){
            $('.ftype').each(function(){
                var ft_txt = $(this).val();
                if(ft_txt!=""){
                    ftype_txt = ftype_txt + ft_txt + ",";    
                }else{
                    flag=0;
                    err_msg = err_msg + "食品类型没有选择。\n";
                }
            });

            $('.fid').each(function(){
                var ft_txt = $(this).val();
                if(ft_txt!=""){
                    food_txt = food_txt + ft_txt + ",";    
                }else{
                    flag=0;
                    err_msg = err_msg + "食品名称没有选择。\n";
                }
            });

            $('.num').each(function(){
                var ft_txt = $(this).val();
                if(ft_txt!=""&&!isNaN(ft_txt)){
                    fnum_txt = fnum_txt + ft_txt + ",";    
                }else{
                    flag=0;
                    err_msg = err_msg + "食品配额数量没有填写或填写有误。\n";
                }
            });
        }else{
            flag=0;
            err_msg = err_msg + "请添加成品所需要的食材配比。\n";
        }

        var productclass_id = $('#productclass_id').val();
        var product_id = $('#product_id').val();
        var unit = $('#unit').val();

        if(productclass_id == ""){
            flag=0;
            err_msg = err_msg + "请选择成品类型。\n";
        }

        if(unit == ""){
            flag=0;
            err_msg = err_msg + "请选择成品单位。\n";
        }

        if(product_id == ""){
            flag=0;
            err_msg = err_msg + "请选择需要配比的成品。\n";
        }

        var Content = {'product_id': product_id,'id':<?=(empty($model->id)?0:$model->id)?>};

        var url = "<?=Url::to(['checksub'])?>";
        $.post(url,Content,function(rsp){
            var obj = JSON.parse(rsp);
            if(flag>0){flag = obj.flag;}
            err_msg = err_msg + obj.msg + "\n";
            if(flag==0){
                swal(err_msg);
            }else{
                $('#ftype_txt').val(ftype_txt.substring(0,ftype_txt.length-1));
                $('#food_txt').val(food_txt.substring(0,food_txt.length-1));
                $('#fnum_txt').val(fnum_txt.substring(0,fnum_txt.length-1));
                swal("保存成功", "成品模板保存成功","success");
                $('form').submit();
            }
        });
    }

    function _getUnitprice(){
        var gp_arr = "";
        $('#food_tb').find('tr').each(function(){
            var temp = $(this).attr('id');
            if(temp!=undefined){
                temp = temp.substring(3,temp.length);
                var pid = $('.food_'+temp).val()-0;
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
                    $("#producttemplate-unitprice").val(rsp);
                }
            });
        }
    }
</script>