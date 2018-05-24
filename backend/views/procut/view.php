<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Procut */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Procuts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="procut-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'booker_id',
            'book_date',
            'book_comment',
            'arrive_date',
            'is_customer',
            'total_price',
            'sender_id',
            'send_date',
            'send_status',
            'send_comment:ntext',
            'inspector_id',
            'inspect_date',
            'inspect_status',
            'inspect_comment:ntext',
            'is_del',
            'customer',
        ],
    ]) ?>

</div>
