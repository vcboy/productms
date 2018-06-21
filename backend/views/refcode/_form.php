<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use backend\models\Refcode;

/* @var $this yii\web\View */
/* @var $model backend\models\Refcode */
/* @var $form yii\widgets\ActiveForm */
?>
<div class="page-header">
    <h1><?=($model -> isNewRecord)?'添加'.$type_name:'修改';?></h1>
</div>
<div class="refcode-form">

    <?php $form = ActiveForm::begin(); ?>
    <?
    switch($type_code){
        case 'food':
            $downlist = Refcode::getRefcodeBytype('foodclass');
            echo $form->field($model, 'pid')->label('食材分类')->dropDownList(array(''=>'--请选择--')+$downlist);
            $unitlist = Refcode::getRefcodeBytype('foodunit');
            echo $form->field($model, 'pid2')->label('食材单位')->dropDownList(array(''=>'--请选择--')+$unitlist);
            break;
        case 'param':
            $downlist = Refcode::getRefcodeBytype('food');
            echo $form->field($model, 'pid')->label('食材名称')->dropDownList(array(''=>'--请选择--')+$downlist);
            break;
        case 'product':
            $downlist = Refcode::getRefcodeBytype('productclass');
            echo $form->field($model, 'pid')->label('成品分类')->dropDownList(array(''=>'--请选择--')+$downlist);
            $unitlist = Refcode::getRefcodeBytype('productunit');
            echo $form->field($model, 'pid2')->label('成品单位')->dropDownList(array(''=>'--请选择--')+$unitlist);
            break;
        default:
            break;
    }
    ?>

    <?= $form->field($model, 'nm')->textInput(['maxlength' => true]) ?>

    <?
    if($type_code == 'food')
        echo $form->field($model, 'value')->label('预警值')->textInput(['maxlength' => true]);
    ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '添加' : '修改', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
