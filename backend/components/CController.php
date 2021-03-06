<?php
namespace backend\components;

use Yii;
use yii\web\Controller;
use yii\web\Response;

class CController extends Controller
{

    //public $layout = 'adminlte';
    public $layout = 'default';
    public $isdelete = ['0'=>"未删除","1"=>"已删除"];
    public $enableCsrfValidation = false;
    public $subject;
    public $childSubject;//子菜单
    public $is_welcome;//是否欢迎页面
    public $request;
    public $user;
    
    public function renderJson($params = array())
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        return $params;
    }
    public function init(){
        /*$controller     = Yii::$app->controller->id;            //得到当前控制器名称
        $action         = Yii::$app->controller->action->id;    //得到当前action名称        
        $current_url    = $controller.'/'.$action;*/
        
        //$this->childSubject = '欢迎页面';
        $this->request = Yii::$app->request;
        $this->user = Yii::$app->user->identity;
        if(Yii::$app -> user -> isGuest){
            return $this -> goBack();
        }
    }
    /**
     * 添加下载文件的header
     * @param $filename 文件名
     */
    public function add_dl_header($filename) {
        $response = Yii::$app->response;
        $response->headers->set ( "Content-Type", "application/octet-stream" );
        $response->headers->set ( "Content-Disposition", " attachment; filename='" . iconv ( "utf-8", "gb2312", $filename ) ." '" );
        $response->headers->set ( "Content-Transfer-Encoding", "binary" );
        $response->headers->set ( "Last-Modified",  gmdate ( "D, d M Y H:i:s" ) . " GMT" );
        $response->headers->set ( "Cache-Control", " must-revalidate, post-check=0, pre-check=0" );
        $response->headers->set ( "Pragma", " no-cache" );
    }
}