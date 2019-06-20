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

 <div class="layui-row">
         <div class="layui-col-md5" >
             <div class="grid-demo grid-demo-bg1">
                 <div class="layui-col-md5">

                     <div class="grid-demo grid-demo-bg1" ><img src="${course.avatar!}" style="width: 600px;height: 300px"    alt=""></div>

                 </div>
             </div>
         </div>
         <div class="layui-col-md6" style="margin-left: 20px">
             <div class="grid-demo">


                 <div class="layui-col-md6">
                     <div class="grid-demo">

                         视频名称:  <h1>${course.name!}</h1><br>
                         视频教师:<h2>${course.teacher!}</h2><br>
                         <a>开始时间:${course.begintime!}</a><br><br>
                         <a>结束时间:${course.finishtime!}</a><br><br>
                         <a>价格:${course.price!}</a><br><br><br>

<#--                             Chapter/courseid/${c.id!}-->


                         <#if Session.loginInfo?exists >
                            <#if choice?exists>
                                <button  disabled="disabled"class="layui-btn layui-btn-warm">已参加</button>
                             <#else >
                                 <a href="/user/choice/${course.id}"> <button class="layui-btn layui-btn-warm">参加学习</button></a>
                            </#if>
                         <a href="/admin/course/plan/${course.id}"   class="layui-btn layui-btn-warm"  >安排</a>
                             <#else >
                                 <button  id="b1" class="layui-btn layui-btn-warm">参加学习</button>
                  </#if >

                     </div>
                 </div>
             </div>
         </div>
 </div><br><br>
<div class="layui-tab layui-tab-brief" style="margin-left: 30px;" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title">
        <li class="layui-this" >目录</li>
        <li>简介</li>
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
            <p><h3>简介</h3></p><br>
            <p>${course.intro!}</p>
       </li><br><br>
                <li>
                    <p><h3>适用人群</h3></p><br>
                    <p>${course.apply!}</p>
                </li>


        </div>
    </div>
</div>







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
     $("#b1").click(function () {
         var msg = "请登录";
         if (confirm(msg)==true){
              window.location.href="/public/logout";
     return true ;
         }else{
 return false;
         }
     })

</script>

</body>
</html>