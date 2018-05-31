<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\ProductSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'booker_user') ?>

    <?= $form->field($model, 'book_date') ?>

    <?= $form->field($model, 'book_comment') ?>

    <?= $form->field($model, 'arrive_date') ?>

    <?php // echo $form->field($model, 'is_customer') ?>

    <?php // echo $form->field($model, 'total_price') ?>

    <?php // echo $form->field($model, 'sender_user') ?>

    <?php // echo $form->field($model, 'send_date') ?>

    <?php // echo $form->field($model, 'send_status') ?>

    <?php // echo $form->field($model, 'send_comment') ?>

    <?php // echo $form->field($model, 'inspector_user') ?>

    <?php // echo $form->field($model, 'inspect_date') ?>

    <?php // echo $form->field($model, 'inspect_status') ?>

    <?php // echo $form->field($model, 'inspect_comment') ?>

    <?php // echo $form->field($model, 'is_del') ?>

    <?php // echo $form->field($model, 'customer') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
