<!DOCTYPE html>
<html  >

<head>
 <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="/login/img/apple-icon.png">
    <link rel="icon" type="image/png" href="/login/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Login Page - Now UI Kit by Creative Tim</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="/login/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/login/css/now-ui-kit.css" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="/login/css/demo.css" rel="stylesheet" />
    <!-- Canonical SEO -->
    <link rel="canonical" href="" />
    <!--  Social tags      -->
    <meta name="keywords" content="">
    <meta name="description" content="">
    
<!--   Core JS Files   -->
<script src="/login/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="/login/js/core/popper.min.js" type="text/javascript"></script>
<script src="/login/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="/login/js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="/login/js/plugins/nouislider.min.js" type="text/javascript"></script>
<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
<script src="/login/js/plugins/bootstrap-datepicker.js" type="text/javascript"></script>
<!-- Share Library etc -->
<script src="/login/js/plugins/jquery.sharrre.js" type="text/javascript"></script>
<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
<script src="/login/js/now-ui-kit.js" type="text/javascript"></script>

<script type="text/javascript" src="/assets/vendors/validate/jquery.validate.min.js"></script>
 <script type="text/javascript" src="/assets/vendors/validate/messages_zh.min.js"></script>
<script type="text/javascript" src="/assets/js/layer/layer.js"></script>
    <#--------------------------------------->
    <link rel="apple-touch-icon-precomposed" href="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558364947254&di=e2122b7c00349495823434927f65e08e&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201212%2F22%2F20121222235632_rMacs.jpeg"/>
    <link rel="shortcut icon" href="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558364947254&di=e2122b7c00349495823434927f65e08e&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201212%2F22%2F20121222235632_rMacs.jpeg"/>

</head>
<body class="login-page sidebar-collapse">
<#include "inc/header2.ftl">
    <div class="page-header" filter-color="orange">
        <div class="page-header-image" style="background-image:url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558173322752&di=9d7241685932dea8fdf16aac2908482a&imgtype=0&src=http%3A%2F%2Fpcs4.clubstatic.lenovo.com.cn%2Fdata%2Fattachment%2Fforum%2F201607%2F06%2F173621w3z3nbmwdqs1z20d.jpg)"></div>
        <div class="container">
            <div class="col-md-4 content-center">
                <div class="card card-login card-plain">
                    <form class="form" method="" action="login">
                        <div class="content">
                                    <div class="input-group form-group-no-border input-lg">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons ui-2_like"></i>
                                </span>
                                <input  name="nickname"type="text" class="form-control" placeholder="昵称" data-required>
                            </div>
                               
                               
                        
                          <div class="input-group form-group-no-border input-lg">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons  ui-2_favourite-28"></i>
                                </span>
                                <input  name="phone"type="text" placeholder="手机号"   maxlength="11"class="form-control" data-required>
                            </div>
                            
                            <div class="input-group form-group-no-border input-lg">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons ui-2_chat-round"></i>
                                </span>
                                <input name="email"type="text" placeholder="邮箱" class="form-control" data-required>
                            </div>
                            
                        
                            <div class="input-group form-group-no-border input-lg">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons users_circle-08"></i>
                                </span>
                                <input name="username"type="text" class="form-control" placeholder="用户名" data-required>
                            </div>
                            
                            
                             <div class="input-group form-group-no-border input-lg">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons text_caps-small"></i>
                                </span>
                                <input  name="password"type="password" placeholder="密码" class="form-control" data-required>
                            </div>
                            
                            
                          
                           
                        </div>
                        <div class="footer text-center">
                             <input type="submit" class="btn btn-primary btn.btn-app btn-wd btn-block" VALUE="注册">
                        <#--
                        <div class="pull-left">
                            <h6>
                                <a href="/login" class="text_caps-small">登陆</a>
                            </h6>
                        </div>
                        <div class="pull-right">
                            <h6>
                                <a href="#pablo" class="link">帮助？</a>
                            </h6>
                        </div>-->
                        </div>
                    </form>
                </div>
            </div>
        </div>
       
    </div>
    
    
 	<script type="text/javascript">
		$(function() {
			$("form").validate({
				debug:true, //只验证，不提交
				rules : {
					nickname : {
						required : true
					},
					phone : {
					    required : true,
						minlength : 11
					},
					email : {
						required : true,
						email : true
					},
					username : {
						required : true,
						minlength : 3
					},
					
					password : {
						required : true,
						minlength : 5
					}
					
				},
				messages : {
					nickname : {
						required : "请输入昵称"
					},
					 email : {
						required : "请输入一个正确的邮箱"
					},
					username : {
						required : "请输入用户名",
						minlength : "用户名长度不能小于3"
					},
					 
					password : {
						required : "请输入登录密码",
						minlength : "密码长度不能小于 5"
					}
					}, errorPlacement: function(error, element) {
				element.popover('dispose'); 
				element.popover({
					content:error[0].innerHTML
				});
				element.click();
				element.closest('div').removeClass('has-success').addClass('has-error');
			},
			success:function(a, b) {
				$(b).parent().removeClass('has-error').addClass('has-success');
				$(b).popover('dispose');
			},
			submitHandler:function(form){ 
				var layer1= layer.msg('正在处理登陆信息...', {
					  icon: 16
					  ,shade: 0.5,
					  time:0
					});
				$.ajax({
					type:"POST",
					url:"/public/register",
					data:$(form).serialize(),
					success:function(data){
					layer.close(layer1);
					 if(data.code==100) {
						layer.msg(data.msg,function(){});
					}
					 if(data.code==101) {
						layer.msg(data.msg,function(){});
					}
					if(data.code==200) {
						layer.msg('注册成功',{icon:6});
						setTimeout(function(){
							window.location.href='/login';
						},2000);
					} 
					},
					error:function(XMLHttpRequest,testStatus,errorThrown){
						layer.close(layer1);
						layer.msg('服务器通讯错误',{icon:4});
				}
				});
	            
	        }
		});
	 
    })
	</script>
</body>

</html>