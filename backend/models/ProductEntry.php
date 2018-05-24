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
            [['productclass_id', 'product_id', 'unitprice', 'unit', 'price'], 'required'],
            [['productclass_id', 'product_id', 'book_count', 'send_count', 'depot_count', 'status'], 'integer'],
            [['unitprice', 'price'], 'number'],
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
}
