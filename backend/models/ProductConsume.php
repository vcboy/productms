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
            [['productclass_id', 'product_id', 'unitprice', 'count', 'price', 'consume_type', 'create_dt'], 'required'],
            [['productclass_id', 'product_id', 'count', 'consume_type', 'status'], 'integer'],
            [['unitprice', 'price'], 'number'],
            //需要做销售数量和剩余数量判断
        ];
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
            'count' => '消耗数量',
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
            //这里是更新数据
            if($changedAttributes['status'] && $this->status == 1){
                $this->setConsumecount($this->count,$this->product_id,$this->id);
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
