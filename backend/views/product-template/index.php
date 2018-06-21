<?php

use yii\helpers\Html;
use job\lib\JobGridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\ProductTemplateSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Product Templates';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-template-index">
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
<?= JobGridView::widget([
    'dataProvider' => $dataProvider,
    'summary'=>'',
    'columns' => [
        ['class' => 'yii\grid\SerialColumn','header' => '序号'],
        'productclass.nm:text:成品类型',
        'product.nm:text:成品名称',
        'unitprice',
        'unitinfo.nm:text:单位',
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
