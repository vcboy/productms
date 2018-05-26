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
            [['productclass_id', 'product_id', 'unitprice', 'price', 'consume_type', 'create_dt'], 'required'],
            [['productclass_id', 'product_id', 'count', 'consume_type', 'status', 'create_dt'], 'integer'],
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
            'price' => '单成品销售总价',
            'count' => '消耗数量',
            'consume_type' => '消耗方式 1：销售 2：损耗',
            'status' => '审核状态 1：销售默认审核通过 0：报损需要指定人员审核',
            'create_dt' => '添加时间',
        ];
    }
}
