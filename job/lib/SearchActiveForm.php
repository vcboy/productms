<?php
namespace job\lib;

use yii\widgets\ActiveForm;

/**
 * 为ActiveForm每个div增加左浮动
 * 如搜索项需换行请使用<div class="clearfix"></div>清除浮动
 * @author star
 *
 */
class SearchActiveForm extends ActiveForm {
    public $fieldConfig = [
        'options' => ['style'=>'float: left;margin-left: 5px;']
    ];
}