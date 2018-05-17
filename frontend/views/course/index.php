<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel frontend\models\LcCourseSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '全部课程';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lc-course-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Lc Course', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            [
                'class' => 'yii\grid\SerialColumn',
                'header' => '序号',
            ],
            //'tag',
           // 'cid',
            'code',
            'name',
             'name_short',
            // 'desc_short',
            [
               'attribute' => 'total_time',
               'label' => '总时长',
               'value' => function($params) {
                    if(is_numeric($params->total_time)){
                        $h = ($params -> total_time - $params -> total_time % 3600)/3600;
                        $s = $params -> total_time % 60;
                        $m = ($params -> total_time % 3600 - $s) / 60;
                        $t = '';
                        if($h < 10){
                            $t .= empty($h)?'00':'0'.$h;
                        }else{
                            $t .= $h;
                        }
                        if($m < 10){
                            $t .= empty($m)?':00':':0'.$m;
                        }else{
                            $t .= ':'.$m;
                        }
                        if($s < 10){
                            $t .= empty($s)?':00':':0'.$s;
                        }else{
                            $t .= ':'.$s;
                        }
                        return $params -> total_time = $t;
                    }
                }
             ],
             'img',
            // 'item_count',
             'class_time',
             'price',
            // 'rprice',
            // 'video_express',
            // 'teacher_names',
            // 'teacher_ids',
            // 'create_date',
            // 'update_date',
            // 'credit',
            // 'classtype',
            // 'isdelete',
            // 'type',
            // 'exam_type',
            // 'liberty_type',
            // 'course_tag',
            // 'course_lecturer',
            // 'class_id',
            // 'courseclass_id',
            // 'isfree',
            // 'source',
            // 'ishot',
            // 'isbest',
            // 'isnew',
            // 'weights',
            // 'sellnum',
            // 'corder',
            // 'owner_type',
            // 'owner',
            // 'rprice2',
            // 'rprice3',
            // 'order_amount',
            // 'order_stu',
            // 'share_type',
            // 'share_ratio',
            // 'desc_catalog:ntext',
            // 'status',
            // 'is_show',
            // 'study_num',
            // 'try_see_num',
            [
                'class' => 'yii\grid\ActionColumn',
            ],
        ],
    ]); ?>

</div>
