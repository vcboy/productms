<?php

use yii\helpers\Html;
use yii\helpers\Url;
use job\lib\JobGridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\AdminSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Admins';
$this->params['breadcrumbs'][] = $this->title;
?>
<?php  echo $this->render('_search', ['model' => $searchModel]); ?>
    <?= JobGridView::widget([
        'dataProvider' => $dataProvider,
        'summary'      => '',
        'columns' => [
            ['class' => 'yii\grid\SerialColumn','header' => '序号'],
            'username',
            'name',
            [
                'header'    => '性别',
                'attribute' => 'name',
                'value'     => function($model){return $model->getGenderName();},
            ],
            [
                'header'    => '角色',
                'value'     => function($model){return $model->getRoleName();}
            ],

            [
                'class' => 'yii\grid\ActionColumn',
                'header' => '操作',
                'template' => '{update} {delete}',
                'buttons' => [
                    'update' => function ($url, $model, $key) {
                        $options = [
                            'title' => '修改',
                            'aria-label' => Yii::t('yii', 'Update'),
                            'data-pjax' => '0',
                            'class' =>'btn btn-xs btn-info',
                        ];
                        $auth = Yii::$app->authManager;
                        $userid = Yii::$app->user->identity->id;
                        if($auth->checkAccess($userid,'admin_update')) {
                            return Html::a('<i class="icon-edit bigger-120"></i>', $url, $options);
                        }
                    },
                    'delete' => function ($url, $model, $key) {
                        $options = [
                            'title' => Yii::t('yii', 'Delete'),
                            'aria-label' => Yii::t('yii', 'Delete'),
                            'data-method' => 'post',
                            'data-pjax' => '0',
                        ];
                        $auth = Yii::$app->authManager;
                        $userid = Yii::$app->user->identity->id;
                        if($auth->checkAccess($userid,'admin_delete')) {
                            $url = Url::to(['admin/dodelete','id'=>$model->id]);
                            return Html::a('<button class="btn btn-xs btn-danger"><i class="icon-trash bigger-120"></i></button>', '#', ['onclick'=>'javascript:sweetConfirmChange(\'你确定要删除吗?\',\''.$url.'\')']);
                        }
                    },
                ],
            ],
        ],
    ]); ?>

