
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>修改用户信息</title>

    <meta property="mtons:mblog" content="2.2.1">

    <script src="/assets/vendors/pace/pace.min.js"></script>

    <link rel="stylesheet" href="/assets/vendors/bootstrap/css/bootstrap.min.css">
    <link href="/assets/vendors/pace/themes/pace-theme-minimal.css" rel="stylesheet" />

    <link rel='stylesheet' media='all' href='/assets/vendors/font-awesome/css/font-awesome.min.css'/>
    <link rel="stylesheet" media='all' href="/assets/vendors/animate/animate.min.css">
    <link rel='stylesheet' media='all' href='/assets/css/style.css'/>
    <link rel='stylesheet' media='all' href='/assets/css/layout.css'/>
    <link rel='stylesheet' media='all' href='/assets/css/plugins.css'/>
    <link rel='stylesheet' media='all' href='/assets/css/addons.css'/>
    <link rel='stylesheet' media='all' href="/assets/vendors/baguette/baguetteBox.min.css"/>
    <script type="text/javascript" src="/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="/assets/js/utils.js"></script>
    <script type="text/javascript" src="/assets/vendors/layer/layer.js"></script>
    <script type="text/javascript" src="/assets/js/sea.js"></script>
    <script type="text/javascript" src="/assets/js/sea.config.js"></script>

    <script src="\layui\layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script type="text/javascript" src="/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/assets/vendors/validate/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/assets/vendors/validate/messages_zh.min.js"></script>


    <link rel="apple-touch-icon-precomposed" href="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558364947254&di=e2122b7c00349495823434927f65e08e&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201212%2F22%2F20121222235632_rMacs.jpeg"/>
    <link rel="shortcut icon" href="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558364947254&di=e2122b7c00349495823434927f65e08e&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201212%2F22%2F20121222235632_rMacs.jpeg"/>


    <script type="text/javascript">
        var _base_path = '$!{base}';

        window.app = {
            base: '',
            LOGIN_TOKEN: '$!{profile.id}'
        };

        window.UEDITOR_HOME_URL = '/assets/vendors/ueditor/';
    </script>
</head>
<body>

<#include "/inc/header2.ftl">

<!--.site-main -->
<div class="wrap" id="wrap">
    <div class="container">
        <div class="row">
            <div class="main clearfix">
                <div class="col-xs-12 col-md-12">
                    <style>
                        .popover-content{width:200px}
                    </style>

                    <div class="panel panel-default stacked">
                        <div class="panel-heading">
                            <ul class="nav nav-pills account-tab">
                                <li><a href="profile">基本信息</a></li>
                                <li><a href="avatar">修改头像</a></li>
                                <li class="active"><a href="password">修改密码</a></li>
                            </ul>
                        </div>
                        <div class="panel-body">
                            <div id="message">

                            </div>
                            <div class="tab-pane active" id="passwd">
                                <form id="pw01" action=""  method="post"  class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-lg-3" for="password">当前密码</label>
                                        <div class="col-lg-4">
                                            <input type="password" class="form-control" name="oldPassword" maxlength="18" placeholder="请输入当前密码" data-required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-lg-3" for="password">新密码</label>
                                        <div class="col-lg-4">
                                            <input type="password" class="form-control" id="password" name="password" placeholder="请输入新密码" maxlength="18" data-required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-lg-3" for="password2">确认密码</label>
                                        <div class="col-lg-4">
                                            <input type="password" class="form-control" name="password2" data-required placeholder="请再输入一遍新密码" maxlength="18" data-conditional="confirm" data-describedby="message" data-description="passwd">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="text-center">
                                            <button type="submit" class="btn btn-primary">提交</button>
                                        </div>
                                    </div><!-- /form-actions -->
                                </form>
                            </div>
                        </div><!-- /panel-content -->
                    </div><!-- /panel -->

                    <script type="text/javascript">
                        $(function () {
                            $("form").validate({
                                debug:true, //只验证，不提交
                                rules : {
                                    oldPassword : {
                                        required : true,
                                    },
                                    password : {
                                        required : true,
                                        minlength : 5
                                    },
                                    password2 : {
                                        required : true,
                                        minlength : 5,
                                        equalTo : "#password"
                                    }
                                },
                                messages : {
                                    oldPassword : {
                                        required : "请输入当前密码"
                                    },
                                    password : {
                                        required : "请输入新的密码",
                                        minlength : "密码长度不能小于 5"
                                    },
                                    password2 : {
                                        required : "请确认新的密码",
                                        minlength : "密码长度不能小于 5",
                                        equalTo : "两次密码输入不一致"
                                    }
                                },
                                errorPlacement: function(error, element) {
                                    element.popover('destroy');
                                    element.popover({
                                        content:error[0].innerHTML
                                    });
                                    element.click();
                                    element.closest('div').removeClass('has-success').addClass('has-error');
                                },
                                success:function(a, b) {
                                    $(b).parent().removeClass('has-error').addClass('has-success');
                                    //$(b).popover('destroy');
                                },
                                submitHandler:function(form){ //验证通过执行这里
                                    var layer1= layer.msg('正在处理修改密码...', {
                                        icon: 16
                                        ,shade: 0.5,
                                        time:0
                                    });
                                    $.ajax({
                                        type:"POST",
                                        url:"/account/password/change",
                                        data:$(pw01).serialize(),
                                        success:function(data){
                                            layer.close(layer1);
                                            if(data.code==300) {
                                                layer.msg("旧密码不正确，修改失败！！！",function(){});
                                            }
                                            if(data.code==200) {
                                                layer.msg('密码修改成功！请刷新页面重新登录',{icon:6});

                                            }
                                        },
                                        error:function(XMLHttpRequest,testStatus,errorThrown){
                                            layer.close(layer1);
                                            layer.msg('服务器通讯错误',{icon:5});
                                        }
                                    });

                                }
                            });
                        });
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>

<a href="#" class="site-scroll-top"></a>

<script type="text/javascript">
    seajs.use('main', function (main) {
        main.init();
    });
</script></body>
</html>
