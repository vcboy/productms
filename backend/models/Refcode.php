<?php

namespace backend\models;
use yii\helpers\ArrayHelper;
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
            [['is_del','pid','pid2'], 'integer'],
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
            'value' => '预警值',
            'type' => '类型',
            'is_del' => '是否删除 1是，0否',
            'parentName' => '所属分类',
            'unitName' => '食材单位',
        ];
    }


    public static function getRefcodeBytype($type)
    {
        $refcode = ArrayHelper::map(self::find()->where(['type'=>$type,'is_del'=>0])->all(),'id','nm');
        return $refcode;
    }

    /*
     * 得到上级菜单名称
     */
    public function getParentName(){
        $parentName = '';
        if($this->pid){
            $parent = self::findOne(['id'=>$this->pid]);
            $parentName = $parent -> nm;
        }
        return $parentName;
    }

    /*
     * 得到上级菜单名称
     */
    public function getUnitName(){
        $parentName = '';
        if($this->pid2){
            $parent = self::findOne(['id'=>$this->pid2]);
            $parentName = $parent -> nm;
        }
        return $parentName;
    }
}
