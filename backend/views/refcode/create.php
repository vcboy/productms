<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Refcode */

$this->title = 'Create Refcode';
$this->params['breadcrumbs'][] = ['label' => 'Refcodes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="refcode-create">

    <?= $this->render('_form', [
        'model' => $model,
        'type_code' => $type_code,
        'type_name' => $type_name,
    ]) ?>

</div>
