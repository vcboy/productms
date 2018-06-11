<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%pf_map}}".
 *
 * @property integer $id
 * @property integer $pid
 * @property integer $product_id
 * @property integer $purchase_id
 * @property integer $num
 * @property string $price
 */
class Pfmap extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%pf_map}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pid', 'product_id', 'purchase_id', 'num'], 'integer'],
            [['price'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'pid' => 'Pid',
            'product_id' => 'Product ID',
            'purchase_id' => 'Purchase ID',
            'num' => 'Num',
            'price' => 'Price',
        ];
    }
}
