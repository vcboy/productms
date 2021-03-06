<?php

namespace backend\controllers;

use Yii;
use backend\models\ProductTemplate;
use backend\models\ProductTemplateSearch;
use backend\models\ProductTemplateEntry;
use backend\components\CController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use backend\models\Refcode;
use backend\models\Purchase;

/**
 * ProductTemplateController implements the CRUD actions for ProductTemplate model.
 */
class ProductTemplateController extends CController
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [],
            ],
        ];
    }

    /**
     * Lists all ProductTemplate models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ProductTemplateSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single ProductTemplate model.
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
     * Creates a new ProductTemplate model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new ProductTemplate();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $request = Yii::$app->request;
            $ftype_txt = $request->post('ftype_txt');
            $food_txt = $request->post('food_txt');
            $fnum_txt = $request->post('fnum_txt');
            $ftype_txt_arr = explode(',', $ftype_txt);
            $food_txt_arr = explode(',', $food_txt);
            $fnum_txt_arr = explode(',', $fnum_txt);
            foreach ($ftype_txt_arr as $key => $val) {
                $pte = new ProductTemplateEntry();
                $pte['ptid'] = $model->id;
                $pte['foodclass_id'] = $val;
                $pte['food_id'] = $food_txt_arr[$key];
                $pte['count'] = $fnum_txt_arr[$key];
                $pte->save();
            }
            return $this->redirect(['index']);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing ProductTemplate model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            ProductTemplateEntry::deleteAll('ptid = :ptid', [':ptid' => $model->id]);
            $request = Yii::$app->request;
            $ftype_txt = $request->post('ftype_txt');
            $food_txt = $request->post('food_txt');
            $fnum_txt = $request->post('fnum_txt');
            $ftype_txt_arr = explode(',', $ftype_txt);
            $food_txt_arr = explode(',', $food_txt);
            $fnum_txt_arr = explode(',', $fnum_txt);
            foreach ($ftype_txt_arr as $key => $val) {
                $pte = new ProductTemplateEntry();
                $pte['ptid'] = $model->id;
                $pte['foodclass_id'] = $val;
                $pte['food_id'] = $food_txt_arr[$key];
                $pte['count'] = $fnum_txt_arr[$key];
                $pte->save();
            }
            return $this->redirect(['index']);
        } else {
            $pte_arr = ProductTemplateEntry::find()->andWhere(['ptid'=>$model->id])->all();
            $pte_arr_txt = "";
            $now = time()-10;
            $foodclasslist = Refcode::getRefcodeBytype('foodclass');

            $foodArr = [];
            $foodObj = Refcode::find()->where(['is_del'=>0,'type'=>'food'])->all();
            foreach ($foodObj as $key => $value) {
                $unitName = $value->unitName;
                $nm = $unitName?$value->nm.' ('.$unitName.')':$value->nm;
                $info['id'] = $value->id;
                $info['nm'] = $nm;
                $foodArr[$value->pid][] = $info;
            }
            foreach ($pte_arr as $key => $pte) {
                $temp = $now - $key;
                $foodclasslist_txt = "";
                $foodlist_txt = "";

                foreach ($foodclasslist as $fkey => $fval) {
                    $flag = "";
                    if($fkey==$pte['foodclass_id']){
                        $flag = " selected ";
                    }
                    $foodclasslist_txt .= "<option value='".$fkey."' ".$flag.">".$fval."</option>";
                }
                if(!empty($foodArr[$pte['foodclass_id']])){
                    foreach ($foodArr[$pte['foodclass_id']] as $fkey => $fval) {
                        $flag = "";
                        if($fval['id']==$pte['food_id']){
                            $flag = " selected ";
                        }
                        $foodlist_txt .= "<option value='".$fval['id']."' ".$flag.">".$fval['nm']."</option>";
                    }    
                }

                $pte_info = "<tr id='tr_".$temp."'><td><select class='ftype form-control' onchange='_changeFtype(this,".$temp.")'><option value=''>--请选择--</option>".$foodclasslist_txt."</select></td><td><select class='form-control fid food_".$temp."' onchange='_getUnitprice()'><option value=''>--请选择--</option>".$foodlist_txt."</select></td><td><input onchange='_getUnitprice()' class='form-control num num_".$temp."' value='".$pte['count']."'></td><td><button type='button' class='btn btn-xs btn-danger' title='删除' aria-label='删除' data-pjax='0' onclick='_deltr(\"".$temp."\")'><i class='icon-trash bigger-120'></i></button></td></tr>";
                $pte_arr_txt .= $pte_info;
            }
            return $this->render('update', [
                'model' => $model,
                'pte_arr_txt' => $pte_arr_txt,
            ]);
        }
    }

    /**
     * Deletes an existing ProductTemplate model.
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
     * Finds the ProductTemplate model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ProductTemplate the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = ProductTemplate::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    /**
     * [actionGetproduct 更具类型获取成品]
     * @return [type] [description]
     */
    public function actionGetproduct(){
        $productclass_id = $this->request->post('productclass_id');
        //$productArr = ArrayHelper::map(Refcode::find()->where(['pid'=>$productclass_id,'is_del'=>0])->all(),'id','nm');
        $productArr = Refcode::getFood($productclass_id,'product');
        echo json_encode($productArr);
    }

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
        $f_arr = Purchase::find()->andWhere(['is_del'=>0,'food_id'=>$pids])->orderBy('pur_date desc')->all();
        $fMap = [];
        foreach ($f_arr as $key => $val) {
            if(empty($fMap[$val['food_id']])){
                $fMap[$val['food_id']] = $val['price'];
            }
        }
        $pprice = 0;
        foreach ($gp_list as $key => $val) {
            $pprice = $pprice + ($val['num']-0)*((empty($fMap[$val['id']])?0:$fMap[$val['id']])-0);
        }
        $pprice = round($pprice,2);
        echo json_encode($pprice);exit;
    }

    public function actionFlashtpprice(){
        $pt_arr = ProductTemplate::find()->andWhere(['is_del'=>0])->all();
        $f_arr = Purchase::find()->andWhere(['is_del'=>0])->orderBy('pur_date desc,id desc')->all();
        $fMap = [];
        foreach ($f_arr as $key => $val) {
            if(empty($fMap[$val['food_id']])){
                $fMap[$val['food_id']] = $val['price'];
            }
        }
        foreach ($pt_arr as $key => $val) {
            $pte_arr = ProductTemplateEntry::find()->andWhere(['ptid'=>$val['id']])->all();
            $price = 0;
            foreach ($pte_arr as $k => $v) {
                $t_price = empty($fMap[$v['food_id']])?0:$fMap[$v['food_id']];
                $price = $price + $t_price*$v['count'];
            }
            $price = round($price,2);
            $val['unitprice'] = $price;
            $val->save();
        }
        echo json_encode(['flag'=>'T']);exit;
    }


    public function actionChecksub(){
        $product_id = Yii::$app->request->post('product_id');
        $id =  Yii::$app->request->post('id');
        $p_arr = ProductTemplate::find()->andWhere(['product_id'=>$product_id,'is_del'=>0])->andWhere(['<>','id',$id])->asArray()->all();
        $flag = 1;
        $msg = '';
        if(!empty($p_arr)&&count($p_arr)>0){
            $flag = 0;
            $msg = "模板已经存在，一个成品有且只能有一个模板。";
        }
        echo json_encode(['flag'=>$flag,'msg'=>$msg]);exit;
    }

    public function actionGetunit(){
        $product_id = Yii::$app->request->post('product_id');
        $productObj = Refcode::find()->where(['id'=>$product_id,'is_del'=>0])->one();
        return $productObj->pid2;
    }
}
