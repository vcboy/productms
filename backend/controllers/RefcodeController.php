<?php

namespace backend\controllers;

use Yii;
use backend\models\Refcode;
use backend\models\RefcodeSearch;
use backend\models\Menu;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use backend\components\CController;

/**
 * RefcodeController implements the CRUD actions for Refcode model.
 */
class RefcodeController extends CController
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Refcode models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new RefcodeSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $type_code = $this->request->get('type_code');
        $type_codeArr = Yii::$app->params['type_code'];
        $type_name = array_key_exists($type_code,$type_codeArr)?$type_codeArr[$type_code]:'';

        $this -> childSubject = $type_name;
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'type_code' => $type_code,
        ]);
    }

    /**
     * Displays a single Refcode model.
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
     * Creates a new Refcode model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Refcode();
        $type_code = $this->request->get('type_code');
        $type_codeArr = Yii::$app->params['type_code'];
        $type_name = array_key_exists($type_code,$type_codeArr)?$type_codeArr[$type_code]:'';

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
                'type_code' => $type_code,
                'type_name' => $type_name,
            ]);
        }
    }

    /**
     * Updates an existing Refcode model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Refcode model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Refcode model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Refcode the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Refcode::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
