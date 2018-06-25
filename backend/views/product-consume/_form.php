<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use backend\models\Refcode;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model backend\models\ProductConsume */
/* @var $form yii\widgets\ActiveForm */
$productclasslist = Refcode::getRefcodeBytype('productclass');
$productlist = [];
if(!empty($model->productclass_id)){
    $productlist = ArrayHelper::map(Refcode::find()->andWhere(['pid'=>$model->productclass_id,'is_del'=>0])->all(),'id','nm');
}
?>
<div class="page-header">
    <h1><?=$this->title?></h1>
</div>
<div class="product-consume-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'productclass_id')->dropDownList(array(''=>'--请选择--')+$productclasslist,['id'=>'productclass_id']) ?>

    <?= $form->field($model, 'product_id')->dropDownList(array(''=>'--请选择--')+$productlist,['id'=>'product_id']) ?>

    <?= $form->field($model, 'count')->textInput(['id'=>'count']) ?>

    <?= $form->field($model, 'create_user')->textInput(['value'=>$model->create_user?$model->create_user:Yii::$app->user->identity->name]) ?>

    <?= $form->field($model, 'create_dt')->textInput(['maxlength' => true,'onfocus' => 'WdatePicker({dateFmt:"yyyy-MM-dd"})','value'=>$model->create_dt]) ?>

    <div class="form-group">
    <?=  Html::submitButton($model->isNewRecord ? '保存' : '更新', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    <?=  Html::Button('返回', ['class' => 'btn btn-primary','onclick'=>'history.back();']) ?>
    </div>
    
    <?php ActiveForm::end(); ?>

</div>
<script type="text/javascript">
    $(document).ready(function(){
        <?php
        if($model->count){
            //echo "$('#count').attr('readonly',true);";
        }
        ?>
        
        $("#productclass_id").change(function(){
            var productclass_id = $(this).val();
            var Content = {productclass_id: productclass_id};
            var url = "<?=Url::to(['product-template/getproduct'])?>";
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

        $("#count").change(function(){
            var unitprice = $("#unitprice").val();
            var count = $(this).val();
            var price = 0;
            if(typeof(unitprice)!='undefind' && typeof(count)!='undefind'){
                var price = unitprice * count;
                price = price.toFixed(2);
            }
            $("#price").val(price);
        })
        $("#price").focus(function(){
            var unitprice = $("#unitprice").val();
            var count = $("#count").val();
            var price = 0;
            if(typeof(unitprice)!='undefind' && typeof(count)!='undefind'){
                var price = unitprice * count;
                price = price.toFixed(2);
            }
            $("#price").val(price);
        })
    });
</script>