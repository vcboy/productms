<?php

use yii\helpers\Html;
use yii\helpers\Url;
use job\lib\JobGridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\RefcodeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Refcodes';
$this->params['breadcrumbs'][] = $this->title;
$domenu = [
    'class' => 'yii\grid\ActionColumn',
    'header' => '操作',
    'template' => '{update} {delete}',
    'buttons' => [
        'update' => function ($url, $model, $key) {
            $options = [
                'title' => '修改',
                'aria-label' => Yii::t('yii', 'Update'),
                'data-pjax' => '0',
                'class' =>'btn btn-xs btn-info',
            ];

            return Html::a('<i class="icon-edit bigger-120"></i>', $url, $options);
        },
        'delete' => function ($url, $model, $key) {
            $options = [
                'title' => Yii::t('yii', 'Delete'),
                'aria-label' => Yii::t('yii', 'Delete'),
                //'data-confirm' => Yii::t('yii', '你确定要删除吗?'),
                'data-method' => 'post',
                'data-pjax' => '0',
            ];
            //$url = Url::to(['delete','id'=>$model->id]);
            return Html::a('<button class="btn btn-xs btn-danger"><i class="icon-trash bigger-120"></i></button>', '#', ['onclick'=>'javascript:sweetConfirmChange(\'你确定要删除吗?\',\''.$url.'\')']);
        },
    ],
];
$columns = [['class' => 'yii\grid\SerialColumn','header' => '序号'],'nm'];
if($type_code == 'food')
    array_push($columns,'value');

if($type_code == 'food' || $type_code == 'param' || $type_code == 'product')
    array_push($columns,'parentName');

$columns[] = $domenu;
?>
<div class="refcode-index">

    <h1><?//= Html::encode($this->title) ?></h1>
    <?php  //echo $this->render('_search', ['model' => $searchModel]); ?>
    <?= Html::a('添加', ['create','type_code'=>$type_code], ['class' => 'btn btn-sm btn-success']) ?>
    <p></p>
    <?= JobGridView::widget([
        'dataProvider' => $dataProvider,
        'summary'       => '',
        //'filterModel' => $searchModel,
        'columns' => $columns,
    ]); ?>
</div>
