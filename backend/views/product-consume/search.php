<?php

use yii\helpers\Html;
use job\lib\JobGridView;
use backend\models\Admin;
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
            'unitprice',           
            'count',
            'price',
            [
                'attribute' => 'consume_type',
                'value' => function($model){
                    return $model->consume_type == 1?'销售':'损耗';
                }
            ],            
            // 'status',
            //'create_dt:date',
            [
                'attribute' => 'create_dt',
                'value'     => function($model) {return date("Y-m-d",$model->create_dt);},
            ],
            //'statustext:html',
         ],
    ]); ?>

</div>
