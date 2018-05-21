<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\PurchaseSearch */
/* @var $form yii\widgets\ActiveForm */
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
    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'foodclass_id') ?>

    <?= $form->field($model, 'food_id') ?>

    <?= $form->field($model, 'param_id') ?>

    <?= $form->field($model, 'book_count') ?>

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
