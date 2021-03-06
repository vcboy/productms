<?php

namespace backend\controllers;

use Yii;
use backend\models\ProductConsume;
use backend\models\ProductConsumeSearch;
use backend\models\ProductEntrySearch;
use backend\models\ProductEntry;
use backend\models\ProductConsumeEntry;
use backend\models\ProductConsumeEntrySearch;
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
        $searchModel = new ProductConsumeEntrySearch();
        $productclass_id = intval($this->request->get('productclass_id'));
        $product_id = intval($this->request->get('product_id'));
        //$status = intval($this->request->get('status'));
        //$consume_type = intval($this->request->get('consume_type'));
        $create_dt_s = $this->request->get('create_dt_s');
        $create_dt_e = $this->request->get('create_dt_e');
        if($productclass_id){
            $searchModel->productclass_id = $productclass_id;
        }
        if($product_id){
            $searchModel->product_id = $product_id;
        }
        /*if($consume_type){
            $searchModel->consume_type = $consume_type;
        }
        if($status){
             $searchModel->status = $status;
        }*/
        if($create_dt_s){
             $searchModel->create_dt_s = $create_dt_s;
        }
        if($create_dt_e){
             $searchModel->create_dt_e = $create_dt_e;
        }
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $this->childSubject = '消耗管理';
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * 报损审核
     * @return mixed
     */
    public function actionSh()
    {
        $searchModel = new ProductConsumeSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        //$dataProvider->query->andWhere(['status'=>0]);
        $this->childSubject = '报损审核';
        return $this->render('sh', [
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
        $sh = intval($this->request->get('sh'));
        $error = $this->request->get('error');
        return $this->render('view', [
            'model' => $this->findModel($id),
            'sh' => $sh,
            'error' => $error,
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
        $id = intval($this->request->get('id'));
        $product_entry_id = intval($this->request->get('product_entry_id'));
        $model->product_entry_id = $product_entry_id;
        $model->product_consume_entry_id = $id;
        $model->consume_type = 2;
        $this->childSubject = '消耗添加';
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $model->create_dt = strtotime($model->create_dt);           
            $model->status = 0;
            $model->save();
            //var_dump($model->getErrors());
            return $this->redirect(['product-consume/index']);
        } else {
            
            $productclass_id = intval($this->request->get('productclass_id'));
            $product_id = intval($this->request->get('product_id'));
            $model->productclass_id = $productclass_id;
            $model->product_id = $product_id;
            $model->create_dt = date("Y-m-d H:i:s"); 
            
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
        $model['is_del'] = 1;
        $model->save();
        return $this->redirect(['index']);
    }

    /**
     * 通过审核
     * @return [type] [description]
     */
    public function actionDosh(){
        $sh = intval($this->request->get('sh'));
        $id = intval($this->request->get('id'));
        $model = $this->findModel($id);
        $count = $model['count'];
        $product_id = $model['product_id'];
        $product_entry_id = $model['product_entry_id'];
        $product_consume_entry_id = $model['product_consume_entry_id'];
        
        $pceObj = ProductConsumeEntry::find()->where(['id'=>$product_consume_entry_id,'is_del'=>0])->one();
        $sy_consume_count = $pceObj->count - $model->count;
        if($sy_consume_count < 0){
            return $this->redirect(['view','sh'=>$sh,'id'=>$id,'error'=>1]);
        }else{
            /*$pteObj = ProductEntry::find()->where(['id'=>$product_entry_id,'status'=>1])->one();
            $consume_count = $pteObj->consume_count - $model->count;
            $pteObj->consume_count = $consume_count;
            $pteObj->save();*/
            $model['status'] = $sh;
            $model->save();

            $pceObj->count = $sy_consume_count;
            $pceObj->consume_count = $pceObj->consume_count + $model->count;
            $pceObj->save();
            return $this->redirect(['sh']);
        }
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

    /**
     * Lists all ProductConsume models.
     * @return mixed
     */
    public function actionSearch()
    {
        $searchModel = new ProductConsumeEntrySearch();
        //$searchModel = new ProductEntrySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->select(['sum(count) as totalcount,sum(unitprice * count) as totalprice,productclass_id,product_id']);
        $dataProvider->query->andWhere(['is_del'=>0]);
        $dataProvider->query->andWhere(['>','count',0]);
        $dataProvider->query->groupBy(['product_id']);
        $this->childSubject = '成品消耗基准价';
        return $this->render('search', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
}
