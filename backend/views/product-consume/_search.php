<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
use backend\models\Refcode;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model backend\models\ProductConsumeSearch */
/* @var $form yii\widgets\ActiveForm */
$productclasslist = Refcode::getRefcodeBytype('productclass');
$productlist = [];
if(!empty($model->productclass_id)){
    $productlist = ArrayHelper::map(Refcode::find()->andWhere(['pid'=>$model->productclass_id,'is_del'=>0])->all(),'id','nm');
}
?>

<div class="product-consume-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>
    <div class="tabfield">
    <?//= $form->field($model, 'id') ?>

    <?= $form->field($model, 'productclass_id')->dropDownList(array(''=>'--请选择--')+$productclasslist,['id'=>'productclass_id']) ?>

    <?= $form->field($model, 'product_id')->dropDownList(array(''=>'--请选择--')+$productlist,['id'=>'product_id']) ?>

    <?//= $form->field($model, 'unitprice') ?>

    <?//= $form->field($model, 'price') ?>

    <?php // echo $form->field($model, 'count') ?>

    <?php // echo $form->field($model, 'consume_type') ?>

    <?php //echo $form->field($model, 'status') ?>
    <?
    if(empty($sh))
    echo $form->field($model, 'consume_type')->dropDownList(array(''=>'--请选择--')+['1'=>'销售','2'=>'损耗'],['id'=>'consume_type']) 
    ?>

    <?php // echo $form->field($model, 'create_dt') ?>

    </div>
    <div class="form-group">
        <?= Html::submitButton("查询", ["class" =>"btn btn-sm btn-primary"]) ?>
        <?= Html::a('重置', ['index'], ['class' => 'btn btn-sm btn-primary']) ?>
        <?
        if(empty($sh))
        echo  Html::a('添加', ['create'], ['class' => 'btn btn-sm btn-success']) 
        ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<script type="text/javascript">
     $(document).ready(function(){
        $("#productclass_id").change(function(){
            var productclass_id = $(this).val();
            var Content = {productclass_id: productclass_id};
            var url = "<?=Url::to(['product-template/getproduct'])?>";
            $.post(url,Content,function(rsp){
                if(rsp){
                    var obj = JSON.parse(rsp);
                    var optionstr = '<option value="">--请选择--</option>';
                    for(var i in obj){
                        optionstr+="<option value="+i+">"+obj[i]+"</option>";
                    }
                    $("#product_id option").remove();
                    $("#product_id").append(optionstr);
                }
            })
        });
    });
</script>