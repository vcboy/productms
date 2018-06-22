<?php

use yii\helpers\Html;
use job\lib\JobGridView;
use backend\models\Admin;

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
                <?php echo $this->render('_searchcreate', ['model' => $searchModel]); ?>
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
                'attribute' => 'is_customer',
                'label' => '客户',
                'value' => function($model){
                    return $model->is_customer == 1?'非本单位':'本单位';
                }
            ],
            'booker_user',
            [
                'attribute' => 'book_date',
                'value'     => function($model) {return date("Y-m-d",$model->book_date);},
            ],
            //'book_comment',
            [
                'attribute' => 'send_status',
                'label' => '是否发货',
                'value' => function($model){
                    return $model->send_status == 1?'已发货':'未发货';
                }
            ],
            [   'class' => 'yii\grid\ActionColumn',
                'header' => '操作',
                'template' => '{view} {copy} {update} {delete} ',
                'buttons' => [                    
                    'view' => function ($url, $model, $key) {
                        $options = [
                            'title' => '查看',
                            'aria-label' => Yii::t('yii', 'view'),
                            'data-pjax' => '0',
                            'class' => 'btn btn-xs btn-warning',
                        ];
                        return Html::a('<i class="icon-zoom-in  bigger-120"></i>', $url,$options);
                    },
                    'copy' => function ($url, $model, $key) {
                        $options = [
                            'title' => '复制',
                            'aria-label' => Yii::t('yii', 'Copy'),
                            'data-pjax' => '0',
                            'class' => 'btn btn-xs btn-success',
                        ];
                        return Html::a('<i class="icon-copy bigger-120"></i>', $url, $options);
                    },
                    'update' => function ($url, $model, $key) {
                        $options = [
                            'title' => '修改',
                            'aria-label' => Yii::t('yii', 'Update'),
                            'data-pjax' => '0',
                            'class' => 'btn btn-xs btn-info',
                        ];
                        if(Admin::checkAccess('product_edit')) {
                            return Html::a('<i class="icon-edit bigger-120"></i>', $url, $options);
                        }
                    },
                    'delete' => function ($url, $model, $key) {
                        $options = [
                            'title' => '删除',
                            'aria-label' => Yii::t('yii', 'Delete'),
                            'data-pjax' => '0',
                            'class' => 'btn btn-xs btn-danger',
                            'onclick' => 'sweetConfirmChange("确定要删除么","'.$url.'")',
                        ];
                        if(Admin::checkAccess('product_del')) {
                            return Html::button('<i class="icon-trash bigger-120"></i>', $options);
                        }
                    },                   
                ]
            ],
        ],
    ]); ?>
</div>
