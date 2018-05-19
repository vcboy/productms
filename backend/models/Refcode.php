<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%refcode}}".
 *
 * @property integer $id
 * @property string $nm
 * @property string $value
 * @property string $type
 * @property integer $is_del
 */
class Refcode extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%refcode}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['is_del'], 'integer'],
            [['nm'], 'string', 'max' => 128],
            [['nm'], 'required', 'message'=>'{attribute}不能为空'],
            [['value'], 'string', 'max' => 64],
            [['type'], 'string', 'max' => 32],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nm' => '名称',
            'value' => '对应的值',
            'type' => '类型',
            'is_del' => '是否删除 1是，0否',
        ];
    }
}
