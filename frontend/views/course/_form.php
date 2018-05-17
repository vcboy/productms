<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\models\LcCourse */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="lc-course-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'tag')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cid')->textInput() ?>

    <?= $form->field($model, 'code')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'name_short')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'desc_short')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'desc_long')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'img')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'item_count')->textInput() ?>

    <?= $form->field($model, 'total_time')->textInput() ?>

    <?= $form->field($model, 'class_time')->textInput() ?>

    <?= $form->field($model, 'price')->textInput() ?>

    <?= $form->field($model, 'rprice')->textInput() ?>

    <?= $form->field($model, 'video_express')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'teacher_names')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'teacher_ids')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'create_date')->textInput() ?>

    <?= $form->field($model, 'update_date')->textInput() ?>

    <?= $form->field($model, 'credit')->textInput() ?>

    <?= $form->field($model, 'classtype')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'memo')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'isdelete')->textInput() ?>

    <?= $form->field($model, 'type')->textInput() ?>

    <?= $form->field($model, 'exam_type')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'liberty_type')->textInput() ?>

    <?= $form->field($model, 'course_tag')->textInput() ?>

    <?= $form->field($model, 'course_lecturer')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'class_id')->textInput() ?>

    <?= $form->field($model, 'courseclass_id')->textInput() ?>

    <?= $form->field($model, 'isfree')->textInput() ?>

    <?= $form->field($model, 'source')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ishot')->textInput() ?>

    <?= $form->field($model, 'isbest')->textInput() ?>

    <?= $form->field($model, 'isnew')->textInput() ?>

    <?= $form->field($model, 'weights')->textInput() ?>

    <?= $form->field($model, 'sellnum')->textInput() ?>

    <?= $form->field($model, 'corder')->textInput() ?>

    <?= $form->field($model, 'owner_type')->textInput() ?>

    <?= $form->field($model, 'owner')->textInput() ?>

    <?= $form->field($model, 'rprice2')->textInput() ?>

    <?= $form->field($model, 'rprice3')->textInput() ?>

    <?= $form->field($model, 'order_amount')->textInput() ?>

    <?= $form->field($model, 'order_stu')->textInput() ?>

    <?= $form->field($model, 'share_type')->textInput() ?>

    <?= $form->field($model, 'share_ratio')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'desc_catalog')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'status')->textInput() ?>

    <?= $form->field($model, 'is_show')->textInput() ?>

    <?= $form->field($model, 'study_num')->textInput() ?>

    <?= $form->field($model, 'try_see_num')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
