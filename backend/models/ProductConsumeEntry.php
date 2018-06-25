<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%product_consume_entry}}".
 *
 * @property integer $id
 * @property integer $product_consume_id
 * @property integer $product_entry_id
 * @property integer $count
 */
class ProductConsumeEntry extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public $totalcount;
    public $totalprice;
    public $create_dt_s;
    public $create_dt_e;


    public static function tableName()
    {
        return '{{%product_consume_entry}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['productclass_id', 'product_id', 'product_entry_id'], 'integer'],
            [['count','create_dt','unitprice','consume_count'], 'number'],
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
            'create_dt' => '消耗时间',
            'product_entry_id' => '成品库存表id',
            'count' => '消耗数量',
            'unitprice' => '单价',
            'consume_count' => '报损数量'
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

    public function getProductconsume(){
        return $this->hasMany(ProductConsume::className(), ['product_consume_entry_id' => 'id']);
    }
}
