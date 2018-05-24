<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Procut */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="procut-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'booker_id')->textInput() ?>

    <?= $form->field($model, 'book_date')->textInput() ?>

    <?= $form->field($model, 'book_comment')->textInput() ?>

    <?= $form->field($model, 'arrive_date')->textInput() ?>

    <?= $form->field($model, 'is_customer')->textInput() ?>

    <?= $form->field($model, 'total_price')->textInput() ?>

    <?= $form->field($model, 'sender_id')->textInput() ?>

    <?= $form->field($model, 'send_date')->textInput() ?>

    <?= $form->field($model, 'send_status')->textInput() ?>

    <?= $form->field($model, 'send_comment')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'inspector_id')->textInput() ?>

    <?= $form->field($model, 'inspect_date')->textInput() ?>

    <?= $form->field($model, 'inspect_status')->textInput() ?>

    <?= $form->field($model, 'inspect_comment')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'is_del')->textInput() ?>

    <?= $form->field($model, 'customer')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
