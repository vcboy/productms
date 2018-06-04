<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
use backend\models\Refcode;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model backend\models\ProductTemplateSearch */
/* @var $form yii\widgets\ActiveForm */

$productclasslist = Refcode::getRefcodeBytype('productclass');
$productlist = [];
if(!empty($model->productclass_id)){
    $productlist = ArrayHelper::map(Refcode::find()->andWhere(['pid'=>$model->productclass_id,'is_del'=>0])->all(),'id','nm');
}
?>

<div class="product-template-search">

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
        <?=  Html::Button('刷新成品模板价格', ['class' => 'btn btn-sm btn-danger','onclick'=>'_flashtpprice()']) ?>
    </div>
    <?php ActiveForm::end(); ?>

</div>
<script type="text/javascript">
     $(document).ready(function(){
        $("#productclass_id").change(function(){
            var productclass_id = $(this).val();
            var Content = {productclass_id: productclass_id};
            var url = "<?=Url::to(['getproduct'])?>";
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

    function _flashtpprice(){
        var url = "<?=Url::to(['product-template/flashtpprice'])?>";
        $.post(url,'',function(rsp){
            if(rsp){
                swal({title:'价格刷新完毕。'},function(){
                    location.reload();
                });
            }
        });
    }
</script>
