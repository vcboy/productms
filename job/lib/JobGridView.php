<?php
/*
 * 吉博教育自己的类库
 * 自己的GridView类，继承自GridView
 */
namespace job\lib;

use Yii;
use yii\grid\GridView;

class JobGridView extends GridView{
    public $tableOptions = ['class' => 'table table-striped table-bordered table-hover'];
    public $emptyText = '您还没有数据！';
    public $options = ['class' => 'table-responsive'];
    public function init()
    {
        parent::init();
        $this->formatter->nullDisplay="";
    }
}