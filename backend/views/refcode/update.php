<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Refcode */

$this->title = 'Update Refcode: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Refcodes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="refcode-update">

    <?= $this->render('_form', [
        'model' => $model,
        'type_code' => $type_code,
    ]) ?>

</div>
