<?php

namespace backend\controllers;

use Yii;
use backend\models\Product;
use backend\models\Refcode;
use backend\models\ProductSearch;
use backend\models\ProductTemplate;
use backend\models\ProductEntry;
use backend\components\CController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;

/**
 * ProductController implements the CRUD actions for Product model.
 */
class ProductController extends CController
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
                    'delete' => ['POST','GET'],
                ],
            ],
        ];
    }

    /**
     * Lists all Product models.
     * @return mixed
     */
    public function actionCreatelist()
    {
        $searchModel = new ProductSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andWhere(['send_status'=>0,'is_del'=>0]);
        $dataProvider->query->orderBy('book_date desc');
        return $this->render('createlist', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Product model.
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
     * Creates a new Product model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Product();

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $model->book_date = strtotime($model->book_date);
            $model->arrive_date = strtotime($model->arrive_date);
            $model->save();
            $request = Yii::$app->request;
            $product_txt = $request->post('product_txt');
            $pnum_txt = $request->post('pnum_txt');
            $product_txt_arr = explode(',', $product_txt);
            $pnum_txt_arr = explode(',', $pnum_txt);
            $pinfo_arr = Refcode::find()->andWhere(['id'=>$product_txt_arr])->all();
            $pMap = [];
            foreach ($pinfo_arr as $key => $val) {
                $pMap[$val['id']] = $val;
            }
            $priceMap = ArrayHelper::map(ProductTemplate::find()->andWhere(['product_id'=>$product_txt_arr])->all(),'product_id','unitprice');
            foreach ($product_txt_arr as $key => $val) {
                $pinfo = $pMap[$val];
                $book_count = $pnum_txt_arr[$key];
                $price = $priceMap[$val];
                $pe = new ProductEntry();
                $pe['pid'] = $model->id;
                $pe['productclass_id'] = $pinfo['pid'];
                $pe['product_id'] = $val;
                $pe['unitprice'] = $price;
                $pe['unit'] = $pinfo->unitName;
                $pe['price'] = $price*($book_count-0);
                $pe['book_count'] = $book_count;
                $pe->save();
            }
            return $this->redirect(['createlist']);
        } else {
            $model->book_date = date('Y-m-d',time());
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Product model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $model->book_date = strtotime($model->book_date);
            $model->arrive_date = strtotime($model->arrive_date);

            $model->save();
            ProductEntry::deleteAll('pid = :pid', [':pid' => $model->id]);
            $request = Yii::$app->request;
            $product_txt = $request->post('product_txt');
            $pnum_txt = $request->post('pnum_txt');
            $product_txt_arr = explode(',', $product_txt);
            $pnum_txt_arr = explode(',', $pnum_txt);
            $pinfo_arr = Refcode::find()->andWhere(['id'=>$product_txt_arr])->all();
            $pMap = [];
            foreach ($pinfo_arr as $key => $val) {
                $pMap[$val['id']] = $val;
            }
            $priceMap = ArrayHelper::map(ProductTemplate::find()->andWhere(['product_id'=>$product_txt_arr])->all(),'product_id','unitprice');
            foreach ($product_txt_arr as $key => $val) {
                $pinfo = $pMap[$val];
                $book_count = $pnum_txt_arr[$key];
                $price = $priceMap[$val];
                $pe = new ProductEntry();
                $pe['pid'] = $model->id;
                $pe['productclass_id'] = $pinfo['pid'];
                $pe['product_id'] = $val;
                $pe['unitprice'] = $price;
                $pe['unit'] = $pinfo->unitName;
                $pe['price'] = $price*($book_count-0);
                $pe['book_count'] = $book_count;
                $pe->save();
            }
            return $this->redirect(['createlist']);
        } else {
            $pte_arr = ProductEntry::find()->andWhere(['pid'=>$model->id])->all();
            $pte_arr_txt = "";
            $now = time()-10;
            $productclasslist = Refcode::getRefcodeBytype('productclass');

            $productArr = [];
            $productObj = Refcode::find()->where(['is_del'=>0,'type'=>'product'])->all();
            foreach ($productObj as $key => $value) {
                $unitName = $value->unitName;
                $nm = $unitName?$value->nm.' ('.$unitName.')':$value->nm;
                $info['id'] = $value->id;
                $info['nm'] = $nm;
                $productArr[$value->pid][] = $info;
            }
            foreach ($pte_arr as $key => $pte) {
                $temp = $now - $key;
                $productclasslist_txt = "";
                $productlist_txt = "";

                foreach ($productclasslist as $fkey => $fval) {
                    $flag = "";
                    if($fkey==$pte['productclass_id']){
                        $flag = " selected ";
                    }
                    $productclasslist_txt .= "<option value='".$fkey."' ".$flag.">".$fval."</option>";
                }
                if(!empty($productArr[$pte['productclass_id']])){
                    foreach ($productArr[$pte['productclass_id']] as $fkey => $fval) {
                        $flag = "";
                        if($fval['id']==$pte['product_id']){
                            $flag = " selected ";
                        }
                        $productlist_txt .= "<option value='".$fval['id']."' ".$flag.">".$fval['nm']."</option>";
                    }    
                }

                $pte_info = "<tr id='tr_".$temp."'><td><select class='ftype form-control' onchange='_changePtype(this,".$temp.")'><option value=''>--请选择--</option>".$productclasslist_txt."</select></td><td><select class='form-control fid product_".$temp."' onchange='_getUnitprice()'><option value=''>--请选择--</option>".$productlist_txt."</select></td><td><input onchange='_getUnitprice()' class='form-control num num_".$temp."' value='".$pte['book_count']."'></td><td><button type='button' class='btn btn-xs btn-danger' title='删除' aria-label='删除' data-pjax='0' onclick='_deltr(\"".$temp."\")'><i class='icon-trash bigger-120'></i></button></td></tr>";
                $pte_arr_txt .= $pte_info;
            }
            $model->book_date = date('Y-m-d',$model->book_date);
            $model->arrive_date = date('Y-m-d',$model->arrive_date);
            return $this->render('update', [
                'model' => $model,
                'pte_arr_txt' => $pte_arr_txt,
            ]);
        }
    }

    /**
     * Deletes an existing Product model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        $model['is_del'] = 1;
        $model->save();
        return $this->redirect(['createlist']);
    }

    /**
     * Finds the Product model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Product the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Product::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    /**
     * [actionGetproduct description]
     * @return [type] [description]
     */
    public function actionGetproduct(){
        $productclass_id = $this->request->post('productclass_id');
        $productArr = Refcode::getProduct($productclass_id);
        echo json_encode($productArr);
    }

    /**
     * [actionGetuprice description]
     * @return [type] [description]
     */
    public function actionGetuprice(){
        $gp = Yii::$app->request->post('gp_arr');
        $gp_arr = explode('|',$gp);
        $gp_list = [];
        foreach ($gp_arr as $key => $val) {
            $info = [];
            $v_arr = explode('_',$val);
            $info['id'] = $v_arr[0];
            $info['num'] = $v_arr[1];
            $gp_list[] = $info;
        }
        $pids = ArrayHelper::getColumn($gp_list,'id');
        $pMap = ArrayHelper::map(ProductTemplate::find()->andWhere(['product_id'=>$pids])->all(),'product_id','unitprice');
        $pprice = 0;
        foreach ($gp_list as $key => $val) {
            $pprice = $pprice + ($val['num']-0)*(@$pMap[$val['id']]-0);
        }
        echo json_encode($pprice);
    }
}
