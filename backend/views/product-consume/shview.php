<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model backend\models\ProductConsume */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Product Consumes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-consume-view">

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'productclass.nm:text:成品类型',
            'product.nm:text:成品名称',
            'count',
            [
                'attribute' => 'consume_type',
                'value' => function($model){
                    return $model->consume_type == 1?'销售':'损耗';
                }
            ],
            'statustext:html',
            'create_dt:datetime',
        ],
    ]) ?>
    <div class="form-group">
    <?php
    if($error == 1){
    ?>
    <div style="color:red;padding-bottom:10px ">报损数据超过消耗数量，无法通过审核</div>
    <?php
    }
    if(empty($sh)){
        echo Html::a('返回',Url::toRoute("index"),['class'=>'btn btn-primary']);
    }else{
        echo Html::a('审核通过',Url::toRoute(["dosh",'sh'=>1,'id'=>$model->id]),['class'=>'btn btn-success'])."&nbsp&nbsp"; 
        echo Html::a('返回',Url::toRoute("sh"),['class'=>'btn btn-primary']);
    }

    ?>
    </div>
</div>
