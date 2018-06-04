<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\ProductSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>
    <div class="tabfield">

    <?= $form->field($model, 'productclass_id')->dropDownList(array(''=>'--请选择--')+$productclasslist,['id'=>'productclass_id']) ?>

    <?= $form->field($model, 'product_id')->dropDownList(array(''=>'--请选择--')+$productlist,['id'=>'product_id']) ?>

    </div>
    <div class="form-group">
        <?= Html::submitButton("查询", ["class" =>"btn btn-sm btn-primary"]) ?>
        <?= Html::a('添加', ['create'], ['class' => 'btn btn-sm btn-success']) ?>
    </div>
    <?php ActiveForm::end(); ?>

</div>
