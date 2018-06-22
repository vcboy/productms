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
            [['product_consume_id', 'product_entry_id'], 'integer'],
            [['count'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'product_consume_id' => '成品消耗表id',
            'product_entry_id' => '成品库存表id',
            'count' => '消耗数量',
        ];
    }
}
