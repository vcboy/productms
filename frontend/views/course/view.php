<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model frontend\models\LcCourse */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Lc Courses', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lc-course-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'tag',
            'cid',
            'code',
            'name',
            'name_short',
            'desc_short',
            'desc_long:ntext',
            'img',
            'item_count',
            'total_time:datetime',
            'class_time:datetime',
            'price',
            'rprice',
            'video_express',
            'teacher_names',
            'teacher_ids',
            'create_date',
            'update_date',
            'credit',
            'classtype',
            'memo',
            'isdelete',
            'type',
            'exam_type',
            'liberty_type',
            'course_tag',
            'course_lecturer',
            'class_id',
            'courseclass_id',
            'isfree',
            'source',
            'ishot',
            'isbest',
            'isnew',
            'weights',
            'sellnum',
            'corder',
            'owner_type',
            'owner',
            'rprice2',
            'rprice3',
            'order_amount',
            'order_stu',
            'share_type',
            'share_ratio',
            'desc_catalog:ntext',
            'status',
            'is_show',
            'study_num',
            'try_see_num',
        ],
    ]) ?>

</div>
