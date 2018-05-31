<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\ProductSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Products';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Product', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'booker_user',
            'book_date',
            'book_comment',
            'arrive_date',
            // 'is_customer',
            // 'total_price',
            // 'sender_user',
            // 'send_date',
            // 'send_status',
            // 'send_comment:ntext',
            // 'inspector_user',
            // 'inspect_date',
            // 'inspect_status',
            // 'inspect_comment:ntext',
            // 'is_del',
            // 'customer',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
