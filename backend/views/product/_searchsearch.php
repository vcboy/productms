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
        'method' => 'get',
    ]); ?>
    <div class="tabfield">

    <?= $form->field($model, 'productclass_id')->label('成品类型')->dropDownList(array(''=>'--请选择--')+$productclasslist,['id'=>'productclass_id']) ?>
    <?= $form->field($model, 'product_id')->label('成品名称')->dropDownList(array(''=>'--请选择--')+$productlist,['id'=>'product_id']) ?>

    </div>
    <div class="form-group">
        <?= Html::submitButton("查询", ["class" =>"btn btn-sm btn-primary"]) ?>
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