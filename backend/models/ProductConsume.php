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
}
