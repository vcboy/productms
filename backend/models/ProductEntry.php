<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%product_entry}}".
 *
 * @property integer $id
 * @property integer $productclass_id
 * @property integer $product_id
 * @property double $unitprice
 * @property string $unit
 * @property double $price
 * @property integer $book_count
 * @property integer $send_count
 * @property integer $depot_count
 * @property integer $status
 */
class ProductEntry extends \yii\db\ActiveRecord
{
    public $totalcount;
    public $totalprice;
    public $avgprice;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%product_entry}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['productclass_id', 'product_id', 'unitprice', 'price'], 'required'],
            [['productclass_id', 'product_id',  'status','pid'], 'integer'],
            [['unitprice', 'price','book_count', 'send_count', 'depot_count'], 'number'],
            [['unit'], 'string', 'max' => 32],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'productclass_id' => 'Productclass ID',
            'product_id' => 'Product ID',
            'unitprice' => 'Unitprice',
            'unit' => 'Unit',
            'price' => 'Price',
            'book_count' => 'Book Count',
            'send_count' => 'Send Count',
            'depot_count' => 'Depot Count',
            'status' => 'Status',
        ];
    }

    public function getProductclass(){
        return $this->hasOne(Refcode::className(), ['id' => 'productclass_id']);
    }

    public function getProduct(){
        return $this->hasOne(Refcode::className(), ['id' => 'product_id']);
    }

    public function getPinfo(){
        return $this->hasOne(Product::className(), ['id' => 'pid']);
    }
}
