<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Product */

$this->title = '验货配货';
$this->params['breadcrumbs'][] = ['label' => 'Products', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="product-update">
    <?= $this->render('_inspectorform', [
        'model' => $model,
        'pte_arr_txt' => (empty($pte_arr_txt)?"":$pte_arr_txt),
    ]) ?>

</div>
