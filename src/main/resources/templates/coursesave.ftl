<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="/assets/css/iconfont.css"  media="all">
 	<script src="/assets/js/jquery.min.js" charset="utf-8"></script>
    <script src="/layui/layui.js" charset="utf-8"></script>
    <meta charset="UTF-8">
     <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
    <title>Title</title>
      <link rel="stylesheet" href="/assets/css/iconfont.css"  media="all">
      <script src="/assets/js/jquery.min.js" charset="utf-8"></script>
</head>
<style>

</style>
<body>
<#include "inc/header2.ftl">
<br>
<form id="demo" class="layui-form" action="" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">课程名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
    </div>
    </div>

    <div class="layui-inline">
        <label class="layui-form-label">创建时间</label>
        <div class="layui-input-inline">
            <input type="text" name="createtime" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-inline">
    <label class="layui-form-label">开课时间</label>
    <div class="layui-input-inline">
        <input type="text" name="begintime" id="date1" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
    </div>
</div>
    <div class="layui-inline">
        <label class="layui-form-label">结束时间</label>
        <div class="layui-input-inline">
            <input type="text" name="finishtime" id="date2" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">教师名称</label>
            <div class="layui-input-inline">
                <input type="tel" name="teacher" lay-verify="title" autocomplete="off" class="layui-input">
            </div>
        </div><br>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">价钱</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" name="price" placeholder="￥" autocomplete="off" class="layui-input">
            </div>

        </div>
    </div>
      <div class="layui-form-item">
          <label class="layui-form-label">单行选择框</label>
          <div class="layui-input-block">
              <select name="category" lay-filter="aihao">
                  <#list list as l>
                  <option value="${l.id}">${l.name}</option>
                  </#list>
              </select>
          </div>
      </div>


        <button id="aa" class="layui-btn" lay-submit  lay-filter="add">提交</button>
</form>
<script>
    layui.use(['form', 'layedit', 'laydate','layer'], function(){
        var form = layui.form
        var laydate = layui.laydate;
        var layer = layui.layer;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });
        laydate.render({
            elem: '#date2'
        });

        //监听提交
        form.on('submit(add)', function(data){
            var formObj=document.getElementById("demo");
            formObj.action="/admin/course/save";
            formObj.method="post";
            formObj.submit();
            return false;
        });

        /*$.ajax({
           type:"POST",
            url:"/admin/course/save",
            data:$("#demo").serialize(),
            success:function (data) {
                if(data.code=100){
                    layer.alert('发布课程成功',{icon:6});
                }else{
                    layer.alert('发布课程失败',{icon:5});
                }
            }
        });*/
    });

</script>

</body>
</html>