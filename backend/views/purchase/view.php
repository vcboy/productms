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
                    //return $refcode[$model->food_id];
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
            //'unit',
            //'brand',
            [
                'attribute' => 'brand',
                'value'     => function($model) use($refcode){
                    if(array_key_exists($model->brand, $refcode))
                        return $refcode[$model->brand];
                },
            ],
            //'supplier',
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
            //'depot_user',
            //'depot_count',
            //'depot_date',
            //'sycount',
            'statustext:html',
            
            //'comment:ntext',
            //'is_del',
        ],
    ]) ?>
    <div class="form-group">
    <?=  Html::a('返回',Url::toRoute("index"),['class'=>'btn btn-primary'])?>
    </div>
</div>
