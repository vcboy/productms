<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\ProductTemplate */

$this->title = '成品配比';
$this->params['breadcrumbs'][] = ['label' => 'Product Templates', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-template-create">
    <?= $this->render('_form', [
        'model' => $model,
        'pte_arr_txt' => (empty($pte_arr_txt)?"":$pte_arr_txt),
    ]) ?>

</div>
