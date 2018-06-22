<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%product_template_entry}}".
 *
 * @property integer $id
 * @property integer $foodclass_id
 * @property integer $food_id
 * @property integer $count
 */
class ProductTemplateEntry extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%product_template_entry}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['foodclass_id', 'food_id'], 'integer'],
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
            'foodclass_id' => '食品类型',
            'food_id' => '食品名称',
            'count' => '配比数量',
        ];
    }
}
