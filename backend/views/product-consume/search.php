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
			                <?php echo $this->render('_searchconsume', ['model' => $searchModel,'sh'=>false]); ?>
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
            'avgprice:text:销售均价',           
            'totalcount:text:销售总数',
            'totalprice:text:总销售额',
            [
                'class' => 'yii\grid\ActionColumn',
                'header' => '操作',
                'template' => '{view}',
                'buttons' => [
                    'view' => function($url,$model) use($searchModel){
                        $options = [
                            'title' => '查看',
                            'aria-label' => Yii::t('yii', 'View'),
                            'data-pjax' => '0',
                            'class' => 'btn-xs btn btn-warning',
                        ];
                        $url = Url::to(['index','product_id'=>$model->product_id,'productclass_id'=>$model->productclass_id,'status'=>1,'consume_type'=>$searchModel->consume_type,'create_dt_s'=>$searchModel->create_dt_s,'create_dt_e'=>$searchModel->create_dt_e]);                        
                        return Html::a('<i class="icon-zoom-in bigger-120"></i>', $url, $options);
                    },
                ]
            ],
         ],
    ]); ?>

</div>
