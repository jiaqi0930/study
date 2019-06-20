<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>主页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    <link rel="apple-touch-icon-precomposed" href="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558364947254&di=e2122b7c00349495823434927f65e08e&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201212%2F22%2F20121222235632_rMacs.jpeg"/>
    <link rel="shortcut icon" href="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558364947254&di=e2122b7c00349495823434927f65e08e&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201212%2F22%2F20121222235632_rMacs.jpeg"/>


    <link rel="stylesheet" href="//s2.stu.126.net/pub/s/web/pt_web2_views_common_meta_9e955d817f33908bbdfc8290b84fefab.css"/>
    <link rel="stylesheet" href="//icon.nosdn.127.net/a75e718e9c6704281a16855bf43a5155.css" type="text/css" /><link rel="stylesheet" href="//s2.stu.126.net/pub/s/web/pt_web2_views_index_index_81da37b413ee1e4d4a89374bfbdadf0c.css"/>
    <link type="text/css" name="microicons" rel="stylesheet" href=" //icon.nosdn.127.net/fac3a6d55aef86bf9fb5565d0cd6e204.css"/>
    <#--<link rel="stylesheet" href="/assets/css/index.css"  media="all">-->
    <link rel="stylesheet" href="/assets/css/iconfont.css"  media="all">
    <script src="/assets/js/jquery.min.js" charset="utf-8"></script>

</head>
<body>

<#include "inc/header2.ftl">


<style>
    .category1 li{
        margin-left: 8px;
        margin-top:10px;
    }
</style>


<div class="layui-carousel " id="test10">
    <div carousel-item="">
        <div><img src="/a/images/niu.jpg"></div>
        <div><img src="/a/images/b01.jpg"></div>
        <div><img src="/a/images/b02.jpg"></div>
        <div><img src="/a/images/b03.jpg"></div>
        <div><img src="/a/images/b04.jpg"></div>
        <div><img src="/a/images/b05.jpg"></div>
        <div><img src="/a/images/b06.jpg"></div>
        <div><img src="/a/images/b07.jpg"></div>
    </div>
</div>
<style>
    .rank ul{
        list-style: none;
        border: none;
        margin: 0;
        padding: 0;
    font-family: "Microsoft Yahei";
    }
    .rank ul li{
        float: left;
        position: relative;
        width: 230px;
        height: 295px;
        margin-right: 10px;
        margin-bottom: 10px;
        background: #fff;
        overflow: hidden;
    }
    .rank a{
        color: #666;
        text-decoration: none;
    }
    .rank li img{
        display: block;
        width: 180px;
        height: 180px;
        margin: 20px 25px 10px;
        transition: transform .5s;
    }
    .rank li p{
        width: 140px;
        height: 40px;
        font-size: 14px;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        overflow: hidden;
        margin-left: 45px;
        margin-bottom: 10px;
        letter-spacing: 1.17px;
    }
    .rank li:hover{
        background-color: #1beb11;
    }
</style>
<div class="rank">
<ul>
    <li>
        <a href="javascript:;" class="deta"><img src="//edu-image.nosdn.127.net/E8E68BCC6EB720FE501E4AA636257A95.png?imageView&quality=100&thumbnail=225y125&type=webp" alt="">
            <p class="d_f_name">Android高级开发之企业级课程</p>
            <p class="price">￥&nbsp;<em>5.60</em></p></a>
        <a href="javascript:;" class="cartbtn"></a>
    </li>
    <li>
        <a href="javascript:;" class="deta"><img src="/a/images/item.jpg" alt="">
            <p class="d_f_name">【苏苏生鲜】百香果200g 新鲜水果 国产</p>
            <p class="price">￥&nbsp;<em>5.60</em></p></a>
        <a href="javascript:;" class="cartbtn"></a>
    </li>
    <li>
        <a href="javascript:;" class="deta"><img src="/a/images/item.jpg" alt="">
            <p class="d_f_name">【苏苏生鲜】百香果200g 新鲜水果 国产</p>
            <p class="price">￥&nbsp;<em>5.60</em></p></a>
        <a href="javascript:;" class="cartbtn"></a>
    </li>
    <li>
        <a href="javascript:;" class="deta"><img src="/a/images/item.jpg" alt="">
            <p class="d_f_name">【苏苏生鲜】百香果200g 新鲜水果 国产</p>
            <p class="price">￥&nbsp;<em>5.60</em></p></a>
        <a href="javascript:;" class="cartbtn"></a>
    </li>
    <li>
        <a href="javascript:;" class="deta"><img src="/a/images/item.jpg" alt="">
            <p class="d_f_name">【苏苏生鲜】百香果200g 新鲜水果 国产</p>
            <p class="price">￥&nbsp;<em>5.60</em></p></a>
        <a href="javascript:;" class="cartbtn"></a>
    </li>
    <li>
        <a href="javascript:;" class="deta"><img src="/a/images/item.jpg" alt="">
            <p class="d_f_name">【苏苏生鲜】百香果200g 新鲜水果 国产</p>
            <p class="price">￥&nbsp;<em>5.60</em></p></a>
        <a href="javascript:;" class="cartbtn"></a>
    </li>
    <li>
        <a href="javascript:;" class="deta"><img src="/a/images/item.jpg" alt="">
            <p class="d_f_name">【苏苏生鲜】百香果200g 新鲜水果 国产</p>
            <p class="price">￥&nbsp;<em>5.60</em></p></a>
        <a href="javascript:;" class="cartbtn"></a>
    </li>
    <li>
        <a href="javascript:;" class="deta"><img src="/a/images/item.jpg" alt="">
            <p class="d_f_name">【苏苏生鲜】百香果200g 新鲜水果 国产</p>
            <p class="price">￥&nbsp;<em>5.60</em></p></a>
        <a href="javascript:;" class="cartbtn"></a>
    </li>

</ul>
</div>


<style>
    .layui-carousel img {
        position:relative;
        left:150px;
        height: 100%;
        width: 80%;
    }

</style>



<script src="\layui\layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['carousel', 'element' ], function() {
        var carousel = layui.carousel
        var element = layui.element;


        //图片轮播
        carousel.render({
            elem: '#test10'

            , width: '100%'
            , height: '400px'
            , interval: 1000
        });

    })


</script>

</body>
</html>