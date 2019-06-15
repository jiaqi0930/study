<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script type="text/javascript" src="/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="/assets/js/cropper/main.js"></script>
    <link rel="stylesheet" href="/assets/js/cropper/main.css">
    <script type="text/javascript" src="/assets/js/cropper/cropper.js"></script>
    <script type="text/javascript" src="/assets/js/cropper/canvas-to-blob.js"></script>
    <link rel="stylesheet" href="/assets/js/cropper/cropper.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>课程封面</legend>
    </fieldset>

    <!-- Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <!-- <h3>Demo:</h3> -->
                <div class="img-container">
                    <img id="image" src="${list.avatar!}" alt="Picture">
                </div>
            </div>
            <div class="col-md-3">
                <!-- <h3>Preview:</h3> -->
                <div class="docs-preview clearfix">
                    <div class="img-preview preview-lg"></div>
                    <div class="img-preview preview-md"></div>
                    <div class="img-preview preview-sm"></div>
                </div>
                <div class="docs-data">
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
                        <input type="text" class="form-control" id="dataWidth" placeholder="width">
                        <span class="input-group-append">
              <span class="input-group-text">px</span>
            </span>
                    </div>
                    <div class="input-group input-group-sm">
            <span class="input-group-prepend">
              <label class="input-group-text" for="dataHeight">Height</label>
            </span>
                        <input type="text" class="form-control" id="dataHeight" placeholder="height">
                        <span class="input-group-append">
              <span class="input-group-text">px</span>
            </span>
                    </div>
                    <div class="input-group input-group-sm">
            <span class="input-group-prepend">
              <label class="input-group-text" for="dataRotate">Rotate</label>
            </span>
                        <input type="text" class="form-control" id="dataRotate" placeholder="rotate">
                        <span class="input-group-append">
              <span class="input-group-text">deg</span>
            </span>
                    </div>
                    <div class="input-group input-group-sm">
            <span class="input-group-prepend">
              <label class="input-group-text" for="dataScaleX">ScaleX</label>
            </span>
                        <input type="text" class="form-control" id="dataScaleX" placeholder="scaleX">
                    </div>
                    <div class="input-group input-group-sm">
            <span class="input-group-prepend">
              <label class="input-group-text" for="dataScaleY">ScaleY</label>
            </span>
                        <input type="text" class="form-control" id="dataScaleY" placeholder="scaleY">
                    </div>
                </div>
            </div>
        </div>

    </div>

    <label class="btn btn-primary btn-upload" for="inputImage" title="Upload image file">
        <input type="file" class="sr-only" id="inputImage" name="file" accept=".jpg,.jpeg,.png,.gif,.bmp,.tiff">
        <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="Import image with Blob URLs">
    <span class="fa fa-upload"></span> 选择新图片
  </span>
    </label>
    <button id="bt02" class="layui-btn layui-btn-danger">确认上传</button>


    <script src="/layui/layui.js" charset="utf-8"></script>

    <script>
        var $image=$("#image");
        var options = {
            aspectRatio: 2/1,
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
                url:"/course/avatar/${list.id}/course/uplode",
                 data: fd,
                processData: false,
                contentType: false, //multipart-formdata
                success: function (ret) {
                    if(ret.code==0){
                        layer.msg('图片已经修改成功，');
                        setTimeout(function(){
                            window.location.href = '/category/list';
                        },2000);
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