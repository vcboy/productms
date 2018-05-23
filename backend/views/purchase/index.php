<?php

use yii\helpers\Html;
use yii\grid\GridView;

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
			                <?php echo $this->render('_search', ['model' => $searchModel]); ?>
            			</div>
		</div>
	</div>

    <?= GridView::widget([
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
            [
                'attribute' => 'param_id',
                'value'     => function($model) use($refcode){return $refcode[$model->param_id];},
            ],
            //'food_id',
            //'param_id',
            'book_count',
            // 'price',
            // 'unit',
            // 'brand',
            // 'supplier',
            // 'pur_user',
            'pur_date:date',
            // 'depot_user',
            // 'depot_count',
            // 'depot_date',
            // 'sycount',
            // 'status',
            // 'comment:ntext',
            // 'is_del',

            [
                'class' => 'yii\grid\ActionColumn',
                'header' => '操作',
                'template' => '{update} {delete}',
                'buttons' => [
                    'update' => function ($url, $model, $key) {
                        $options = [
                            'title' => '修改',
                            'aria-label' => Yii::t('yii', 'Update'),
                            'data-pjax' => '0',
							'class' => 'btn btn-xs btn-info',
                        ];
                        return Html::a('<i class="icon-edit bigger-120"></i>', $url, $options);
                    },
                    'delete' => function ($url, $model, $key) {
                        $options = [
                            'title' => '删除',
                            'aria-label' => Yii::t('yii', 'Delete'),
                            //'data-confirm' => Yii::t('yii', '确认删除？'),
                            'data-pjax' => '0',
							'class' => 'btn btn-xs btn-danger',
                            'onclick' => 'sweetConfirmChange("确定要删除么","'.$url.'")',
                        ];
                        return Html::button('<i class="icon-trash bigger-120"></i>', $options);
                    },
                ]
            ],
         ],
    ]); ?>

</div>
