<?php

use yii\helpers\Html;
use job\lib\JobGridView;
use yii\helpers\Url;

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
                <?php echo $this->render('_searchconsume', ['model' => $searchModel]); ?>
            </div>
        </div>
    </div>
    <?= JobGridView::widget([
        'dataProvider' => $dataProvider,
        'summary'=>'',
        'columns' => [
            ['class' => 'yii\grid\SerialColumn','header' => '序号'],
            'inspector_user',
            [
                'attribute' => 'inspect_date',
                'value'     => function($model) {return (empty($model->inspect_date)?"-":date("Y-m-d H:i",$model->inspect_date));},
            ],
            [   'class' => 'yii\grid\ActionColumn',
                'header' => '添加消耗',
                'template' => '{inspector} {add}',
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
                    'add' => function ($url, $model, $key) {
                        $options = [
                            'title' => '添加消耗',
                            'aria-label' => Yii::t('yii', 'view'),
                            'data-pjax' => '0',
                            'class' => 'btn btn-xs btn-warning',
                        ];
                        $url = Url::to(["addconsume",'id'=>$model->id]);
                        return Html::a('<i class="icon-edit  bigger-120"></i>', $url,$options);
                    },
                ]
            ],
        ],
    ]); ?>
</div>
