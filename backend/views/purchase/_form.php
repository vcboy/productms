<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
use backend\models\Refcode;

/* @var $this yii\web\View */
/* @var $model backend\models\Purchase */
/* @var $form yii\widgets\ActiveForm */
$foodclasslist = Refcode::getRefcodeBytype('foodclass');
$brandlist = Refcode::getRefcodeBytype('brand');
$supplierlist = Refcode::getRefcodeBytype('supplier');
$foodunitlist = Refcode::getRefcodeBytype('foodunit');
$foodlist = $paramlist = [];
if($model->foodclass_id){
    $foodlist = Refcode::getFood($model->foodclass_id);
}
if($model->food_id){
    $paramlist = Refcode::getFood($model->food_id);
}

?>
<div class="page-header">
    <h1><?=$this->title?></h1>
</div>
<div class="purchase-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'foodclass_id')->dropDownList(array(''=>'--请选择--')+$foodclasslist,['id'=>'foodclass_id']) ?>

    <?= $form->field($model, 'food_id')->dropDownList(array(''=>'--请选择--')+$foodlist,['id'=>'food_id']) ?>

    <?= $form->field($model, 'param_id')->dropDownList(array(''=>'--请选择--')+$paramlist,['id'=>'param_id']) ?>

    <?= $form->field($model, 'book_count')->textInput() ?>

    <?= $form->field($model, 'price')->textInput() ?>


    <?= $form->field($model, 'brand')->dropDownList(array(''=>'--请选择--')+$brandlist) ?>

    <?= $form->field($model, 'supplier')->dropDownList(array(''=>'--请选择--')+$supplierlist) ?>

    <?= $form->field($model, 'pur_user')->textInput(['value'=>$model->pur_user?$model->pur_user:Yii::$app->user->identity->name,'readonly'=>true]) ?>

    <?= $form->field($model, 'pur_date')->textInput(['maxlength' => true,'onfocus' => 'WdatePicker({dateFmt:"yyyy-MM-dd"})','value'=>$model->pur_date]) ?>



    <div class="form-group">
    <?=  Html::submitButton($model->isNewRecord ? '保存' : '更新', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    <?=  Html::a('返回',Url::toRoute("index"),['class'=>'btn btn-primary'])?>
    </div>
    
    <?php ActiveForm::end(); ?>

</div>
<script type="text/javascript">
    $(document).ready(function(){
        $("#foodclass_id").change(function(){
            var foodclass_id = $(this).val();
            var Content = {foodclass_id: foodclass_id};
            var url = "<?=Url::to(['getfood'])?>";
            $.post(url,Content,function(rsp){
                if(rsp){
                    var obj = JSON.parse(rsp);
                    console.log(obj);
                    var optionstr = '<option value="">--请选择--</option>';
                    for(var i in obj){
                        optionstr+="<option value="+i+">"+obj[i]+"</option>";
                    }
                    $("#food_id option").remove();
                    $("#food_id").append(optionstr);

                    $("#param_id option").remove();
                    $("#param_id").append('<option value="">--请选择--</option>');
                }
            })
        });

        $("#food_id").change(function(){
            var foodclass_id = $(this).val();
            var Content = {foodclass_id: foodclass_id};
            var url = "<?=Url::to(['getfood'])?>";
            $.post(url,Content,function(rsp){
                if(rsp){
                    var obj = JSON.parse(rsp);
                    console.log(obj);
                    var optionstr = '<option value="">--请选择--</option>';
                    for(var i in obj){
                        optionstr+="<option value="+i+">"+obj[i]+"</option>";
                    }
                    $("#param_id option").remove();
                    $("#param_id").append(optionstr);
                }
            })
        });
    })
</script>