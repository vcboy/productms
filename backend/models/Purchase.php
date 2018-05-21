<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%purchase}}".
 *
 * @property integer $id
 * @property integer $foodclass_id
 * @property integer $food_id
 * @property integer $param_id
 * @property integer $book_count
 * @property double $price
 * @property string $unit
 * @property string $brand
 * @property string $supplier
 * @property integer $pur_user
 * @property integer $pur_date
 * @property integer $depot_user
 * @property integer $depot_count
 * @property integer $depot_date
 * @property integer $sycount
 * @property integer $status
 * @property string $comment
 * @property integer $is_del
 */
class Purchase extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%purchase}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['foodclass_id', 'food_id', 'param_id', 'book_count', 'depot_user', 'depot_count', 'depot_date', 'sycount', 'status', 'is_del'], 'integer'],
            [['price'], 'number'],
            [['foodclass_id', 'food_id','price','book_count','pur_user', 'pur_date'], 'required'],
            [['comment'], 'string'],
            [['unit'], 'string', 'max' => 32],
            [['brand', 'supplier'], 'string', 'max' => 128],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'foodclass_id' => '食材分类',
            'food_id' => '食材名称',
            'param_id' => '规格参数',
            'book_count' => '采购数量',
            'price' => '单价',
            'unit' => '食材单位',
            'brand' => '品牌',
            'supplier' => '供应商',
            'pur_user' => '采购人',
            'pur_date' => '采购时间',
            'depot_user' => '入库人',
            'depot_count' => '入库数量',
            'depot_date' => '入库时间',
            'sycount' => '剩余数量',
            'status' => '0：未入库，1已入库',
            'comment' => '验收意见',
            'is_del' => '是否删除 1是，0否',
        ];
    }
}
