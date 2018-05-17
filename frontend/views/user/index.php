<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel frontend\models\JobUserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Job Users';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="job-user-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Job User', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'username',
            'password',
            'login_time',
            'sex',
            // 'level',
            // 'power',
            // 'create_time',
            // 'real_name',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
