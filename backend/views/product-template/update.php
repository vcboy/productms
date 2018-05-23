<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ProductTemplate */

$this->title = '成品配比修改';
$this->params['breadcrumbs'][] = ['label' => 'Product Templates', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="product-template-update">
    <?= $this->render('_form', [
        'model' => $model,
        'pte_arr_txt' => (empty($pte_arr_txt)?"":$pte_arr_txt),
    ]) ?>

</div>
