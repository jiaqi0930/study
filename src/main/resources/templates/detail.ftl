<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
</head>

<body>
<#include "inc/header2.ftl">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>目录</legend>
</fieldset>
<#list list as c>


<div class="layui-collapse" lay-filter="test">
  <div class="layui-colla-item">
      <h2 class="layui-colla-title">章节${c.id}${c.chapname}</h2>
        <#list c.hour as h>
      <div class="layui-colla-content">
          <a href="${h.courseurl}"><br>${h.catalogue}</a>
      </div>
        </#list>
  </div>


</#list>
</body>
<script src="/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['element', 'layer'], function(){
        var element = layui.element;
        var layer = layui.layer;

        //监听折叠
        element.on('collapse(test)', function(data){
            layer.msg('展开状态：'+ data.show);
        });
    });
</script>


</html>