<?php

namespace backend\models;
use backend\models\Refcode;
use Yii;

/**
 * This is the model class for table "{{%product_template}}".
 *
 * @property integer $id
 * @property integer $productclass_id
 * @property integer $product_id
 * @property double $unitprice
 * @property string $unit
 * @property integer $is_del
 */
class ProductTemplate extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%product_template}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['productclass_id', 'product_id', 'is_del'], 'integer'],
            [['unitprice'], 'number'],
            [['productclass_id', 'product_id','unitprice','unit'], 'required'],
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
            'productclass_id' => '成品类型',
            'product_id' => '成品名称',
            'unitprice' => '单价(元)',
            'unit' => '单位',
            'is_del' => '是否删除',
        ];
    }

    public function getProductclass(){
        return $this->hasOne(Refcode::className(), ['id' => 'productclass_id']);
    }

    public function getProduct(){
        return $this->hasOne(Refcode::className(), ['id' => 'product_id']);
    }

    public function getUnitinfo(){
        return $this->hasOne(Refcode::className(), ['id' => 'unit']);
    }
}
