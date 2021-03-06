<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use backend\models\Refcode;
/* @var $this yii\web\View */
/* @var $model backend\models\Purchase */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Purchases', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="purchase-view">

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            [
                'attribute' => 'foodclass_id',
                'value'     => function($model) use($refcode){
                    if(array_key_exists($model->foodclass_id, $refcode))
                        return $refcode[$model->foodclass_id];
                },
            ],
            [
                'attribute' => 'food_id',
                'value'     => function($model) use($refcode){
                    $food = Refcode::getFoodbyid($model->food_id);
                    return $food;
                },
            ],
            [
                'attribute' => 'param_id',
                'value'     => function($model) use($refcode){
                    if(array_key_exists($model->param_id, $refcode))
                        return $refcode[$model->param_id];
                },
            ],
            'book_count',
            'price',
            [
                'attribute' => 'brand',
                'value'     => function($model) use($refcode){
                    if(array_key_exists($model->brand, $refcode))
                        return $refcode[$model->brand];
                },
            ],
            [
                'attribute' => 'supplier',
                'value'     => function($model) use($refcode){
                    if(array_key_exists($model->supplier, $refcode))
                        return $refcode[$model->supplier];
                },
            ],
            'pur_user',
            [
                'attribute' => 'pur_date',
                'value'     => function($model) {return date("Y-m-d",$model->pur_date);},
            ],
            'statustext:html',
            'depot_user',
            'depot_count',
            [
                'attribute' => 'depot_date',
                'value'     => function($model) {
                    if($model->depot_date)
                        return date("Y-m-d",$model->depot_date);
                },
            ],
            'sycount',                      
            'comment:ntext',
        ],
    ]) ?>
    <div class="form-group">
    <?=  Html::a('返回',Url::toRoute("depot"),['class'=>'btn btn-primary'])?>
    </div>
</div>
