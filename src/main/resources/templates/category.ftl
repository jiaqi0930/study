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
<body>
<style>
 button{
     margin-top: 15px!important;
 }

</style>
<#include "inc/header2.ftl">
<#list list as c>
<a   href="/course/list/${c.id}" ><button type="button" class="layui-btn layui-btn-primary layui-btn-lg">${c.name}</button></a>
</#list>
</body>
</html>