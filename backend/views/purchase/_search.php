<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
use backend\models\Refcode;

/* @var $this yii\web\View */
/* @var $model backend\models\PurchaseSearch */
/* @var $form yii\widgets\ActiveForm */
$foodclasslist = Refcode::getRefcodeBytype('foodclass');
$foodlist = $paramlist = [];
if($model->foodclass_id){
    //$foodlist = Refcode::getRefcodeBytype('food');
    $foodlist = Refcode::getFood($model->foodclass_id);
}
if($model->food_id){
    $paramlist = Refcode::getFood($model->food_id);
}
?>

<div class="purchase-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'fieldConfig' => [
            'template' => "<div>{label} {input}</div>",
            'labelOptions' => ['style' => 'width:60px;'],
        ],
    ]); ?>
    <div class="tabfield">
    <?//= $form->field($model, 'id') ?>

    <?= $form->field($model, 'foodclass_id')->dropDownList(array(''=>'--请选择--')+$foodclasslist,['id'=>'foodclass_id']) ?>

    <?= $form->field($model, 'food_id')->dropDownList(array(''=>'--请选择--')+$foodlist,['id'=>'food_id']) ?>

    <?= $form->field($model, 'param_id')->dropDownList(array(''=>'--请选择--')+$paramlist,['id'=>'param_id']) ?>

    <?//= $form->field($model, 'pur_date') ?>
    <?= $form->field($model, 'pur_date')->textInput(['maxlength' => true,'onfocus' => 'WdatePicker({dateFmt:"yyyy-MM-dd"})']) ?>

    <?php // echo $form->field($model, 'price') ?>

    <?php // echo $form->field($model, 'unit') ?>

    <?php // echo $form->field($model, 'brand') ?>

    <?php // echo $form->field($model, 'supplier') ?>

    <?php // echo $form->field($model, 'pur_user') ?>

    <?php // echo $form->field($model, 'pur_date') ?>

    <?php // echo $form->field($model, 'depot_user') ?>

    <?php // echo $form->field($model, 'depot_count') ?>

    <?php // echo $form->field($model, 'depot_date') ?>

    <?php // echo $form->field($model, 'sycount') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'comment') ?>

    <?php // echo $form->field($model, 'is_del') ?>

    </div>
    <div class="form-group">
        <?= Html::submitButton("查询", ["class" =>"btn btn-sm btn-primary"]) ?>
        <?= Html::a('重置', ['index'], ['class' => 'btn btn-sm btn-primary']) ?>
        <?= Html::a('添加', ['create'], ['class' => 'btn btn-sm btn-success']) ?>
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
                    //JSON.pase()
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
                    //JSON.pase()
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