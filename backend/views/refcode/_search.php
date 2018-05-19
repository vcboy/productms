<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\RefcodeSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="refcode-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'fieldConfig' => [
            'template' => "<div>{label} {input}</div>",
            'labelOptions' => ['style' => 'width:60px;'],
        ],
    ]); ?>
    <div class="tabfield">
    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'nm') ?>

    <?= $form->field($model, 'value') ?>

    <?= $form->field($model, 'type') ?>

    <?= $form->field($model, 'is_del') ?>

    </div>
    <div class="form-group">
        <?= Html::submitButton("查询", ["class" =>"btn btn-sm btn-primary"]) ?>
        <?= Html::a('重置', ['index'], ['class' => 'btn btn-sm btn-primary']) ?>
        <?= Html::a('添加', ['create'], ['class' => 'btn btn-sm btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
