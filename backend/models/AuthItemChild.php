<?php

namespace backend\models;
use yii\helpers\ArrayHelper;
use Yii;

/**
 * This is the model class for table "wx_auth_item_child".
 *
 * @property string $parent
 * @property string $child
 */
class AuthItemChild extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'wx_auth_item_child';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['parent', 'child'], 'required'],
            [['parent', 'child'], 'string', 'max' => 64],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'parent' => 'Parent',
            'child' => 'Child',
        ];
    }

    /*
     * 保存后做一些操作
     */
    /*public function afterSave($insert, $changedAttributes)
    {
        parent::afterSave($insert, $changedAttributes);
        //$auth = Yii::$app->authManager;
        if($insert) {
            //这里是新增数据
            $role_name = Yii::$app->user->identity->role_name;
            $itemchild = ArrayHelper::map(AuthItemChild::find()->where(['parent'=>$role_name])->all(),'child','child');
            Yii::$app->session['itemchild'] = $itemchild;
        } else {
            //这里是更新数据
            //$auth->revokeAll($this->id);
            $role_name = Yii::$app->user->identity->role_name;
            $itemchild = ArrayHelper::map(AuthItemChild::find()->where(['parent'=>$role_name])->all(),'child','child');
            Yii::$app->session['itemchild'] = $itemchild;
        }
    }*/
}
