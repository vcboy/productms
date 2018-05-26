<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\ProductConsumeSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-consume-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>
    <div class="tabfield">
    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'productclass_id') ?>

    <?= $form->field($model, 'product_id') ?>

    <?= $form->field($model, 'unitprice') ?>

    <?= $form->field($model, 'price') ?>

    <?php // echo $form->field($model, 'count') ?>

    <?php // echo $form->field($model, 'consume_type') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'create_dt') ?>

    </div>
    <div class="form-group">
        <?= Html::submitButton("查询", ["class" =>"btn btn-sm btn-primary"]) ?>
        <?= Html::a('重置', ['index'], ['class' => 'btn btn-sm btn-primary']) ?>
        <?= Html::a('添加', ['create'], ['class' => 'btn btn-sm btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
