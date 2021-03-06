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
            [["nm"], "checkrepeat",'skipOnEmpty' => false, 'skipOnError' => false],
        ];
    }

    public function checkrepeat($attribute, $params){      
        if($this->isNewRecord){   
            $num = self::find()->where(['type'=>$this->type,'nm'=>$this->$attribute,'is_del'=>0])->count();         
            if($num > 0)
                $this->addError($attribute, "该名称已经存在.");
        }else{
            $obj = self::find()->where(['type'=>$this->type,'nm'=>$this->$attribute,'is_del'=>0])->one();
            if($obj && $obj->id != $this->id){
                $this->addError($attribute, "该名称已经存在.");
            }
            return false;
        }
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
            'unitName' => '单位',
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

    /**
     * 获取食材名称
     */
    public static function getFood($foodclass_id,$type){
        $foodObj = Refcode::find()->where(['pid'=>$foodclass_id,'type'=>$type,'is_del'=>0])->all();
        $foodArr = [];
        foreach ($foodObj as $key => $value) {
            $unitName = $value->unitName;
            $nm = $unitName?$value->nm.' ('.$unitName.')':$value->nm;
            $foodArr[$value->id] = $nm;
        }
        return $foodArr;
    }

    public static function getFoodbyid($food_id){
        $foodObj = self::findOne(['id'=>$food_id]);
        $unitName = $foodObj->unitName;
        $nm = $unitName?$foodObj->nm.' ('.$unitName.')':$foodObj->nm;
        return $nm;
    }

    /**
     * [getProduct 获取成品名称根据成品类型ID]
     * @param  [type] $productclass_id  [成品类型ID]
     * @return [type]                   [description]
     */
    public static function getProduct($productclass_id){
        $productObj = Refcode::find()->where(['pid'=>$productclass_id,'is_del'=>0])->all();
        $productArr = [];
        foreach ($productObj as $key => $value) {
            $unitName = $value->unitName;
            $nm = $unitName?$value->nm.' ('.$unitName.')':$value->nm;
            $productArr[$value->id] = $nm;
        }
        return $productArr;
    }
}
