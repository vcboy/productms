<?php

namespace backend\controllers;

use Yii;
use backend\models\Purchase;
use backend\models\PurchaseSearch;
use backend\models\Admin;
use backend\components\CController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use backend\models\Refcode;
use yii\helpers\ArrayHelper;
use yii\filters\AccessControl;
/**
 * PurchaseController implements the CRUD actions for Purchase model.
 */
class PurchaseController extends CController
{
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
                    'delete' => ['post','get'],
                ],
            ],
        ];
    }

    /**
     * Lists all Purchase models.
     * @return mixed
     */
    public function actionIndex()
    {
        $this->childSubject = '采购管理';
        $searchModel = new PurchaseSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        //$dataProvider->query->where(['is_del'=>0]);
        $dataProvider->query->orderBy('id desc');
        $refcode =  ArrayHelper::map(Refcode::find()->where(['is_del'=>0])->all(),'id','nm');
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'refcode' => $refcode
        ]);
    }

    /**
     * 采购入库
     * @return mixed
     */
    public function actionDepot()
    {
        //dump(Yii::$app->session['menu']);
        $this->childSubject = '验货入库';
        $searchModel = new PurchaseSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->orderBy('status asc,id desc');
        $refcode =  ArrayHelper::map(Refcode::find()->where(['is_del'=>0])->all(),'id','nm');
        return $this->render('depot', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'refcode' => $refcode
        ]);
    }

    /**
     * Displays a single Purchase model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $refcode =  ArrayHelper::map(Refcode::find()->where(['is_del'=>0])->all(),'id','nm');
        return $this->render('view', [
            'model' => $this->findModel($id),
            'refcode' => $refcode,
        ]);
    }

    /**
     * Displays a single Purchase model.
     * @param integer $id
     * @return mixed
     */
    public function actionDepotview($id)
    {
        $refcode =  ArrayHelper::map(Refcode::find()->where(['is_del'=>0])->all(),'id','nm');
        return $this->render('depotview', [
            'model' => $this->findModel($id),
            'refcode' => $refcode,
        ]);
    }

    /**
     * Creates a new Purchase model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        //$this->layout = 'main';
        $this->childSubject = '添加采购';
        $model = new Purchase();
        //$model->pur_user = $this->user->name;
        $model->pur_date = date("Y-m-d"); 
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $model->pur_date = strtotime($model->pur_date);
            $model->save();
            //var_dump($model->getErrors());
            return $this->redirect(['index']);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Purchase model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $model->pur_date = strtotime($model->pur_date);
            $model->save();
            return $this->redirect(['index']);
        } else {
            $model->pur_date = date("Y-m-d",$model->pur_date);
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    public function actionDepotupdate($id){
        $model = $this->findModel($id);
        $model->setScenario('depot');
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $model->depot_date = strtotime($model->depot_date);
            $model->status = 1;
            $model->sycount = $model->depot_count;
            $model->save();
            return $this->redirect(['depot']);
        } else {
            $refcode =  ArrayHelper::map(Refcode::find()->where(['is_del'=>0])->all(),'id','nm');
            return $this->render('depotupdate', [
                'model' => $model,
                'refcode' => $refcode,
            ]);
        }
    }

    /**
     * Deletes an existing Purchase model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        $model['is_del'] = 1;
        $model->save();
        return $this->redirect(['index']);
    }

    /**
     * Finds the Purchase model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Purchase the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Purchase::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionGetfood(){
        $foodclass_id = $this->request->post('foodclass_id');
        //$foodArr = ArrayHelper::map(Refcode::find()->where(['pid'=>$foodclass_id,'is_del'=>0])->all(),'id','nm');
        /*$foodObj = Refcode::find()->where(['pid'=>$foodclass_id,'is_del'=>0])->all();
        foreach ($foodObj as $key => $value) {
            $unitName = $value->unitName;
            $nm = $unitName?$value->nm.' ('.$unitName.')':$value->nm;
            $foodArr[$value->id] = $nm;
        }*/
        $foodArr = Refcode::getFood($foodclass_id);
        echo json_encode($foodArr);
    }
}
