<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Procut */

$this->title = 'Create Procut';
$this->params['breadcrumbs'][] = ['label' => 'Procuts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="procut-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
