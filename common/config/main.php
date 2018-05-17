<?php
return [
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'urlManager' => [
            //'enableStrictParsing'         => true,
            'enablePrettyUrl'   => true,  //启用路由
            'showScriptName'    => false,  //false为隐藏 index.php
            //'suffix' => '.html',
            //规则
            'rules' => [
                '<controller:\w+\-*\w*>/<id:\d+>'=>'<controller>/view',
                '<controller:\w+\-*\w*>/<action:\w+\-*\w*>/<id:(\w*\_*\w*)*>'=>'<controller>/<action>',
                '<controller:\w+\-*\w*>/<action:\w+\-*\w*>/correspondence_id/<correspondence_id:\d+>'=>'<controller>/<action>',
                '<controller:\w+\-*\w*>/<action:\w+\-*\w*>/<correspondence_id:\d+>'=>'<controller>/<action>',
                '<controller:\w+\-*\w*>/<action:\w+\-*\w*>'=>'<controller>/<action>',
                '<controller:\w+\-*\w*>/<action:\w+\-*\w*>/term_id/<term_id:\d+>/classid/<classid:\d+>/num_id/<num_id:\d+>/week_day/<week_day:\d+>/room_id/<room_id:\d+>/str_task_id/<str_task_id:(\d+,*d*)*>'=>'<controller>/<action>',
                '<controller:\w+\-*\w*>/<action:\w+\-*\w*>/term_id/<term_id:\d+>/classid/<classid:\d+>/num_id/<num_id:\d+>/week_day/<week_day:\d+>/pid/<pid:\d+>/str_task_id/<str_task_id:(\d+,*d*)*>'=>'<controller>/<action>',
                '<controller:\w+\-*\w*>/<action:\w+\-*\w*>/term_id/<term_id:\d+>/classid/<classid:\d+>/num_id/<num_id:\d+>/week_day/<week_day:\d+>/task_id/<task_id:\d+>/correspondence_id/<correspondence_id:\d+>'=>'<controller>/<action>',
                '<controller:\w+\-*\w*>/<action:\w+\-*\w*>/term_id/<term_id:\d+>/classid/<classid:\d+>/num_id/<num_id:\d+>/week_day/<week_day:\d+>/pid/<pid:\d+>/correspondence_id/<correspondence_id:\d+>'=>'<controller>/<action>',
            ]
        ],
        'formatter' => [
            'datetimeFormat' => 'yyyy-MM-dd HH:mm:ss',
            'decimalSeparator' => ',',
            'thousandSeparator' => ' ',
            'currencyCode' => 'EUR',
        ],
    ],
];
