<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%procut}}".
 *
 * @property integer $id
 * @property integer $booker_id
 * @property integer $book_date
 * @property integer $book_comment
 * @property integer $arrive_date
 * @property integer $is_customer
 * @property double $total_price
 * @property integer $sender_id
 * @property integer $send_date
 * @property integer $send_status
 * @property string $send_comment
 * @property integer $inspector_id
 * @property integer $inspect_date
 * @property integer $inspect_status
 * @property string $inspect_comment
 * @property integer $is_del
 * @property string $customer
 */
class Procut extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%procut}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['booker_id', 'book_date', 'book_comment', 'arrive_date', 'is_customer', 'sender_id', 'send_date', 'send_status', 'inspector_id', 'inspect_date', 'inspect_status', 'is_del'], 'integer'],
            [['book_date', 'arrive_date'], 'required'],
            [['total_price'], 'number'],
            [['send_comment', 'inspect_comment'], 'string'],
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
            'booker_id' => 'Booker ID',
            'book_date' => 'Book Date',
            'book_comment' => 'Book Comment',
            'arrive_date' => 'Arrive Date',
            'is_customer' => 'Is Customer',
            'total_price' => 'Total Price',
            'sender_id' => 'Sender ID',
            'send_date' => 'Send Date',
            'send_status' => 'Send Status',
            'send_comment' => 'Send Comment',
            'inspector_id' => 'Inspector ID',
            'inspect_date' => 'Inspect Date',
            'inspect_status' => 'Inspect Status',
            'inspect_comment' => 'Inspect Comment',
            'is_del' => 'Is Del',
            'customer' => 'Customer',
        ];
    }
}
