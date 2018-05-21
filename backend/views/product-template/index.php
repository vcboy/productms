<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\ProductTemplateSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Product Templates';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-template-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Product Template', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'productclass_id',
            'product_id',
            'unitprice',
            'unit',
            // 'is_del',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
