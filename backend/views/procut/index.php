<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\ProcutSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Procuts';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="procut-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Procut', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'booker_id',
            'book_date',
            'book_comment',
            'arrive_date',
            // 'is_customer',
            // 'total_price',
            // 'sender_id',
            // 'send_date',
            // 'send_status',
            // 'send_comment:ntext',
            // 'inspector_id',
            // 'inspect_date',
            // 'inspect_status',
            // 'inspect_comment:ntext',
            // 'is_del',
            // 'customer',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
