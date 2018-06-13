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
                <?php echo $this->render('_searchinspector', ['model' => $searchModel]); ?>
            </div>
        </div>
    </div>
    <?= JobGridView::widget([
        'dataProvider' => $dataProvider,
        'summary'=>'',
        'columns' => [
            ['class' => 'yii\grid\SerialColumn','header' => '序号'],
            'customer',
            [
                'attribute' => 'arrive_date',
                'value'     => function($model) {return date("Y-m-d",$model->arrive_date);},
            ],
            [
                'attribute' => 'is_customer',
                'label' => '是否本单位',
                'value' => function($model){
                    return $model->is_customer == 1?'其他单位':'本单位';
                }
            ],
            'sender_user',
            [
                'attribute' => 'send_date',
                'value'     => function($model) {return (empty($model->send_date)?"-":date("Y-m-d",$model->send_date));},
            ],
            'send_comment',
            'inspector_user',
            [
                'attribute' => 'inspect_date',
                'value'     => function($model) {return (empty($model->inspect_date)?"-":date("Y-m-d",$model->inspect_date));},
            ],
            'inspect_comment',
            [
                'attribute' => 'inspect_status',
                'label' => '是否验收',
                'value' => function($model){
                    return $model->inspect_status == 1?'已验收':'未验收';
                }
            ],
            [   'class' => 'yii\grid\ActionColumn',
                'header' => '操作',
                'template' => '{inspector} {view}',
                'buttons' => [
                    'inspector' => function ($url, $model, $key) {
                        $options = [
                            'title' => '验收',
                            'aria-label' => Yii::t('yii', 'Update'),
                            'data-pjax' => '0',
                            'class' => 'btn btn-xs btn-success',
                        ];
                        $r_txt = "";
                        if(empty($model->inspect_status)){
                            $r_txt = Html::a('<i class="icon-bookmark  bigger-120"></i>', $url, $options);
                        }
                        return $r_txt;
                    },
                    'view' => function ($url, $model, $key) {
                        $options = [
                            'title' => '查看',
                            'aria-label' => Yii::t('yii', 'view'),
                            //'data-confirm' => Yii::t('yii', '确认删除？'),
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
