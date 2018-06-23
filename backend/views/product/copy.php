<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Product */

$this->title = '添加配货单';
$this->params['breadcrumbs'][] = ['label' => 'Products', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_copyform', [
        'model' => $model,
        'pte_arr_txt' => $pte_arr_txt,
    ]) ?>

</div>