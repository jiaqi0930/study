<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>修改用户信息</title>
    <meta name="keywords" content="mtons, mtons,博客,社区,摄影,旅游,艺术,娱乐">
    <meta name="description" content="Mtons, 轻松分享你的兴趣. 便捷的文字、图片发布,扁平化的响应式设计,美观、大气,是您记录生活的最佳选择">

    <meta property="mtons:mblog" content="2.2.1">

    <script src="/assets/vendors/pace/pace.min.js"></script>
    <link rel="stylesheet" href="/assets/vendors/bootstrap/css/bootstrap.min.css">
    <link href="/assets/vendors/pace/themes/pace-theme-minimal.css" rel="stylesheet"/>

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

    <!-- Favicons -->
    <link rel="apple-touch-icon-precomposed"
          href="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558364947254&di=e2122b7c00349495823434927f65e08e&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201212%2F22%2F20121222235632_rMacs.jpeg"/>
    <link rel="shortcut icon"
          href="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558364947254&di=e2122b7c00349495823434927f65e08e&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201212%2F22%2F20121222235632_rMacs.jpeg"/>

    <script type="text/javascript" src="/assets/js/cropper/main.js"></script>
    <link rel="stylesheet" href="/assets/js/cropper/main.css">
    <script type="text/javascript" src="/assets/js/cropper/cropper.js"></script>
    <script type="text/javascript" src="/assets/js/cropper/canvas-to-blob.js"></script>
    <link rel="stylesheet" href="/assets/js/cropper/cropper.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

</head>
<body>


<#include "/inc/header2.ftl">

<!--.site-main -->
<div class="wrap" id="wrap">
    <div class="container">
        <div class="row">
            <div class="main clearfix">
                <div class="col-xs-12 col-md-12">

                    <div class="panel panel-default stacked">
                        <div class="panel-heading">
                            <ul class="nav nav-pills account-tab">
                                <li><a href="profile">基本信息</a></li>
                                <li class="active"><a href="avatar">修改头像</a></li>
                                <li><a href="password">修改密码</a></li>
                            </ul>
                        </div>
                        <div class="panel-body">
                            <div id="message">

                            </div>

                            <!-- Content -->
                                <div class="row"  style=" width: 1300px ; height: 500px">
                                    <div class="col-md-9">
                                        <!-- <h3>Demo:</h3> -->
                                        <div class="img-container">
                                            <img id="image"
                                                 src="${Session.loginInfo.avatar}"
                                                 alt="Picture">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <!-- <h3>Preview:</h3> -->
                                        <div class="docs-preview clearfix">
                                            <div class="img-preview preview-lg"></div>
                                            <div class="img-preview preview-md"></div>
                                            <div class="img-preview preview-sm"></div>
                                        </div>
                                        <!-- <h3>Data:</h3> --><!-- <h3>Data:</h3> -->
                                        <div class="docs-data"  >
                                            <div class="input-group input-group-sm">
            <span class="input-group-prepend">
              <label class="input-group-text" for="dataX">X</label>
            </span>
                                                <input type="text" class="form-control" id="dataX" placeholder="x">
                                                <span class="input-group-append">
              <span class="input-group-text">px</span>
            </span>
                                            </div>
                                            <div class="input-group input-group-sm">
            <span class="input-group-prepend">
              <label class="input-group-text" for="dataY">Y</label>
            </span>
                                                <input type="text" class="form-control" id="dataY" placeholder="y">
                                                <span class="input-group-append">
              <span class="input-group-text">px</span>
            </span>
                                            </div>
                                            <div class="input-group input-group-sm">
            <span class="input-group-prepend">
              <label class="input-group-text" for="dataWidth">Width</label>
            </span>
                                                <input type="text" class="form-control" id="dataWidth"
                                                       placeholder="width">
                                                <span class="input-group-append">
              <span class="input-group-text">px</span>
            </span>
                                            </div>
                                            <div class="input-group input-group-sm">
            <span class="input-group-prepend">
              <label class="input-group-text" for="dataHeight">Height</label>
            </span>
                                                <input type="text" class="form-control" id="dataHeight"
                                                       placeholder="height">
                                                <span class="input-group-append">
              <span class="input-group-text">px</span>
            </span>
                                            </div>
                                            <div class="input-group input-group-sm">
                                            <span class="input-group-prepend">
                                              <label class="input-group-text" for="dataRotate">Rotate</label>
            </span>
                                                <input type="text" class="form-control" id="dataRotate"
                                                       placeholder="rotate">
                                                <span class="input-group-append">
              <span class="input-group-text">deg</span>
            </span>
                                            </div>
                                            <div class="input-group input-group-sm">
            <span class="input-group-prepend">
              <label class="input-group-text" for="dataScaleX">ScaleX</label>
            </span>
                                                <input type="text" class="form-control" id="dataScaleX"
                                                       placeholder="scaleX">
                                            </div>
                                            <div class="input-group input-group-sm">
            <span class="input-group-prepend">
              <label class="input-group-text" for="dataScaleY">ScaleY</label>
            </span>
                                                <input type="text" class="form-control" id="dataScaleY"
                                                       placeholder="scaleY">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>

                <label class="btn btn-primary btn-upload" for="inputImage" title="Upload image file">
                    <input type="file" class="sr-only" id="inputImage" name="file"
                           accept=".jpg,.jpeg,.png,.gif,.bmp,.tiff">
                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false"
                          title="Import image with Blob URLs">
              <span class="fa fa-upload"> </span>选择图片
            </span>
                </label>

            <button  id="bt02"type="button" class="layui-btn layui-btn-danger layui-btn-radius">上传头像</button>

                <!-- Footer -->
            </div><!-- /panel-content -->
        </div><!-- /panel -->


    </div>
</div>
</div>
</div>

<script>


    var $image=$("#image");
    var options = {
        aspectRatio: 1/1,
        modal: false,
        preview: '.img-preview',
        done: function(data) {
            console.log(data);
        }
    };
    $image.cropper(options);

    var uploadedImageURL;
    var $inputImage = $('#inputImage');
    $inputImage.change(function () {
        var files = this.files;
        var file;

        if (!$image.data('cropper')) {
            return;
        }

        if (files && files.length) {
            file = files[0];

            if (/^image\/\w+$/.test(file.type)) {
                uploadedImageName = file.name;
                uploadedImageType = file.type;

                if (uploadedImageURL) {
                    URL.revokeObjectURL(uploadedImageURL);
                }

                uploadedImageURL = URL.createObjectURL(file);
                $image.cropper('destroy').attr('src', uploadedImageURL).cropper(options);
                $inputImage.val('');
            } else {
                window.alert('Please choose an image file.');
            }
        }
    });

    $('#bt02').click(function(){
        var canvas=$image.cropper("getCroppedCanvas", { maxWidth: 1680, maxHeight: 700 });
        var base64Data=canvas.toDataURL('image/jpeg'); //将裁减好的canvas画布转为base64
        var blob = dataURLtoBlob(base64Data);
        var fd = new FormData();
        fd.append("image", blob);

        $.ajax({
            type: "post",
            url:"/account/user/avatar/update",
            data: fd,
            processData: false,
            contentType: false, //multipart-formdata
            success: function (ret) {
                if(ret.code==0){
                    layer.msg('头像已经修改成功，请刷新页面');

                } if(data.code==1) {
                    layer.msg(data.msg,function(){});

                }

            },
            error: function(e) {
                alert(e.responseText); //alert错误信息
            }
        });

    });

    layui.use(['element','form'], function(){

    });
</script>
</body>
</html>
