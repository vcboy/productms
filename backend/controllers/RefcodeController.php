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
use yii\filters\AccessControl;

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
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions'   => [],
                        'allow'     => true,
                        'roles'     => ['@'],   //其中？代表游客，@代表已登录的用户。
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST','GET'],
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
        $type_code = $this->request->get('type_code');
        $where = ['type'=>$type_code];
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams,$where);
        
        $type_codeArr = Yii::$app->params['type_code'];
        $type_name = array_key_exists($type_code,$type_codeArr)?$type_codeArr[$type_code]:'';
        //$dataProvider->where(['type_code'=>$type_code]);
        $this -> childSubject = $type_name;
        //dump(Yii::$app->session['menu']);
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
        
        if ($model->load(Yii::$app->request->post()) && 1==2) {
            $model->type = $type_code;
            $model->save();

            var_dump($model->validate());
            //return $this->redirect(['index', 'type_code' => $model->type]);
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
            return $this->redirect(['index', 'type_code' => $model->type]);
        } else {
            return $this->render('update', [
                'model' => $model,
                'type_code' => $model->type,
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
        $model = $this->findModel($id);
        $model->is_del = 1;
        $model->save();
        return $this->redirect(['index','type_code'=>$model->type]);
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
