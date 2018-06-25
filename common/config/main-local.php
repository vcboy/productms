<?php
return [
    'components' => [
        'db' => [
			'class' => 'yii\db\Connection',

            //'dsn' => 'mysql:host=rm-uf61r5cq4wimj91c1.mysql.rds.aliyuncs.com;dbname=wechatbaoming',
            /*'dsn' => 'mysql:host=rm-uf61r5cq4wimj91c1no.mysql.rds.aliyuncs.com;dbname=wechatbaoming',
            'username' => 'root',
            'password' => 'Wechatbaoming1013',*/
            //'dsn' => 'mysql:host=localhost;dbname=site_center',
            'dsn' => 'mysql:host=localhost;dbname=productms',
            'username' => 'root',
            'password' => 'root',
            /*'dsn' => 'mysql:host=bdm29971423.my3w.com;dbname=bdm29971423_db',
            'username' => 'bdm29971423',
            'password' => 'cc111111',*/
            'charset' => 'utf8',
            'tablePrefix' => 'wx_',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'viewPath' => '@common/mail',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => true,
        ],
        'authManager' => [
            'class' => 'yii\rbac\DbManager',
        ],
    ],
];
