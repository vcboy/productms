<?php

use yii\helpers\Html;
use job\lib\JobGridView;
use backend\models\Admin;
use yii\helpers\Url;

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
			                <?php echo $this->render('_searchfood', ['model' => $searchModel]); ?>
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
            [
                'attribute' => 'param_id',
                'value'     => function($model) use($refcode){
                    //return $refcode[$model->param_id];
                    if(array_key_exists($model->param_id, $refcode))
                        return $refcode[$model->param_id];
                    else
                        return '';
                },
            ],
            //'food_id',
            //'param_id',
            //'book_count',
            /*[
                'attribute' => 'pur_date',
                'value'     => function($model) {return date("Y-m-d",$model->pur_date);},
            ],*/
            // 'price',
            // 'unit',
            // 'brand',
            // 'supplier',
            //'pur_user',
            //'pur_date:date',
            // 'depot_user',
            //'depot_count',
            // 'depot_date',
            //'totalsycount:text:剩余库存',
            [
                'attribute' => 'totalsycount',
                'header' => '剩余库存',
                'format' => 'raw',
                'value'     => function($model) use($foodvalue) {
                    $bjvalue = 0;
                    if(array_key_exists($model->food_id, $foodvalue)){
                        $bjvalue = $foodvalue[$model->food_id];
                    }
                    if($model->totalsycount <= $bjvalue)
                        return '<font color="red">'.$model->totalsycount.'</font>';
                    else
                        return $model->totalsycount;
                },
            ],
            //'statustext:html',
            // 'comment:ntext',
            // 'is_del',
            [
                'class' => 'yii\grid\ActionColumn',
                'header' => '操作',
                'template' => '{view}',
                'buttons' => [
                    'view' => function($url,$model){
                        $options = [
                            'title' => '查看',
                            'aria-label' => Yii::t('yii', 'View'),
                            'data-pjax' => '0',
                            'class' => 'btn-xs btn btn-warning',
                        ];
                        $url = Url::to(['depot','food_id'=>$model->food_id,'foodclass_id'=>$model->foodclass_id,'status'=>1,'param_id'=>$model->param_id]);                        
                        return Html::a('<i class="icon-zoom-in bigger-120"></i>', $url, $options);
                    },
                ]
            ],
         ],
    ]); ?>

</div>
