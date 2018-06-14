<?php

use yii\helpers\Html;
use job\lib\JobGridView;
use yii\helpers\Url;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\ProductSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Products';
$this->params['breadcrumbs'][] = '成品库明细';
?>
<div class="product-index">
    <?= JobGridView::widget([
        'dataProvider' => $dataProvider,
        'summary'=>'',
        'columns' => [
            ['class' => 'yii\grid\SerialColumn','header' => '序号'],
            'pinfo.customer',
            [
                'attribute' => '配货时间',
                'value'     => function($model) {return date("Y-m-d",$model['pinfo']['book_date']);},
            ],
            [
                'attribute' => '发货时间',
                'value'     => function($model) {return date("Y-m-d",$model['pinfo']['send_date']);},
            ],
            [
                'attribute' => '需要达到时间',
                'value'     => function($model) {return date("Y-m-d",$model['pinfo']['arrive_date']);},
            ],
            'unitprice:text:成品单价',
            'book_count:text:入库数量',
            'price:text:本批该成品总价',
            'sycount:text:剩余库存',
            [   'class' => 'yii\grid\ActionColumn',
                'header' => '操作',
                'template' => '{view}',
                'buttons' => [
                    'view' => function ($url, $model, $key) {
                        $options = [
                            'title' => '查看',
                            'aria-label' => Yii::t('yii', 'view'),
                            'data-pjax' => '0',
                            'class' => 'btn btn-xs btn-warning',
                        ];
                        $url = Url::to(['product/view','id'=>$model['pid']]);
                        return Html::a('<i class="icon-zoom-in  bigger-120"></i>', $url,$options);
                    },
                ]
            ],
        ],
    ]); ?>
</div>
