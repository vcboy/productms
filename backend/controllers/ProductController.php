<?php

namespace backend\controllers;

use Yii;
use backend\models\Product;
use backend\models\Refcode;
use backend\models\ProductSearch;
use backend\models\ProductTemplate;
use backend\models\ProductTemplateEntry;
use backend\models\ProductEntry;
use backend\models\Purchase;
use backend\models\Pfmap;
use backend\models\ProductEntrySearch;
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
                    'view' => ['POST','GET'],
                ],
            ],
        ];
    }

    /**
     * Lists all Product models.
     * @return mixed
     */
    public function actionSearch()
    {
        $searchModel = new ProductEntrySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->select(['sum(sycount) as totalcount,sum(price) as totalprice,round(sum(price)/sum(book_count),2) as avgprice,productclass_id,product_id']);
        $dataProvider->query->andWhere(['status'=>1]);
        $dataProvider->query->groupBy(['product_id']);
        return $this->render('search', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Lists all Product models.
     * @return mixed
     */
    public function actionGroupproduct()
    {
        $searchModel = new ProductSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andWhere(['is_del'=>0,'send_status'=>1])->andWhere(['or',['is_customer'=>0,'inspect_status'=>1],['is_customer'=>1]]);
        $dataProvider->query->orderBy('book_date desc');
        return $this->render('groupproduct', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Lists all Product models.
     * @return mixed
     */
    public function actionCreatelist()
    {
        $searchModel = new ProductSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andWhere(['is_del'=>0]);
        $dataProvider->query->orderBy('book_date desc');
        return $this->render('createlist', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Lists all Product models.
     * @return mixed
     */
    public function actionSendlist()
    {
        $searchModel = new ProductSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andWhere(['is_del'=>0]);
        $dataProvider->query->orderBy('book_date desc');
        return $this->render('sendlist', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Lists all Product models.
     * @return mixed
     */
    public function actionInspectorlist()
    {
        $searchModel = new ProductSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andWhere(['is_del'=>0,'is_customer'=>0,'send_status'=>1]);
        $dataProvider->query->orderBy('send_date desc');
        return $this->render('inspectorlist', [
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
        $model = $this->findModel($id);
        $pte_arr = ProductEntry::find()->andWhere(['pid'=>$model->id])->all();
        $pte_arr_txt = "";
        $pte_info_txt_arr = [];
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
                    $productclasslist_txt = $fval;
                }
            }
            if(!empty($productArr[$pte['productclass_id']])){
                foreach ($productArr[$pte['productclass_id']] as $fkey => $fval) {
                    $flag = "";
                    if($fval['id']==$pte['product_id']){
                        $productlist_txt = $fval['nm'];
                    }
                }    
            }

            $pte_info = "<tr><td>".$productclasslist_txt."</td><td>".$productlist_txt."</td><td>".$pte['book_count']."</td><td>".(empty($pte['send_count'])?"-":$pte['send_count'])."</td><td>".(empty($pte['depot_count'])?"-":$pte['depot_count'])."</td></tr>";
            $pte_arr_txt .= $pte_info;
            $pte_info_txt_arr[] = $pte['product_id']."_".$pte['book_count'];
        }
        $pte_arr_txt .= "<input type='hidden' id='gp_arr' value='".implode('|', $pte_info_txt_arr)."'>";
        $model->book_date = date('Y-m-d',$model->book_date);
        $model->arrive_date = date('Y-m-d',$model->arrive_date);
        return $this->render('view', [
            'model' => $model,
            'pte_arr_txt' => $pte_arr_txt,
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
                'pte_arr_txt' => '',
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
            $send_status = $model->send_status;
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
                if($send_status==1){
                    $pe['send_count'] = $book_count;
                }
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
     * Updates an existing Product model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionCopy($id)
    {
        $model = $this->findModel($id);
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
            $model->book_date = date('Y-m-d',$model->book_date);
            $model->arrive_date = date('Y-m-d',$model->arrive_date);
            return $this->render('create', [
                'model' => $model,
                'pte_arr_txt' => $pte_arr_txt,
            ]);
        }
    }

    /**
     * Send an existing Product model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionSend($id)
    {
        $model = $this->findModel($id);
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $model->book_date = strtotime($model->book_date);
            $model->arrive_date = strtotime($model->arrive_date);
            $model->send_date = strtotime($model->send_date);
            $model->send_status = 1;
            $model->save();
            if($model->is_customer){//其他单位，发货需要减去库存
                $pte_arr = ProductEntry::find()->andWhere(['pid'=>$model->id])->all();//获取发货清单
                $gp_list = [];
                foreach ($pte_arr as $key => $val) {
                    $val->send_count = $val->book_count;
                    $val->status = 1;
                    $val->save();
                    $info = [];
                    $info['id'] = $val['product_id'];
                    $info['num'] = $val['send_count'];
                    $gp_list[] = $info;
                }
                $pids = ArrayHelper::getColumn($gp_list,'id');
                $p_arr = ProductTemplate::find()->andWhere(['product_id'=>$pids])->all();//得到所有的成品模板
                $pMap = ArrayHelper::map($p_arr,'product_id','id');//获取成品id与模板id的map
                $ptids = ArrayHelper::getColumn($p_arr,'id');
                $pe_arr = ProductTemplateEntry::find()->andWhere(['ptid'=>$ptids])->all();//拿到所有成品的明细

                $peMap = [];
                $foodids = [];//所有配额食物的数量
                $foodids_tmp = [];
                foreach ($pe_arr as $key => $val) {
                    $peMap[$val['ptid']][] = $val;
                    $foodids_tmp[$val['food_id']]= 1;
                }
                foreach ($foodids_tmp as $key => $val) {
                    $foodids[] = $key;
                }
                $fMap = ArrayHelper::map(Refcode::find()->andWhere(['id'=>$foodids])->all(),'id','nm');
                foreach ($gp_list as $key => $val) {//循环配货表
                    $ptid = $pMap[$val['id']];//得到食材配比明细
                    $pnum = $val['num']-0;
                    $pe_arr = $peMap[$ptid];
                    foreach ($pe_arr as $k => $v) {//食材模板
                        $total_pay = 0;
                        $fnum = $v['count']*$pnum;//需要出库的食物
                        $store_arr = Purchase::find()->andWhere(['food_id'=>$v['food_id'],'is_del'=>0,'status'=>1])->andWhere(['>','sycount',0])->orderBy('depot_date')->all();//获取库存从大到小
                        foreach ($store_arr as $skey => $sinfo) {
                            $st_num = $sinfo['sycount'];
                            if($fnum>=$st_num){
                                $sinfo->sycount = 0;
                                $sinfo->save();//减去库存
                                $fnum = $fnum - ($st_num-0);
                                $pfmap = New Pfmap();
                                $pfmap->pid = $model->id;
                                $pfmap->product_id = $val['id'];
                                $pfmap->purchase_id = $sinfo['id'];
                                $pfmap->num = $st_num;
                                $pfmap->price = $sinfo['price'];
                                $pfmap->save();//将数据记录到中间表
                                $total_pay = $total_pay + ($sinfo['price']-0)*($st_num-0);
                            }else{
                                $st_num = ($st_num-0) - $fnum;
                                $sinfo->sycount = $st_num;
                                $sinfo->save();//减去库存
                                $pfmap = New Pfmap();
                                $pfmap->pid = $model->id;
                                $pfmap->product_id = $val['id'];
                                $pfmap->purchase_id = $sinfo['id'];
                                $pfmap->num = $fnum;
                                $pfmap->price = $sinfo['price'];
                                $pfmap->save();//将数据记录到中间表
                                $total_pay = $total_pay + ($sinfo['price']-0)*($fnum-0);
                                break;
                            }
                        }
                    }
                    //$val['sycount'] = $pnum;
                    $val['price'] = $total_pay;
                    $val['unitprice'] = round($total_pay/$pnum,2);
                }
            }else{//更新发货数量
                $pte_arr = ProductEntry::find()->andWhere(['pid'=>$model->id])->all();//获取发货清单
                foreach ($pte_arr as $key => $val) {
                    $val->send_count = $val->book_count;
                    $val->save();
                }
            }
            return $this->redirect(['sendlist']);
        } else {
            $pte_arr = ProductEntry::find()->andWhere(['pid'=>$model->id])->all();
            $pte_arr_txt = "";
            $pte_info_txt_arr = [];
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
                        $productclasslist_txt = $fval;
                    }
                }
                if(!empty($productArr[$pte['productclass_id']])){
                    foreach ($productArr[$pte['productclass_id']] as $fkey => $fval) {
                        $flag = "";
                        if($fval['id']==$pte['product_id']){
                            $productlist_txt = $fval['nm'];
                        }
                    }    
                }

                $pte_info = "<tr><td>".$productclasslist_txt."</td><td>".$productlist_txt."</td><td>".$pte['book_count']."</td><td>".$pte['book_count']."</td></tr>";
                $pte_arr_txt .= $pte_info;
                $pte_info_txt_arr[] = $pte['product_id']."_".$pte['book_count'];
            }
            $pte_arr_txt .= "<input type='hidden' id='gp_arr' value='".implode('|', $pte_info_txt_arr)."'>";
            $model->book_date = date('Y-m-d',$model->book_date);
            $model->arrive_date = date('Y-m-d',$model->arrive_date);
            return $this->render('send', [
                'model' => $model,
                'pte_arr_txt' => $pte_arr_txt,
            ]);
        }
    }


    /**
     * Send an existing Product model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionInspector($id)
    {
        $model = $this->findModel($id);
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $model->book_date = strtotime($model->book_date);
            $model->arrive_date = strtotime($model->arrive_date);
            $model->send_date = strtotime($model->send_date);
            $model->inspect_date = strtotime($model->inspect_date);
            $model->inspect_status = 1;
            $model->save();

            $pte_arr = ProductEntry::find()->andWhere(['pid'=>$model->id])->all();//获取发货清单
            $gp_list = [];
            foreach ($pte_arr as $key => $val) {
                $val->depot_count = $val->book_count;
                $val->sycount = $val->book_count;
                $val->status = 1;
                $val->save();
                $info = [];
                $info['id'] = $val['product_id'];
                $info['num'] = $val['send_count'];
                $gp_list[] = $info;
            }
            $pids = ArrayHelper::getColumn($gp_list,'id');
            $p_arr = ProductTemplate::find()->andWhere(['product_id'=>$pids])->all();//得到所有的成品模板
            $pMap = ArrayHelper::map($p_arr,'product_id','id');//获取成品id与模板id的map
            $ptids = ArrayHelper::getColumn($p_arr,'id');
            $pe_arr = ProductTemplateEntry::find()->andWhere(['ptid'=>$ptids])->all();//拿到所有成品的明细

            $peMap = [];
            $foodids = [];//所有配额食物的数量
            $foodids_tmp = [];
            foreach ($pe_arr as $key => $val) {
                $peMap[$val['ptid']][] = $val;
                $foodids_tmp[$val['food_id']]= 1;
            }
            foreach ($foodids_tmp as $key => $val) {
                $foodids[] = $key;
            }
            $fMap = ArrayHelper::map(Refcode::find()->andWhere(['id'=>$foodids])->all(),'id','nm');
            foreach ($gp_list as $key => $val) {//循环配货表
                $ptid = $pMap[$val['id']];//得到食材配比明细
                $pnum = $val['num']-0;
                $pe_arr = $peMap[$ptid];
                foreach ($pe_arr as $k => $v) {//食材模板
                    $total_pay = 0;
                    $fnum = $v['count']*$pnum;//需要出库的食物
                    $store_arr = Purchase::find()->andWhere(['food_id'=>$v['food_id'],'is_del'=>0,'status'=>1])->andWhere(['>','sycount',0])->orderBy('depot_date')->all();//获取库存从大到小
                    foreach ($store_arr as $skey => $sinfo) {
                        $st_num = $sinfo['sycount'];
                        if($fnum>=$st_num){
                            $sinfo->sycount = 0;
                            $sinfo->save();//减去库存
                            $fnum = $fnum - ($st_num-0);
                            $pfmap = New Pfmap();
                            $pfmap->pid = $model->id;
                            $pfmap->product_id = $val['id'];
                            $pfmap->purchase_id = $sinfo['id'];
                            $pfmap->num = $st_num;
                            $pfmap->price = $sinfo['price'];
                            $pfmap->save();//将数据记录到中间表
                            $total_pay = $total_pay + ($sinfo['price']-0)*($st_num-0);
                        }else{
                            $st_num = ($st_num-0) - $fnum;
                            $sinfo->sycount = $st_num;
                            $sinfo->save();//减去库存
                            $pfmap = New Pfmap();
                            $pfmap->pid = $model->id;
                            $pfmap->product_id = $val['id'];
                            $pfmap->purchase_id = $sinfo['id'];
                            $pfmap->num = $fnum;
                            $pfmap->price = $sinfo['price'];
                            $pfmap->save();//将数据记录到中间表
                            $total_pay = $total_pay + ($sinfo['price']-0)*($fnum-0);
                            break;
                        }
                    }
                }
                $val['sycount'] = $pnum;
                $val['price'] = $total_pay;
                $val['unitprice'] = round($total_pay/$pnum,2);
            }
            return $this->redirect(['inspectorlist']);
        } else {
            $pte_arr = ProductEntry::find()->andWhere(['pid'=>$model->id])->all();
            $pte_arr_txt = "";
            $pte_info_txt_arr = [];
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
                        $productclasslist_txt = $fval;
                    }
                }
                if(!empty($productArr[$pte['productclass_id']])){
                    foreach ($productArr[$pte['productclass_id']] as $fkey => $fval) {
                        $flag = "";
                        if($fval['id']==$pte['product_id']){
                            $productlist_txt = $fval['nm'];
                        }
                    }    
                }

                $pte_info = "<tr><td>".$productclasslist_txt."</td><td>".$productlist_txt."</td><td>".$pte['book_count']."</td><td>".$pte['book_count']."</td></tr>";
                $pte_arr_txt .= $pte_info;
                $pte_info_txt_arr[] = $pte['product_id']."_".$pte['book_count'];
            }
            $pte_arr_txt .= "<input type='hidden' id='gp_arr' value='".implode('|', $pte_info_txt_arr)."'>";
            $model->book_date = date('Y-m-d',$model->book_date);
            $model->arrive_date = date('Y-m-d',$model->arrive_date);
            return $this->render('inspector', [
                'model' => $model,
                'pte_arr_txt' => $pte_arr_txt,
            ]);
        }
    }


    /**
     * Send an existing Product model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionGroupproductdetail($id)
    {
        $model = $this->findModel($id);
        $pte_arr = ProductEntry::find()->andWhere(['pid'=>$model->id])->all();
        $pte_arr_txt = "";
        $pte_info_txt_arr = [];
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
                    $productclasslist_txt = $fval;
                }
            }
            if(!empty($productArr[$pte['productclass_id']])){
                foreach ($productArr[$pte['productclass_id']] as $fkey => $fval) {
                    $flag = "";
                    if($fval['id']==$pte['product_id']){
                        $productlist_txt = $fval['nm'];
                    }
                }    
            }

            $pte_info = "<tr><td>".$productclasslist_txt."</td><td>".$productlist_txt."</td><td>".$pte['book_count']."</td><td>￥".$pte['unitprice']."元</td><td>￥".$pte['price']."元</td></tr>";
            $pte_arr_txt .= $pte_info;
            $pte_info_txt_arr[] = $pte['product_id']."_".$pte['book_count'];
        }
        $pte_arr_txt .= "<input type='hidden' id='gp_arr' value='".implode('|', $pte_info_txt_arr)."'>";
        $model->book_date = date('Y-m-d',$model->book_date);
        $model->arrive_date = date('Y-m-d',$model->arrive_date);
        return $this->render('groupproductdetail', [
            'model' => $model,
            'pte_arr_txt' => $pte_arr_txt,
        ]);
    
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


    public function actionGetstoreinfo(){
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
        $p_arr = ProductTemplate::find()->andWhere(['product_id'=>$pids])->all();
        $pMap = ArrayHelper::map($p_arr,'product_id','id');
        $ptids = ArrayHelper::getColumn($p_arr,'id');

        $pe_arr = ProductTemplateEntry::find()->andWhere(['ptid'=>$ptids])->all();

        $peMap = [];
        $foodids = [];
        $foodids_tmp = [];
        foreach ($pe_arr as $key => $val) {
            $peMap[$val['ptid']][] = $val;
            $foodids_tmp[$val['food_id']]= 1;
        }


        foreach ($foodids_tmp as $key => $val) {
            $foodids[] = $key;           
        }
        $fMap = ArrayHelper::map(Refcode::find()->andWhere(['id'=>$foodids])->all(),'id','nm');
        $store_arr = Purchase::find()->select(['sum(sycount) as snum,food_id'])->andWhere(['food_id'=>$foodids,'is_del'=>0,'status'=>1])->groupBy(['food_id'])->asArray()->all();
        $sMap = ArrayHelper::map($store_arr,'food_id','snum');
        $pf_arr = [];
        foreach ($gp_list as $key => $val) {
            $ptid = $pMap[$val['id']];
            $pnum = $val['num'];
            $pe_arr = $peMap[$ptid];
            foreach ($pe_arr as $k => $v) {
                $fnum = empty($pf_arr[$v['food_id']])?0:$pf_arr[$v['food_id']];
                $pf_arr[$v['food_id']] = $fnum + $v['count'] * $pnum;
            }
        }

        $table_txt = '<table class="table table-striped table-bordered"><tr><th>食材名称</th><td>配比所需</td><td>当前库存</td><td>配送后剩余</td></tr>';
        foreach ($pf_arr as $key => $val) {
            $fname = $fMap[$key];
            $fneed = $val;
            $fhas = empty($sMap[$key])?0:$sMap[$key];
            $fsycount = $fhas-$fneed;
            $table_txt .= "<tr><td>".$fname."</td><td>".$fneed."</td><td>".$fhas."</td><td>".($fsycount>0?("<font color='green'>".$fsycount."</font>"):("<font color='red'>".$fsycount."【需采购】</font>"))."</td></tr>";
        }
        $table_txt .= '</table>';
        print_r($table_txt);exit;
    }



    public function actionHasenough(){
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
        $p_arr = ProductTemplate::find()->andWhere(['product_id'=>$pids])->all();
        $pMap = ArrayHelper::map($p_arr,'product_id','id');
        $ptids = ArrayHelper::getColumn($p_arr,'id');

        $pe_arr = ProductTemplateEntry::find()->andWhere(['ptid'=>$ptids])->all();

        $peMap = [];
        $foodids = [];
        $foodids_tmp = [];
        foreach ($pe_arr as $key => $val) {
            $peMap[$val['ptid']][] = $val;
            $foodids_tmp[$val['food_id']]= 1;
        }


        foreach ($foodids_tmp as $key => $val) {
            $foodids[] = $key;           
        }
        $fMap = ArrayHelper::map(Refcode::find()->andWhere(['id'=>$foodids])->all(),'id','nm');
        $store_arr = Purchase::find()->select(['sum(sycount) as snum,food_id'])->andWhere(['food_id'=>$foodids,'is_del'=>0,'status'=>1])->groupBy(['food_id'])->asArray()->all();
        $sMap = ArrayHelper::map($store_arr,'food_id','snum');
        $pf_arr = [];
        foreach ($gp_list as $key => $val) {
            $ptid = $pMap[$val['id']];
            $pnum = $val['num'];
            $pe_arr = $peMap[$ptid];
            foreach ($pe_arr as $k => $v) {
                $fnum = empty($pf_arr[$v['food_id']])?0:$pf_arr[$v['food_id']];
                $pf_arr[$v['food_id']] = $fnum + $v['count'] * $pnum;
            }
        }
        $flag = 1;
        $table_txt = '<table class="table table-striped table-bordered"><tr><th>食材名称</th><td>配比所需</td><td>当前库存</td><td>配送后剩余</td></tr>';
        foreach ($pf_arr as $key => $val) {
            $fname = $fMap[$key];
            $fneed = $val;
            $fhas = empty($sMap[$key])?0:$sMap[$key];
            $fsycount = $fhas-$fneed;
            if($fsycount<0){
                $flag = 0;
            }
            $table_txt .= "<tr><td>".$fname."</td><td>".$fneed."</td><td>".$fhas."</td><td>".($fsycount>0?("<font color='green'>".$fsycount."</font>"):("<font color='red'>".$fsycount."【需采购】</font>"))."</td></tr>";
        }
        $table_txt .= '</table>';
        if(empty($flag)){
            print_r($table_txt);exit;
        }else{
            print_r(1);exit;
        }
    }

    public function actionSearchdetail(){
        $product_id = Yii::$app->request->get('product_id');
        $searchModel = new ProductEntrySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andWhere(['status'=>1,'product_id'=>$product_id]);
        $dataProvider->query->orderBy('id desc');
        return $this->render('searchdetail', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

}
