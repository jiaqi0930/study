<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="/assets/css/iconfont.css"  media="all">
 	<script src="/assets/js/jquery.min.js" charset="utf-8"></script>
    <meta charset="UTF-8">
     <link rel="stylesheet" href="/layui/css/layui.css"  media="all">

    <title>Title</title>
      <link rel="stylesheet" href="/assets/css/iconfont.css"  media="all">
    <script src="/layui/layui.js" charset="utf-8"></script>




    <link rel="stylesheet" type="text/css" href="/p/css/bootstrap.css">
    <script type="text/javascript" src="/p/js/jquery.min.js"></script>
    <script type="text/javascript" src="/p/js/jquery.comment.js" ></script>
    <script type="text/javascript" src="/p/js/bootstrap.min.js"></script>
</head>
<style>
    .container{
        width: 1000px;
    }
    .commentbox{
        width: 900px;
        margin: 20px auto;
    }
    .mytextarea {
        width: 100%;
        overflow: auto;
        word-break: break-all;
        height: 100px;
        color: #000;
        font-size: 1em;
        resize: none;
    }
    .comment-list{
        width: 900px;
        margin: 20px auto;
        clear: both;
        padding-top: 20px;
    }
    .comment-list .comment-info{
        position: relative;
        margin-bottom: 20px;
        margin-bottom: 20px;
        border-bottom: 1px solid #ccc;
    }
    .comment-list .comment-info header{
        width: 10%;
        position: absolute;
    }
    .comment-list .comment-info header img{
        width: 100%;
        border-radius: 50%;
        padding: 5px;
    }
    .comment-list .comment-info .comment-right{
        padding:5px 0px 5px 11%;
    }
    .comment-list .comment-info .comment-right h3{
        margin: 5px 0px;
    }
    .comment-list .comment-info .comment-right .comment-content-header{
        height: 25px;
    }
    .comment-list .comment-info .comment-right .comment-content-header span,.comment-list .comment-info .comment-right .comment-content-footer span{
        padding-right: 2em;
        color: #aaa;
    }
    .comment-list .comment-info .comment-right .comment-content-header span,.comment-list .comment-info .comment-right .comment-content-footer span.reply-btn,.send,.reply-list-btn{
        cursor: pointer;
    }
    .comment-list .comment-info .comment-right .reply-list {
        border-left: 3px solid #ccc;
        padding-left: 7px;
    }
    .comment-list .comment-info .comment-right .reply-list .reply{
        border-bottom: 1px dashed #ccc;
    }
    .comment-list .comment-info .comment-right .reply-list .reply div span{
        padding-left: 10px;
    }
    .comment-list .comment-info .comment-right .reply-list .reply p span{
        padding-right: 2em;
        color: #aaa;
    }
</style>
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

<div class="layui-row">
    <div class="layui-col-md5">
        <div class="grid-demo grid-demo-bg1">
            <div class="layui-col-md5">

                <div class="grid-demo grid-demo-bg1"><img src="${course.avatar!}" style="width: 600px;height: 300px"
                                                          alt=""></div>

            </div>
        </div>
    </div>
    <div class="layui-col-md6" style="margin-left: 20px">
        <div class="grid-demo">


            <div class="layui-col-md6">
                <div class="grid-demo">

                    视频名称: <h1>${course.name!}</h1><br>
                    视频教师:<h2>${course.teacher!}</h2><br>
                    <a>开始时间:${course.begintime!}</a><br><br>
                    <a>结束时间:${course.finishtime!}</a><br><br>
                    <#--判断折扣时间是否臣在-->
                    <#if course.createdistime?exists>
                    <#-- 判断 当前时间是否在  及折扣时间内-->
                        <#if (.now < course.outdistime  && .now > course.createdistime) >
                            <del style="color: #6b8595;">原价: ￥ ${course.price!}</del> 现价只要:￥${course.discount!}<br><br><br>
                        <#else >
                            <a>价格:${course.price!}</a><br><br><br>
                        </#if>
                        <#else >

                        <a>价格:${course.price!}</a><br><br><br>
                    </#if>
                    <#--  用户是否存在 -->
                    <#if Session.loginInfo?exists >

                        <#if choice?exists>
                            <button disabled="disabled" class="layui-btn layui-btn-primary">已参加</button>
                        <#else >
                            <#--判断 余额小于 原价-->
                                <#if ( user.balance < course.price  )  >
                                    <#--判断折扣时间是否臣在-->
                                    <#if course.createdistime?exists>
                                        <#-- 判断 当前时间是否在  及折扣时间内-->
                                     <#if (.now < course.outdistime  && .now > course.createdistime)  >
                                         <#-- 判断余额 小于折扣价-->
                                               <#if  (user.balance < course.discount)>
                                         <button class="layui-btn  layui-btn-normal" disabled="disabled">余额不足</button>
                                               <#else >
                                               <a href="/user/choice/${course.id}">
                                               <button class="layui-btn layui-btn-warm">参加学习</button></a>
                                               </#if>

                                     <#else >
                                    <button class="layui-btn  layui-btn-normal" disabled="disabled">余额不足</button>
                                     </#if>
                                 <#else >
                                     <button class="layui-btn  layui-btn-normal" disabled="disabled">余额不足</button>
                               </#if>
                                <#else>
                                    <a href="/user/choice/${course.id}">
                                    <button class="layui-btn layui-btn-warm">参加学习</button></a>
                                </#if>

                        </#if>
                    <#if user.rights == true>
                        <a href="/admin/course/plan/${course.id}"   class="layui-btn layui-btn-warm"  >课程编辑</a>
                        </#if>
                    <#if user.rights == true>
                    <a href="/admin/course/${course.id}/update" class="layui-btn layui-btn-warm">更改信息</a>
                    <a href="/admin/course/${course.id}/price" class="layui-btn layui-btn-warm">价钱设置</a>
                    </#if>
                    <#else >
                        <button id="b1" class="layui-btn  layui-btn-warm">参加学习</button>
                    </#if >
                </div>
            </div>
        </div>
    </div>
</div>
<br><br>
<div class="layui-tab layui-tab-brief" style="margin-left: 30px;" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title">
        <li class="layui-this">目录</li>
        <li>简介</li>
        <li>评论</li>
    </ul>
    <div class="layui-tab-content" style="height: 100px;">
        <#--      //目录板块-->
        <div class="layui-tab-item layui-show ">
            <#list mulu as c>
                <li>
                <h2  >章节:${c.chapname}</h2>
            <#list c.hour as h>
                <a href="/video/${h.id}"><br>
            <td> ${h.name}
                <#if h.video ?? && h.video !="" >
                <#else >
                    <span class="layui-badge">空课时</span>
                </#if>
            </td>


            </a><br>
            </#list><br><br>

                </li>

            </#list>
        </div>

        <#-- //简介板块-->
        <div class="layui-tab-item">

            <li>
                <p>
                <h3>介绍</h3></p><br>
                <p>${course.intro!}</p>
            </li>
            <br><br>
            <li>
                <p>
                <h3>适用人群</h3></p><br>
                <p>${course.apply!}</p>
            </li>
            </li>
        </div>
            <div class="layui-tab-item">





            </div>
        </div>

    </div>





















    <script>


        layui.use('element', function () {
            var $ = layui.jquery
                , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

            //触发事件
            var active = {
                tabAdd: function () {
                    //新增一个Tab项
                    element.tabAdd('demo', {
                        title: '新选项' + (Math.random() * 1000 | 0) //用于演示
                        , content: '内容' + (Math.random() * 1000 | 0)
                        , id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                    })
                }

                , tabChange: function () {
                    //切换到指定Tab项
                    element.tabChange('demo', '22'); //切换到：用户管理
                }
            };


        });
        $("#b1").click(function () {
            var msg = "请登录";
            if (confirm(msg) == true) {
                window.location.href = "/public/logout";
                return true;
            } else {
                return false;
            }
        });



    </script>




</body>
</html>