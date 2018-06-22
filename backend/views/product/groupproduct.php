<?php

use yii\helpers\Html;
use job\lib\JobGridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\ProductSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Products';
$this->params['breadcrumbs'][] = '发货完成基准价';
?>
<div class="product-index">
    <div class="widget-box">
        <div class="widget-header">
            <h4>查询条件</h4>
        </div>
        <div class="widget-body">
            <div class="widget-main">
                <?php echo $this->render('_searchgp', ['model' => $searchModel]); ?>
            </div>
        </div>
    </div>
    <?= JobGridView::widget([
        'dataProvider' => $dataProvider,
        'summary'=>'',
        'columns' => [
            ['class' => 'yii\grid\SerialColumn','header' => '序号'],
            //'customer',
            [
                'attribute' => 'arrive_date',
                'value'     => function($model) {return date("Y-m-d",$model->arrive_date);},
            ],
            [
                'attribute' => 'total_price',
                'value'     => function($model) {return (empty($model->total_price)?"-":("￥".$model->total_price.'元'));},
            ],
            [
                'attribute' => 'is_customer',
                'label' => '单位',
                'value' => function($model){
                    return $model->is_customer == 1?$model->customer:'本单位';
                }
            ],
            'booker_user',
            [
                'attribute' => 'book_date',
                'value'     => function($model) {return date("Y-m-d",$model->book_date);},
            ],
            'sender_user',
            [
                'attribute' => 'send_date',
                'value'     => function($model) {return (empty($model->send_date)?"-":date("Y-m-d",$model->send_date));},
            ],
            'inspector_user',
            [
                'attribute' => 'inspect_date',
                'value'     => function($model) {return (empty($model->inspect_date)?"-":date("Y-m-d",$model->inspect_date));},
            ],
            [   'class' => 'yii\grid\ActionColumn',
                'header' => '明细',
                'template' => ' {groupproductdetail}',
                'buttons' => [
                    'groupproductdetail' => function ($url, $model, $key) {
                        $options = [
                            'title' => '查看',
                            'aria-label' => Yii::t('yii', 'view'),
                            'data-pjax' => '0',
                            'class' => 'btn btn-xs btn-warning',
                        ];
                        return Html::a('<i class="icon-zoom-in  bigger-120"></i>', $url,$options);
                    },
                ]
            ],
        ],
    ]); ?>
</div>
