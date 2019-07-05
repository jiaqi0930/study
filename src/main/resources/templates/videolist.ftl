<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
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
        /*width:400px;*/
        /*height: 295px;*/
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
        background-color: #d9dfe9;
    }
</style>
<body>
<#include "inc/header2.ftl">
<div class="rank">
    <ul>
        <#list list as li>
        <li>
            <a href="/course/${li.id}"  ><img src="${li.avatar!}" alt="" style="width: 240px ; height: 140px ;margin-right: 40px;">
                <p  >${li.name!}</p>
        <#if li.createdistime?exists>
        <#if (.now < li.outdistime  && .now > li.createdistime) &&li.createdistime?exists  >
        <p class="price">&nbsp;<em>现价:￥${li.discount!}</em></p></a>
        <#else >
            <p class="price">￥&nbsp;<em>原价 :￥  ${li.price!} </em></p></a>
        </#if>
        <#else >
            <p class="price">￥&nbsp;<em>原价 :￥  ${li.price!} </em></p></a>

        </#if>
                <a href="javascript:;" class="cartbtn"></a>
        </li>
        </#list>


    </ul>
</div>
</body>
</html>