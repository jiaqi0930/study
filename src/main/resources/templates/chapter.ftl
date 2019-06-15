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
<form id="demo" class="layui-form" action="/admin/course/${course.id}/chapter/create" method="post">
    <input type="hidden" name="course_id" value="${course.id}">
    <H2>${course.name}</H2><BR><BR>
    <div class="layui-form-item">
        <label class="layui-form-label">章节名称</label>
        <div class="layui-input-inline">
            <input type="text" name="name" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div><br><br><br><br>
                        <button   class="layui-btn"  type="submit">提交</button>
</form>
<script>


</script>

</body>
</html>