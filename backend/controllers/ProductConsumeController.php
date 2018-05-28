<?php

namespace backend\controllers;

use Yii;
use backend\models\ProductConsume;
use backend\models\ProductConsumeSearch;
use backend\components\CController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * ProductConsumeController implements the CRUD actions for ProductConsume model.
 */
class ProductConsumeController extends CController
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post','get'],
                ],
            ],
        ];
    }

    /**
     * Lists all ProductConsume models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ProductConsumeSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $this->childSubject = '消耗管理';
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single ProductConsume model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new ProductConsume model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new ProductConsume();
        $this->childSubject = '消耗添加';
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $model->create_dt = strtotime($model->create_dt);
            $model->status = $model->consume_type == 1?1:0;
            $model->save();
            return $this->redirect(['index']);
        } else {
            $model->create_dt = date("Y-m-d"); 
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing ProductConsume model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $this->childSubject = '消耗修改';
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $model->create_dt = strtotime($model->create_dt);
            $model->save();
            return $this->redirect(['index']);
        } else {
            $model->create_dt = date("Y-m-d",$model->create_dt);
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing ProductConsume model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        $model['is_delete'] = 1;
        $model->save();
        return $this->redirect(['index']);
    }

    /**
     * Finds the ProductConsume model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ProductConsume the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = ProductConsume::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
