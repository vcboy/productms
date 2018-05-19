<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Refcode */
/* @var $form yii\widgets\ActiveForm */
?>
<div class="page-header">
    <h1><?=($model -> isNewRecord)?'添加'.$type_name:'修改'.$type_name;?></h1>
</div>
<div class="refcode-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'nm')->textInput(['maxlength' => true]) ?>

    <?
    if($type_code == 'food')
        echo $form->field($model, 'value')->label('预警值')->textInput(['maxlength' => true]);
    ?>

    <?//= $form->field($model, 'type')->textInput(['maxlength' => true]) ?>

    <?//= $form->field($model, 'is_del')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '添加' : '修改', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
