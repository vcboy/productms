<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model backend\models\Product */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'booker_user')->textInput(['value'=>$model->booker_user?$model->booker_user:Yii::$app->user->identity->name]) ?>

    <?= $form->field($model, 'book_date')->textInput(['maxlength' => true,'onfocus' => 'WdatePicker({dateFmt:"yyyy-MM-dd"})','value'=>$model->book_date]) ?>

    <?= $form->field($model, 'book_comment')->textInput() ?>

    <?= $form->field($model, 'arrive_date')->textInput(['maxlength' => true,'onfocus' => 'WdatePicker({dateFmt:"yyyy-MM-dd"})']) ?>

    <?= $form->field($model, 'is_customer')->label('是否本单位')->dropDownList(array(''=>'--请选择--',0=>'本单位',1=>'其他单位')) ?>

    <?= $form->field($model, 'total_price')->textInput(['readonly'=>'readonly']) ?>

    <?= $form->field($model, 'customer')->textInput(['maxlength' => true]) ?>

    <table class="table table-striped table-bordered" id="food_tb">
        <tr><th colspan="4"><?=  Html::a('添加配货成品','#',['class'=>'btn btn-sm btn-success','onclick'=>'_addPurchase()'])?></th></tr>
        <tr><th>成品分类</th><th>成品名称</th><th>配货数量</th><th class="action-column">操作</th></tr>
        <?=$pte_arr_txt?>
    </table>

    <div class="form-group">
    <?=  Html::Button($model->isNewRecord ? '保存' : '更新', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary','onclick'=>'_checkSub()']) ?>
    <?=  Html::a('返回',Url::toRoute("index"),['class'=>'btn btn-primary'])?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<script type="text/javascript">
    function _checkSub(){
        $('form').submit();
    }
</script>