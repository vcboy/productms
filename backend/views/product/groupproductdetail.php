<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
use backend\models\Refcode;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\ProductSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Products';
$this->params['breadcrumbs'][] = '发货完成基准价明细';
?>

<div class="product-form">

    <?php $form = ActiveForm::begin(); ?>

    <table class="table table-striped table-bordered" id="product_tb">
        <tr><th>成品分类</th><th>成品名称</th><th>成品数量</th><th>成品单价</th><th>小计</th></tr>
        <?=$pte_arr_txt?>
        <tr><td colspan="3">&nbsp;</td><td>合计</td><td><?="￥".($model->total_price-0)."元"?></td></tr>
    </table>
   
   

    <?= $form->field($model, 'is_customer')->label('是否本单位')->dropDownList((empty($model->is_customer)?array(0=>'本单位'):array(1=>'其他单位')), array('readonly' => 'readonly')) ?>

    <?= $form->field($model, 'total_price')->textInput(['readonly'=>'readonly']) ?>

    <?= $form->field($model, 'customer')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'arrive_date')->textInput(['readonly'=>'readonly','maxlength' => true]) ?>

    <div class="form-group">
    <?=  Html::a('返回',"javascript:history.back()",['class'=>'btn btn-primary'])?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
