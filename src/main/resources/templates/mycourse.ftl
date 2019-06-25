<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">

    <script src="/assets/js/jquery.min.js" charset="utf-8"></script>
    <link rel="stylesheet" href="/assets/css/iconfont.css"  media="all">
    <script src="/layui/layui.js" charset="utf-8"></script>

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
      /*  width: 230px;
        height: 295px;*/
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
        background-color: #a6e1ec;
    }
</style>
<body>
<#include "inc/header2.ftl">
<div class="rank">
    <ul>
        <#list choice as li>
        <li>
            <a href="/course/${li.course.id}"  ><img src="${li.course.avatar!}" alt="" style="width: 240px ; height: 140px ;margin-right: 40px;">
                <p  >${li.course.name!}</p>
                <p  >￥&nbsp;<em>${li.course.intro!}</em></p></a>
                <a href="javascript:;" class="cartbtn"></a>
        </li>
        </#list>


    </ul>
</div>
</body>
</html>