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
<#include "inc/header2.ftl">
<#list list as c>
<a id="parent" href="/course/list?id=${c.id}" >${c.name}</a>
</#list>
</body>
</html>