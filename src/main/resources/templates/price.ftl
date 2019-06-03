<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="/assets/css/iconfont.css"  media="all">
 	<script src="/assets/js/jquery.min.js" charset="utf-8"></script>
    <meta charset="UTF-8">
     <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
    <title>Title</title>
      <link rel="stylesheet" href="/assets/css/iconfont.css"  media="all">
      <script src="/assets/js/jquery.min.js" charset="utf-8"></script>
</head>
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
<body>
<#include "inc/header2.ftl">
<#list list as c>
 <div class="layui-row">
    <div class="layui-col-xs6">
        <div class="grid-demo grid-demo-bg1"><img src="${c.pictureurl!}" alt=""></div>
    </div>
    <div class="layui-col-xs6">
        <div class="grid-demo">
            <h1>${c.name}</h1>
            <h2>${c.teacher}</h2>
            <a>开始时间${c.begintime}</a>
            <a>结束时间${c.finishtime}</a>
            <a>价格${c.price}</a>
            <a id="parent" href="/Chapter/courseid/${c.id}" class="deta">
            <button class="layui-btn layui-btn-warm">查看目录</button></div>
    </div>
 </div>

			<p >${c.intro}</p>
		</a>
</#list>
</body>
</html>