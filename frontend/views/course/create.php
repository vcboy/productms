<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model frontend\models\LcCourse */

$this->title = 'Create Lc Course';
$this->params['breadcrumbs'][] = ['label' => 'Lc Courses', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lc-course-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
