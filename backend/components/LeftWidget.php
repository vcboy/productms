<?php
namespace backend\components;

use Yii;
use yii\base\Widget;
use backend\models\Admin;
use backend\models\Menu;

class LeftWidget extends Widget{
    public function init(){
       parent::init();
    }

    public function run(){
        $admin = Admin::findById(Yii::$app -> user -> id);
        $menu = new Menu();
        $auth = Yii::$app->authManager;
        $userid = Yii::$app->user->identity->id;
        $menudata = Yii::$app->session['menu'];
        if(!$menudata){
            $leftMenu = $menu ->getUserLeftMenu($userid);
            Yii::$app->session['menu'] = $leftMenu;
        }else{
            $leftMenu = $menudata;
        }
        return $this -> render('left',['admin' => $admin,'leftMenu' => $leftMenu]);
    }

}
