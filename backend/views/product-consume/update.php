<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ProductConsume */

$this->title = '消耗修改' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Product Consumes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="product-consume-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
