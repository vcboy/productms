<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;
use backend\models\Refcode;
use yii\widgets\ActiveForm;
/* @var $this yii\web\View */
/* @var $model backend\models\Purchase */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Purchases', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="purchase-view">

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            [
                'attribute' => 'foodclass_id',
                'value'     => function($model) use($refcode){
                    if(array_key_exists($model->foodclass_id, $refcode))
                        return $refcode[$model->foodclass_id];
                },
            ],
            [
                'attribute' => 'food_id',
                'value'     => function($model) use($refcode){
                    $food = Refcode::getFoodbyid($model->food_id);
                    return $food;
                    //return $refcode[$model->food_id];
                },
            ],
            [
                'attribute' => 'param_id',
                'value'     => function($model) use($refcode){
                    if(array_key_exists($model->param_id, $refcode))
                        return $refcode[$model->param_id];
                },
            ],
            'book_count',
            'price',
            //'unit',
            //'brand',
            [
                'attribute' => 'brand',
                'value'     => function($model) use($refcode){
                    if(array_key_exists($model->brand, $refcode))
                        return $refcode[$model->brand];
                },
            ],
            //'supplier',
            [
                'attribute' => 'supplier',
                'value'     => function($model) use($refcode){
                    if(array_key_exists($model->supplier, $refcode))
                        return $refcode[$model->supplier];
                },
            ],
            'pur_user',
            [
                'attribute' => 'pur_date',
                'value'     => function($model) {return date("Y-m-d",$model->pur_date);},
            ],
            //'depot_user',
            //'depot_count',
            //'depot_date',
            //'sycount',
            'statustext:html',
            
            //'comment:ntext',
            //'is_del',
        ],
    ]) ?>

    <div class="purchase-form">

        <?php $form = ActiveForm::begin(); ?>

        
        <?//= $form->field($model, 'book_count')->textInput() ?>
        <?= $form->field($model, 'depot_count')->textInput() ?>

        <?= $form->field($model, 'depot_date')->textInput(['maxlength' => true,'onfocus' => 'WdatePicker({dateFmt:"yyyy-MM-dd"})','value'=>date("Y-m-d")]) ?>

        <?//= $form->field($model, 'sycount')->textInput() ?>

        <?//= $form->field($model, 'status')->textInput() ?>
        <?= $form->field($model, 'depot_user')->textInput(['value'=>Yii::$app->user->identity->name]) ?>
        <?= $form->field($model, 'comment')->textarea(['rows' => 6]) ?>

        <?//= $form->field($model, 'is_del')->textInput() ?>


        <div class="form-group">
        <?=  Html::submitButton('采购入库', ['class' => 'btn btn-primary']) ?>
        <?=  Html::a('返回',Url::toRoute("index"),['class'=>'btn btn-primary'])?>
        </div>       
        <?php ActiveForm::end(); ?>
    </div>
</div>
