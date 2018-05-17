<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model frontend\models\JobUser */

$this->title = 'Create Job User';
$this->params['breadcrumbs'][] = ['label' => 'Job Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="job-user-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
