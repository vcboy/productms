<?php

use yii\helpers\Html;
use job\lib\JobGridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\RefcodeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Refcodes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="refcode-index">

    <h1><?//= Html::encode($this->title) ?></h1>
    <?php  //echo $this->render('_search', ['model' => $searchModel]); ?>
    <?= Html::a('添加', ['create','type_code'=>$type_code], ['class' => 'btn btn-sm btn-success']) ?>

    <p>
        <?//= Html::a('Create Refcode', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= JobGridView::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn','header' => '序号'],
            'nm',
            'value',
            'type',
            'is_del',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
