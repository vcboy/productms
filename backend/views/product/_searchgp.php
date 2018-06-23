<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\ProductSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-search">

    <?php $form = ActiveForm::begin([
        'action' => ['groupproduct'],
        'method' => 'get',
        'fieldConfig' => [
            'template' => "<div>{label} {input}</div>",
            'labelOptions' => ['style' => 'width:60px;'],
        ],
    ]); ?>
    <div class="tabfield">

    <?= $form->field($model, 'customer')->label('配送客户') ?>
    <?= $form->field($model, 'dt_s')->label('开始时间')->textInput(['maxlength' => true,'onfocus' => 'WdatePicker({dateFmt:"yyyy-MM-dd"})']) ?>
    <?= $form->field($model, 'dt_e')->label('结束时间')->textInput(['maxlength' => true,'onfocus' => 'WdatePicker({dateFmt:"yyyy-MM-dd"})']) ?>
    </div>
    <div class="form-group">
        <?= Html::submitButton("查询", ["class" =>"btn btn-sm btn-primary"]) ?>
    </div>
    <?php ActiveForm::end(); ?>

</div>
