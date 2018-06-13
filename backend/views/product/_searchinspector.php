<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\ProductSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-search">

    <?php $form = ActiveForm::begin([
        'action' => ['inspectorlist'],
        'method' => 'get',
    ]); ?>
    <div class="tabfield">

    <?= $form->field($model, 'customer')->label('配送客户') ?>
    
    <?= $form->field($model, 'send_date')->label('发货时间')->textInput(['maxlength' => true,'onfocus' => 'WdatePicker({dateFmt:"yyyy-MM-dd"})']) ?>
    <?= $form->field($model, 'inspect_date')->label('验收时间')->textInput(['maxlength' => true,'onfocus' => 'WdatePicker({dateFmt:"yyyy-MM-dd"})']) ?>
    </div>
    <div class="form-group">
        <?= Html::submitButton("查询", ["class" =>"btn btn-sm btn-primary"]) ?>
    </div>
    <?php ActiveForm::end(); ?>

</div>
