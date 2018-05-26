<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\ProductConsume */

$this->title = '消耗添加';
$this->params['breadcrumbs'][] = ['label' => 'Product Consumes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-consume-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
