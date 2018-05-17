<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "job_user".
 *
 * @property integer $id
 * @property string $username
 * @property string $password
 * @property string $login_time
 * @property integer $sex
 * @property integer $level
 * @property integer $power
 * @property string $create_time
 * @property string $real_name
 */
class JobUser extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'job_user';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['login_time', 'create_time'], 'safe'],
            [['sex', 'level', 'power'], 'integer'],
            [['username', 'real_name'], 'string', 'max' => 50],
            [['password'], 'string', 'max' => 16]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'id',
            'username' => '用户名',
            'password' => '密码',
            'login_time' => '登录时间',
            'sex' => '性别',
            'level' => '等级',
            'power' => '权限',
            'create_time' => '创建时间',
            'real_name' => '真实姓名',
        ];
    }
}
