<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%product_consume}}".
 *
 * @property integer $id
 * @property integer $productclass_id
 * @property integer $product_id
 * @property double $unitprice
 * @property double $price
 * @property integer $count
 * @property integer $consume_type
 * @property integer $status
 * @property integer $create_dt
 */
class ProductConsume extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public $needcount;
    public $totalcount;
    public $totalprice;
    public $avgprice;
    public $create_dt_s;
    public $create_dt_e;
    public static function tableName()
    {
        return '{{%product_consume}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['productclass_id', 'product_id', 'count', 'consume_type', 'create_dt','create_user'], 'required'],
            [['productclass_id', 'product_id', 'consume_type', 'status','product_entry_id'], 'integer'],
            [['unitprice', 'price', 'count'], 'number'],
            [['create_user'], 'string','max' => 64],
            //需要做销售数量和剩余数量判断
            //[["count"], "checkcount"],
            //需要做销售数量和报损数量判断
            [["count"], "checkconsumecount"],
        ];
    }

    /**
     * 判断消耗数量和库存数量
     * @param  [type] $attribute [description]
     * @param  [type] $params    [description]
     * @return [type]            [description]
     */
    public function checkcount($attribute, $params){
        if($this->isNewRecord){
            if($this->consume_type == 1){
                $sycount = ProductEntry::find()->where(['product_id'=>$this->product_id,'status'=>1])->sum('sycount');
                if($this->$attribute > $sycount){                   
                    $this->addError($attribute, "消耗数量大于库存剩余数量，无法添加");
                }
            }
        }
    }

    /**
     * 判断消耗数量和报损数量
     * @param  [type] $attribute [description]
     * @param  [type] $params    [description]
     * @return [type]            [description]
     */
    public function checkconsumecount($attribute, $params){
        if($this->isNewRecord){
            if($this->$attribute > 0){
                $pteobj = ProductEntry::find()->where(['id'=>$this->product_entry_id,'status'=>1])->one();
                if($this->$attribute > $pteobj['consume_count']){                   
                    $this->addError($attribute, "报损数量大于消耗数量，无法添加");
                }
            }else{
                 $this->addError($attribute, "请输入正确的报损数量");
            }
        }
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'productclass_id' => '成品分类',
            'product_id' => '成品名称',
            'unitprice' => '销售单价',
            'price' => '成品销售总价',
            'count' => '报损数量',
            'consume_type' => '消耗方式',
            'status' => '审核状态 1：销售默认审核通过 0：报损需要指定人员审核',
            'create_dt' => '添加时间',
            'statustext' => '审核状态',
            'create_user' => '添加人',
        ];
    }

    public function getProductclass(){
        return $this->hasOne(Refcode::className(), ['id' => 'productclass_id']);
    }

    public function getProduct(){
        return $this->hasOne(Refcode::className(), ['id' => 'product_id']);
    }

    public function getProductentry(){
        return $this->hasOne(ProductEntry::className(), ['id' => 'product_entry_id']);
    }

    public function getStatustext(){
        return $this->status == 1?'<font color="green">已审核</font>':'<font color="red">未审核</font>';
    }

    public function afterSave($insert, $changedAttributes)
    {
        parent::afterSave($insert, $changedAttributes);
        if($insert) {
            //这里是新增数据
            if($this->status == 1){
                $this->setConsumecount($this->count,$this->product_id,$this->id);
                /*$this->needcount = $this->count;
                $objs = ProductEntry::find()->where(['and',['product_id'=>$this->product_id],['>','sycount',0],['status'=>1]])->orderBy('id asc')->all();
                foreach ($objs as $key => $value) {
                    $sycount = $value->sycount;
                    $this->needcount = $this->needcount - $sycount;
                    //一条库存记录的剩余数量不够消耗
                    if($this->needcount>0){                   
                        $pceobj = new ProductConsumeEntry();
                        $pceobj->product_consume_id = $this->id;
                        $pceobj->product_entry_id = $value->id;
                        $pceobj->count = $value->sycount;
                        $pceobj->save();
                        $value->sycount = 0;
                        $value->save();
                        //var_dump($value->getErrors());
                    }else{
                        $consumecount = abs($this->needcount);
                        $this->needcount = $sycount - $consumecount;
                        $pceobj = new ProductConsumeEntry();
                        $pceobj->product_consume_id = $this->id;
                        $pceobj->product_entry_id = $value->id;
                        $pceobj->count = $this->needcount;
                        $pceobj->save();
                        $value->sycount = $consumecount;
                        $value->save();
                        break;
                    }
                }*/
            }
        } else {
            //审核通过，更新库存
            if(isset($changedAttributes['status'])){
                if($changedAttributes['status'] == 0 && $this->status == 1){
                    $this->setConsumecount($this->count,$this->product_id,$this->id);
                } 
            }
            //更新消耗子表
            if(isset($changedAttributes['is_del'])){
                if($changedAttributes['is_del'] == 0 && $this->is_del == 1){
                    ProductConsumeEntry::updateAll(['is_del'=>1],['product_consume_id'=>$this->id]);
                } 
             }        
        }
    }

    public function setConsumecount($count,$product_id,$id){
        $this->needcount = $count;
        $objs = ProductEntry::find()->where(['and',['product_id'=>$product_id],['>','sycount',0],['status'=>1]])->orderBy('id asc')->all();
        foreach ($objs as $key => $value) {
            $sycount = $value->sycount;
            $this->needcount = $this->needcount - $sycount;
            //一条库存记录的剩余数量不够消耗
            if($this->needcount>0){
                $pceobj = new ProductConsumeEntry();
                $pceobj->product_consume_id = $id;
                $pceobj->product_entry_id = $value->id;
                $pceobj->count = $value->sycount;
                $pceobj->save();
                $value->sycount = 0;
                $value->save();
                //var_dump($value->getErrors());
            }else{
                $consumecount = abs($this->needcount);
                $this->needcount = $sycount - $consumecount;
                $pceobj = new ProductConsumeEntry();
                $pceobj->product_consume_id = $id;
                $pceobj->product_entry_id = $value->id;
                $pceobj->count = $this->needcount;
                $pceobj->save();
                $value->sycount = $consumecount;
                $value->save();
                break;
            }
        }
    }
}
