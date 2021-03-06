<?php

use yii\helpers\Html;
use job\lib\JobGridView;
use backend\models\Admin;
use yii\helpers\Url;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\ProductConsumeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Product Consumes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-consume-index">
<div class="widget-box">
		<div class="widget-header">
			<h4>查询条件</h4>
		</div>
		<div class="widget-body">
			<div class="widget-main">
			                <?php echo $this->render('_search', ['model' => $searchModel,'sh'=>false]); ?>
            			</div>
		</div>
	</div>

    <?= JobGridView::widget([
        'dataProvider' => $dataProvider,
        'summary' => '',
        'columns' =>  [
        ['class' => 'yii\grid\SerialColumn','header' => '序号'],
            'productclass.nm:text:成品类型',
            'product.nm:text:成品名称',
            //'unitprice',           
            'count',
            'consume_count',
            //'price',
            /*[
                'attribute' => 'consume_type',
                'value' => function($model){
                    return $model->consume_type == 1?'销售':'损耗';
                }
            ],*/
            [
                'attribute' => 'create_dt',
                'value'     => function($model) {return date("Y-m-d H:i",$model->create_dt);},
            ],
            //'statustext:html',
            [
                'class' => 'yii\grid\ActionColumn',
                'header' => '报损',
                'template' => ' {update}',
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
                            'title' => '报损',
                            'aria-label' => Yii::t('yii', 'Update'),
                            'data-pjax' => '0',
							'class' => 'btn btn-xs btn-info',
                        ];
                        //if(Admin::checkAccess('consume_edit')) {
                        $url = Url::to(["product-consume/create",'id'=>$model['id'],'product_entry_id'=>$model['product_entry_id'],'productclass_id'=>$model['productclass_id'],'product_id'=>$model['product_id'],'count'=>$model['count']]);
                            return Html::a('<i class="icon-edit bigger-120"></i>', $url, $options);
                        //}
                    },
                    'delete' => function ($url, $model, $key) {
                        $options = [
                            'title' => '删除',
                            'aria-label' => Yii::t('yii', 'Delete'),
                            'data-pjax' => '0',
							'class' => 'btn btn-xs btn-danger',
                            'onclick' => 'sweetConfirmChange("确定要删除么","'.$url.'")',
                        ];
                        if(Admin::checkAccess('consume_del')) {
                            return Html::button('<i class="icon-trash bigger-120"></i>', $options);
                        }
                    },
                ]
            ],
         ],
    ]); ?>

</div>
