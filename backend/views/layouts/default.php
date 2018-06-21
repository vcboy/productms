<?php
use backend\assets\AppAsset;

use backend\components\TopWidget;
use backend\components\LeftWidget;
use yii\helpers\Url;
use backend\models\Menu;

/* @var $this \yii\web\View */
/* @var $content string */
AppAsset::register($this);
if(!isset($this -> context -> subject)){
    $this -> context -> subject = '欢迎页面';
}
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8" />
    <title><?=Yii::$app->params['appname']?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- 基本样式 -->
    <link href="<?=Yii::$app -> request -> baseUrl;?>/resource/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="<?=Yii::$app -> request -> baseUrl;?>/resource/css/font-awesome.min.css" />
    <!--[if !IE]> -->
    <script type="text/javascript">
        window.jQuery || document.write("<script src='<?=Yii::$app -> request -> baseUrl;?>/resource/js/jquery-2.0.3.min.js'>"+"</"+"script>");
    </script>
    <!-- <![endif]-->
    <!-- 只有IE7可见-->
    <!--[if IE 7]>
    <link rel="stylesheet" href="<?=Yii::$app -> request -> baseUrl;?>/resource/css/font-awesome-ie7.min.css" />
    <![endif]-->

    <!-- page specific plugin styles 页面插件基本样式-->
    <!-- 字体 -->

    <!-- ace styles -->
    <link rel="stylesheet" href="<?=Yii::$app -> request -> baseUrl;?>/resource/css/ace.min.css" />
    <link rel="stylesheet" href="<?=Yii::$app -> request -> baseUrl;?>/resource/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="<?=Yii::$app -> request -> baseUrl;?>/resource/css/ace-skins.min.css" />

    <!-- IE8以下版本可见-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="<?=Yii::$app -> request -> baseUrl;?>/resource/css/ace-ie.min.css" />
    <![endif]-->
    <!-- inline styles related to this page -->
    <!-- ace settings handler -->
    <script src="<?=Yii::$app -> request -> baseUrl;?>/resource/js/ace-extra.min.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="<?=Yii::$app -> request -> baseUrl;?>/resource/js/html5shiv.js"></script>
    <script src="<?=Yii::$app -> request -> baseUrl;?>/resource/js/respond.min.js"></script>
    <![endif]-->
    <link href="<?=Yii::$app -> request -> baseUrl;?>/resource/css/pagination.css" rel="stylesheet" type="text/css" />

    <script src="<?=Yii::$app -> request -> baseUrl;?>/resource/js/bootstrap.min.js"></script>
    <script src="<?=Yii::$app -> request -> baseUrl;?>/resource/js/typeahead-bs2.min.js"></script>

    <!-- page specific plugin scripts -->



    <!-- ace scripts -->
    <script src="<?=Yii::$app -> request -> baseUrl;?>/resource/js/ace-elements.min.js"></script>
    <script src="<?=Yii::$app -> request -> baseUrl;?>/resource/js/ace.min.js"></script>

  
    
    <script src="<?=Yii::$app -> request -> baseUrl;?>/resource/js/date-time/bootstrap-datepicker.min.js"></script>
    <script src="<?=Yii::$app -> request -> baseUrl;?>/resource/js/date-time/bootstrap-timepicker.min.js"></script>
    <script src="<?=Yii::$app -> request -> baseUrl;?>/resource/js/date-time/moment.min.js"></script>
    <script src="<?=Yii::$app -> request -> baseUrl;?>/resource/js/date-time/daterangepicker.min.js"></script>
    <script src="<?=Yii::$app -> request -> baseUrl;?>/resource/js/bootstrap-colorpicker.min.js"></script>
    


    <link rel="stylesheet" href="<?=Yii::$app -> request -> baseUrl;?>/resource/css/jquery-ui-1.10.3.custom.min.css" />
    <link rel="stylesheet" href="<?=Yii::$app -> request -> baseUrl;?>/resource/css/chosen.css" />
    <link rel="stylesheet" href="<?=Yii::$app -> request -> baseUrl;?>/resource/css/datepicker.css" />
    <link rel="stylesheet" href="<?=Yii::$app -> request -> baseUrl;?>/resource/css/bootstrap-timepicker.css" />
    <link rel="stylesheet" href="<?=Yii::$app -> request -> baseUrl;?>/resource/css/daterangepicker.css" />
    <link rel="stylesheet" href="<?=Yii::$app -> request -> baseUrl;?>/resource/css/colorpicker.css" />
    <!--项目公共js-->
	<script src="<?=Yii::$app -> request -> baseUrl;?>/js/common.js"></script>
    <!--<script src="<?=Yii::$app -> request -> baseUrl;?>/js/exam.js"></script>-->
	<!--弹出框-->
	<script src="<?=Yii::$app -> request -> baseUrl;?>/js/sweetalert-master/lib/sweet-alert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<?=Yii::$app -> request -> baseUrl;?>/js/sweetalert-master/lib/sweet-alert.css">
	<!-- 弹出框 sweetalert End-->

    <!-- <script src="<?=Yii::$app -> request -> baseUrl;?>/resource/js/bootstrap.min.js"></script>
    <script src="<?=Yii::$app -> request -> baseUrl;?>/resource/js/typeahead-bs2.min.js"></script> -->
    <!--日历-->
    <link href="<?=Yii::$app -> request -> baseUrl;?>/resource/DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<?=Yii::$app -> request -> baseUrl;?>/resource/DatePicker/WdatePicker.js"></script>
    <!--弹出框 BlockUI-->
    <link rel="stylesheet" href="<?=Yii::$app -> request -> baseUrl;?>/resource/css/jquery-ui-theme.css" />
    <link rel="stylesheet" href="<?=Yii::$app -> request -> baseUrl;?>/resource/css/block.css" />
    <script src="<?=Yii::$app -> request -> baseUrl;?>/resource/js/jquery.blockUI.js"></script>
    <!--弹出框 BlockUI-->
    <link rel="stylesheet" href="<?=Yii::$app -> request -> baseUrl;?>/resource/css/common.css" />
    <!--yii自带js 支持data-confrim -->
    <script src="<?=Yii::$app -> request -> baseUrl;?>/js/yii.js"></script>
    <!--Jquery cookie 插件 Start-->
    <script src="<?=Yii::$app -> request -> baseUrl;?>/resource/js/jquery.cookie.js"></script>
    <!--Jquery cookie 插件 End-->

    <!-- 框架自定义css-->
    <link rel="stylesheet" href="<?=Yii::$app -> request -> baseUrl;?>/css/default.css" />
     <?php //$this->head() ?>
<?php //头部数据块
if (isset($this->blocks['head'])) {
    echo $this->blocks['head'];
}?>

    <script language="javascript">
        //新弹出框
        function sweetalertChange(alertMsg,timer){
            if(timer == null){
               timer = 2000;
            }
        }
        //新弹出框，有确定按钮
        function sweetalertButton(alertMsg){
            swal(alertMsg);
        }
        //新确认框
        function sweetConfirmChange(msg, url){
            swal({
                    title: msg,
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确定",
                    cancelButtonText: "取消",
                    closeOnConfirm: false,
                },
                function(){
                    if(url.length) {
                        window.location.href = url;
                    }
                });
        }
        //重新加载本页面
        function page_reload(){
            location.reload();
        }
        //去一个新的页面
        function go_to(new_url){
            location.href = new_url;
        }
    </script>
<style>
.required label::after{content:'*';color:red}
</style>
</head>
<body>
<?php $this->beginBody() ?>
<?php //顶部组件 ?>
<?= TopWidget::widget();?>

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>
    <div class="main-container-inner">
        <?php //左侧组件 ?>
        <?=LeftWidget::widget();?>
			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="icon-home home-icon"></i>
								<a href="<?=Url::to(['default/index'])?>">首页</a>
							</li>
                            <?php
                            
                            if($this -> context -> childSubject){
                                if ($this->context->subject) {
                                    echo '<li class="active">' . $this->context->childSubject . '</li>';
                                }
                            }else {
                                if ($this->context->subject) {
                                    echo '<li class="active">' . $this->context->subject . '</li>';
                                }
                            }
                            
                            ?>
						</ul><!-- .breadcrumb -->

						<div class="nav-search" id="nav-search">
						<a href="#" class="btn btn-minier btn-primary" onclick="history.back();">
							<i class="icon-arrow-left"></i>
							返回
						</a>
							
						</div><!-- #nav-search -->
					</div>
				<div class="page-content">
				<!--内容页面-->
				<?= $content ?>
				</div>
		    </div>
    </div>
</div>

    <!-- inline scripts related to this page -->
    <script type="text/javascript">
        jQuery(function($) {
           
        var placeholder = $('#piechart-placeholder').css({'width':'90%' , 'min-height':'150px'});
        var data = [
            { label: "social networks",  data: 38.7, color: "#68BC31"},
            { label: "search engines",  data: 24.5, color: "#2091CF"},
            { label: "ad campaigns",  data: 8.2, color: "#AF4E96"},
            { label: "direct traffic",  data: 18.6, color: "#DA5430"},
            { label: "other",  data: 10, color: "#FEE074"}
        ]
       
        var $tooltip = $("<div class='tooltip top in'><div class='tooltip-inner'></div></div>").hide().appendTo('body');
        var previousPoint = null;
        placeholder.on('plothover', function (event, pos, item) {
            if(item) {
                if (previousPoint != item.seriesIndex) {
                    previousPoint = item.seriesIndex;
                    var tip = item.series['label'] + " : " + item.series['percent']+'%';
                    $tooltip.show().children(0).text(tip);
                }
                $tooltip.css({top:pos.pageY + 10, left:pos.pageX + 10});
            } else {
                $tooltip.hide();
                previousPoint = null;
            }

        });

        var d1 = [];
        for (var i = 0; i < Math.PI * 2; i += 0.5) {
            d1.push([i, Math.sin(i)]);
        }

        var d2 = [];
        for (var i = 0; i < Math.PI * 2; i += 0.5) {
            d2.push([i, Math.cos(i)]);
        }

        var d3 = [];
        for (var i = 0; i < Math.PI * 2; i += 0.2) {
            d3.push([i, Math.tan(i)]);
        }


        var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'220px'});
      
        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('.tab-content')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
            return 'left';
        }

        
        var agent = navigator.userAgent.toLowerCase();
        if("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
            $('#tasks').on('touchstart', function(e){
                var li = $(e.target).closest('#tasks li');
                if(li.length == 0)return;
                var label = li.find('label.inline').get(0);
                if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
            });
        
        $('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
            $(this).prev().focus();
        });


    })
        $(document).ready(function(){

            $('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
                $(this).prev().focus();
            });

            
        })

        var tolink = function(){
            var push_url = $("#push_url").val();
            if(push_url){
                window.open(push_url);
            }
        }

        

    </script>
<?php //底部数据块
if (isset($this->blocks['foot'])) {
    echo $this->blocks['foot'];
}?>
<?php $this->endBody() ?>
</body>
<?php $this->endPage() ?>
