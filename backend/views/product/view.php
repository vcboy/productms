<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
use backend\models\Refcode;

/* @var $this yii\web\View */
/* @var $model backend\models\Product */
$this->title = '配发验单据详情';
$this->params['breadcrumbs'][] = ['label' => 'Products', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
$productclasslist = Refcode::getRefcodeBytype('productclass');
?>
<div class="product-update">

    <div class="product-form">

        <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'booker_user')->textInput(['readonly'=>'readonly','value'=>$model->booker_user?$model->booker_user:Yii::$app->user->identity->name]) ?>

        <?= $form->field($model, 'book_date')->textInput(['readonly'=>'readonly','maxlength' => true]) ?>

        <?= $form->field($model, 'book_comment')->textInput(['readonly'=>'readonly']) ?>

        <?= $form->field($model, 'arrive_date')->textInput(['readonly'=>'readonly','maxlength' => true]) ?>

        <?= $form->field($model, 'is_customer')->label('是否本单位')->dropDownList((empty($model->is_customer)?array(0=>'本单位'):array(1=>'其他单位')), array('readonly' => 'readonly')) ?>

        <?= $form->field($model, 'total_price')->textInput(['readonly'=>'readonly']) ?>

        <?= $form->field($model, 'customer')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

        <?= $form->field($model, 'sender_user')->textInput(['readonly'=>'readonly','value'=>$model->sender_user?$model->sender_user:Yii::$app->user->identity->name]) ?>

        <?= $form->field($model, 'send_date')->textInput(['readonly'=>'readonly','maxlength' => true]) ?>

        <?= $form->field($model, 'send_comment')->textInput(['readonly'=>'readonly']) ?>

        <?= $form->field($model, 'inspector_user')->textInput(['readonly'=>'readonly','value'=>$model->inspector_user?$model->inspector_user:Yii::$app->user->identity->name]) ?>

        <?= $form->field($model, 'inspect_date')->textInput(['readonly'=>'readonly','maxlength' => true,'onfocus' => 'WdatePicker({dateFmt:"yyyy-MM-dd"})','value'=>date('Y-m-d',time())]) ?>

        <?= $form->field($model, 'inspect_comment')->textInput(['readonly'=>'readonly']) ?>

        <table class="table table-striped table-bordered" id="product_tb">
            <tr><th colspan="4">
                <?=  Html::a('查看库存配比','javascript:;',['class'=>'btn btn-sm btn-danger','onclick'=>'_checkstore()'])?>
            </th></tr>
            <tr><th>成品分类</th><th>成品名称</th><th>配货数量</th><th>发货数量</th><th>验货数量</th></tr>
            <?=$pte_arr_txt?>
        </table>

        <div class="form-group">
        <?=  Html::a('返回','javascript:history.back()',['class'=>'btn btn-primary'])?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>
</div>

<script type="text/javascript">
    function _checkstore(){
        var gp_arr = $('#gp_arr').val();
        if(gp_arr!=""){
            var Content = {'gp_arr': gp_arr};
            var url = "<?=Url::to(['getstoreinfo'])?>";
            $.post(url,Content,function(rsp){
                swal({ 
                  title: "当前订单配额与库存量对比",
                  text: rsp, 
                  html: true 
                });
            })
        }else{
            swal({ 
              title: "没有完整添加相关成品及数量",
              text: '没有成品或者成品数量未填写'
            });
        }
    }
</script>