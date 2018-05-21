<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Purchase */

$this->title = '添加采购';
$this->params['breadcrumbs'][] = ['label' => 'Purchases', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="purchase-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>
