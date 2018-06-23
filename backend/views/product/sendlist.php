<?php

use yii\helpers\Html;
use job\lib\JobGridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\ProductSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Products';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-index">
    <div class="widget-box">
        <div class="widget-header">
            <h4>查询条件</h4>
        </div>
        <div class="widget-body">
            <div class="widget-main">
                <?php echo $this->render('_searchsend', ['model' => $searchModel]); ?>
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
                'value'     => function($model) {return date("Y-m-d H:i",$model->arrive_date);},
            ],
            [
                'attribute' => 'is_customer',
                'label' => '客户',
                'value' => function($model){
                    return $model->is_customer == 1?$model->customer:'本单位';
                }
            ],
            'booker_user',
            [
                'attribute' => 'book_date',
                'value'     => function($model) {return date("Y-m-d",$model->book_date);},
            ],
            //'book_comment',
            'sender_user',
            [
                'attribute' => 'send_date',
                'value'     => function($model) {return (empty($model->send_date)?"-":date("Y-m-d",$model->send_date));},
            ],
            //'send_comment',
            'statustext:html:是否发货',
            /*[
                'attribute' => 'send_status',
                'label' => '是否发货',
                'value' => function($model){
                    return $model->send_status == 1?'已发货':'未发货';
                }
            ],*/
            [   'class' => 'yii\grid\ActionColumn',
                'header' => '操作',
                'template' => '{send} {view}',
                'buttons' => [
                    'send' => function ($url, $model, $key) {
                        $options = [
                            'title' => '发货',
                            'aria-label' => Yii::t('yii', 'Update'),
                            'data-pjax' => '0',
                            'class' => 'btn btn-xs btn-info',
                        ];
                        $r_txt = "";
                        if(empty($model->send_status)){
                            $r_txt = Html::a('<i class="icon-road  bigger-120"></i>', $url, $options);
                        }
                        return $r_txt;
                    },
                    'view' => function ($url, $model, $key) {
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
