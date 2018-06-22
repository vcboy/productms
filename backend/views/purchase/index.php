<?php

use yii\helpers\Html;
use job\lib\JobGridView;
use backend\models\Admin;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\PurchaseSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Purchases';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="purchase-index">
    <div class="widget-box">
		<div class="widget-header">
			<h4>查询条件</h4>
		</div>
		<div class="widget-body">
			<div class="widget-main">
			                <?php echo $this->render('_search', ['model' => $searchModel,'depot'=>false]); ?>
            			</div>
		</div>
	</div>

    <?= JobGridView::widget([
        'dataProvider' => $dataProvider,
        'summary' => '',
        'columns' =>  [
        ['class' => 'yii\grid\SerialColumn','header' => '序号'],
            [
                'attribute' => 'foodclass_id',
                'value'     => function($model) use($refcode){return $refcode[$model->foodclass_id];},
            ],
            [
                'attribute' => 'food_id',
                'value'     => function($model) use($refcode){return $refcode[$model->food_id];},
            ],
            /*[
                'attribute' => 'param_id',
                'value'     => function($model) use($refcode){
                    if(array_key_exists($model->param_id, $refcode))
                        return $refcode[$model->param_id];
                    else
                        return '';
                },
            ],*/
            'book_count',
            'price',
            [
                'attribute' => 'pur_date',
                'value'     => function($model) {return date("Y-m-d",$model->pur_date);},
            ],
            'pur_user',
            'statustext:html',
            [
                'class' => 'yii\grid\ActionColumn',
                'header' => '操作',
                'template' => '{view} {update} {delete}',
                'buttons' => [
                    'view' => function($url,$model){
                        $options = [
                            'title' => '查看',
                            'aria-label' => Yii::t('yii', 'View'),
                            'data-pjax' => '0',
                            'class' => 'btn-xs btn btn-warning',
                        ];
                        return Html::a('<i class="icon-zoom-in bigger-120"></i>', $url, $options);
                    },
                    'update' => function ($url, $model, $key) {
                        $options = [
                            'title' => '修改',
                            'aria-label' => Yii::t('yii', 'Update'),
                            'data-pjax' => '0',
							'class' => 'btn btn-xs btn-info',
                        ];
                        if(Admin::checkAccess('purchase_edit')) {
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
                        if(Admin::checkAccess('purchase_del')) {
                            return Html::button('<i class="icon-trash bigger-120"></i>', $options);
                        }
                    },
                ]
            ],
         ],
    ]); ?>

</div>
