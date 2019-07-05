<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/video.js/7.3.0/video-js.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/video.js/7.3.0/video.min.js"></script>

</head>
<body>
<#if list.video??>
<video id="example_video_1" class="video-js vjs-default-skin" autoplay="autoplay"    preload="auto"
       poster="https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2153937626,1074119156&fm=27&gp=0.jpg">
    <source src="${list.video!}" type="video/mp4">
</video>
    <#else >
    未上传视频
</#if>

<script>
    var player = videojs('example_video_1',{
        controls : true/false,
        height:600,
        width:800,
        loop : true,

    });

</script>
</body>
</html>