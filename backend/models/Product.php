<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%product}}".
 *
 * @property integer $id
 * @property string $booker_user
 * @property integer $book_date
 * @property integer $book_comment
 * @property integer $arrive_date
 * @property integer $is_customer
 * @property string $total_price
 * @property string $sender_user
 * @property integer $send_date
 * @property integer $send_status
 * @property string $send_comment
 * @property string $inspector_user
 * @property integer $inspect_date
 * @property integer $inspect_status
 * @property string $inspect_comment
 * @property integer $is_del
 * @property string $customer
 */
class Product extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%product}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['book_date', 'arrive_date'], 'required'],
            [[ 'is_customer', 'send_status',  'inspect_status', 'is_del'], 'integer'],
            [['total_price'], 'number'],
            [['book_comment','send_comment', 'inspect_comment'], 'string'],
            [['booker_user', 'sender_user', 'inspector_user'], 'string', 'max' => 32],
            [['customer'], 'string', 'max' => 128],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'booker_user' => '配货人',
            'book_date' => '配货时间',
            'book_comment' => '配货意见',
            'arrive_date' => '需要达到时间',
            'is_customer' => '是否本单位',
            'total_price' => '总价',
            'sender_user' => '发货人',
            'send_date' => '发货时间',
            'send_status' => '发货状态',
            'send_comment' => '发货意见',
            'inspector_user' => '验货人',
            'inspect_date' => '验货时间（入库时间）',
            'inspect_status' => '验货状态',
            'inspect_comment' => '验收意见',
            'is_del' => '是否删除',
            'customer' => '配送客户名称',
        ];
    }

   
}
