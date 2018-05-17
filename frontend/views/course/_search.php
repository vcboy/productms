<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\models\LcCourseSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="lc-course-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'tag') ?>

    <?= $form->field($model, 'cid') ?>

    <?= $form->field($model, 'code') ?>

    <?= $form->field($model, 'name') ?>

    <?php // echo $form->field($model, 'name_short') ?>

    <?php // echo $form->field($model, 'desc_short') ?>

    <?php // echo $form->field($model, 'desc_long') ?>

    <?php // echo $form->field($model, 'img') ?>

    <?php // echo $form->field($model, 'item_count') ?>

    <?php // echo $form->field($model, 'total_time') ?>

    <?php // echo $form->field($model, 'class_time') ?>

    <?php // echo $form->field($model, 'price') ?>

    <?php // echo $form->field($model, 'rprice') ?>

    <?php // echo $form->field($model, 'video_express') ?>

    <?php // echo $form->field($model, 'teacher_names') ?>

    <?php // echo $form->field($model, 'teacher_ids') ?>

    <?php // echo $form->field($model, 'create_date') ?>

    <?php // echo $form->field($model, 'update_date') ?>

    <?php // echo $form->field($model, 'credit') ?>

    <?php // echo $form->field($model, 'classtype') ?>

    <?php // echo $form->field($model, 'memo') ?>

    <?php // echo $form->field($model, 'isdelete') ?>

    <?php // echo $form->field($model, 'type') ?>

    <?php // echo $form->field($model, 'exam_type') ?>

    <?php // echo $form->field($model, 'liberty_type') ?>

    <?php // echo $form->field($model, 'course_tag') ?>

    <?php // echo $form->field($model, 'course_lecturer') ?>

    <?php // echo $form->field($model, 'class_id') ?>

    <?php // echo $form->field($model, 'courseclass_id') ?>

    <?php // echo $form->field($model, 'isfree') ?>

    <?php // echo $form->field($model, 'source') ?>

    <?php // echo $form->field($model, 'ishot') ?>

    <?php // echo $form->field($model, 'isbest') ?>

    <?php // echo $form->field($model, 'isnew') ?>

    <?php // echo $form->field($model, 'weights') ?>

    <?php // echo $form->field($model, 'sellnum') ?>

    <?php // echo $form->field($model, 'corder') ?>

    <?php // echo $form->field($model, 'owner_type') ?>

    <?php // echo $form->field($model, 'owner') ?>

    <?php // echo $form->field($model, 'rprice2') ?>

    <?php // echo $form->field($model, 'rprice3') ?>

    <?php // echo $form->field($model, 'order_amount') ?>

    <?php // echo $form->field($model, 'order_stu') ?>

    <?php // echo $form->field($model, 'share_type') ?>

    <?php // echo $form->field($model, 'share_ratio') ?>

    <?php // echo $form->field($model, 'desc_catalog') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'is_show') ?>

    <?php // echo $form->field($model, 'study_num') ?>

    <?php // echo $form->field($model, 'try_see_num') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
