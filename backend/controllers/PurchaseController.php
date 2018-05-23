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
        $searchModel = new PurchaseSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        /*$foodclasslist = Refcode::getRefcodeBytype('foodclass');
        $foodlist = $paramlist = [];
        if($model->foodclass_id){
            //$foodlist = Refcode::getRefcodeBytype('food');
            $foodlist = Refcode::getFood($model->foodclass_id);
        }
        if($model->food_id){
            $paramlist = Refcode::getFood($model->food_id);
        }
        $searchArr = ['foodclasslist'=>$foodclasslist,'foodlist'=>$foodlist,'paramlist'=>$paramlist];*/
        $refcode =  ArrayHelper::map(Refcode::find()->where(['is_del'=>0])->all(),'id','nm');
        return $this->render('index', [
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
        return $this->render('view', [
            'model' => $this->findModel($id),
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
        $model = new Purchase();
        //$model->pur_user = $this->user->name;
        //$model->pur_date = date("Y-m-d"); 
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
            return $this->render('update', [
                'model' => $model,
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
        $model['is_delete'] = 1;
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
