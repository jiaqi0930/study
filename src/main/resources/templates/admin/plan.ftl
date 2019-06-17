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
    <script src="/layui/layui.js" charset="utf-8"></script>
<#--    <script src="https://www.x4399.com/book/10984/4847906.html" charset="utf-8"></script>-->
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
<#include "/inc/header2.ftl">

<div class="layui-row">
    <div class="layui-col-md2">
        <div class="grid-demo grid-demo-bg1">
            <div class="layui-col-md2">
                    <div class="grid-demo grid-demo-bg1" ><img src="${course.avatar!}" style="width: 320px;height: 240px"    alt=""></div>
            </div>
        </div>
    </div>
    <div class="layui-col-md7" style="margin-left: 20px">
        <div class="grid-demo">


            <div class="layui-col-md7">
                <div class="grid-demo">

<#--                        视频名称:  <h1>${course.name!}</h1><br>-->
<#--                        视频教师:<h2>${course.teacher!}</h2><br>-->
<#--                        <a>开始时间:${course.begintime!}</a><br><br>-->
<#--                        <a>结束时间:${course.finishtime!}</a><br><br>-->
<#--                        <a>价格${course.price!}</a><br><br><br>-->

                    <#--                             Chapter/courseid/${c.id!}-->
<#--                        <a id="parent" href="javascript:" class="deta">-->
<#--&lt;#&ndash;                            <button class="layui-btn layui-btn-warm">参加学习</button>&ndash;&gt;-->
<#--                            <a   href="/avatar/${course.id}"   class="layui-btn layui-btn-warm"  >更改图片</a>-->
<#--                            <a href="/admin/chapter/${course.id}"   class="layui-btn layui-btn-warm"  >添加章节</a>-->
<#--                        </a>-->



                    <table class="layui-table">

                        <thead>
                        <tr>
                            <th>视频名称</th>
                            <th>视频教师</th>
                            <th>开始时间</th>
                            <th>结束时间</th>
                            <th>价格</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><h1>${course.name!}</h1></td>
                            <td><h2>${course.teacher!}</td>
                            <td>${course.begintime!}</td>
                            <td>${course.finishtime!}</td>
                            <td>${course.price!}</td>
                        </tr>


                        </tbody>

                    </table>
                    <a   href="/course/avatar/${course.id}/course/uplode"   class="layui-btn layui-btn-warm"  >更改图片</a>
                    <a href="/admin/course/${course.id}/chapter/create"   class="layui-btn layui-btn-warm"  >添加章节</a>


                </div>

            </div>



        </div>

    </div>

</div><br><br>


        <#--      //目录板块-->




<table class="layui-table" >

    <thead>
    <tr>
        <th>章节</th>
        <th style="width: 20px">组件</th>
        <th style="width: 80px">状态</th>

    </tr>
    </thead>
    <tbody>
    <#list mulu as c>
    <tr>
        <td><h2>章节:${c.chapname}</h2></td>
        <td>   <a href="/hour/${c.id}/save"   class="layui-btn layui-btn-normal"  ><i class="layui-icon"></i>添加课时</a>
           </td>
      <td ></td>


    </tr>
        <#list c.hour as h>
    <tr>
        <td> ${h.name}
            <#if h.video ?? && h.video !="" >
            <#else >
                <span class="layui-badge">无视频</span>
            </#if>
        </td>

        <td style="width: 150px">
            <a href="/admin/hour/${h.id}/update"   class="layui-btn layui-btn-danger"  ><i class="layui-icon"></i>修改</a> </td>




        <td style="width: 100px" >
           <#if h.video ?? && h.video !="" >
               <span class="layui-badge layui-bg-blue">就绪</span>
             <#else >
                 <span class="layui-badge">未上传</span>
           </#if>

        </td>


    </tr>
        </#list>
    </#list>
    </tbody>
</table>


<script>
    layui.use('element', function(){
        var $ = layui.jquery
            ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabAdd: function(){
                //新增一个Tab项
                element.tabAdd('demo', {
                    title: '新选项'+ (Math.random()*1000|0) //用于演示
                    ,content: '内容'+ (Math.random()*1000|0)
                    ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                })
            }

            ,tabChange: function(){
                //切换到指定Tab项
                element.tabChange('demo', '22'); //切换到：用户管理
            }
        };





    });
</script>

</body>
</html>