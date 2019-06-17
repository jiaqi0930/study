<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script type="text/javascript" src="/assets/js/jquery.min.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
<#--    <link rel="stylesheet" href="https://www.x4399.com/book/10984/4847618.html"  media="all">-->
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<#--


<form    id="mydemo"  class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">名字</label>
        <div class="layui-input-block">
            <input type="text" name="name"   autocomplete="off" placeholder="请输入minzi " class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">视频</label>
        <div class="layui-input-block">
            <input  type="file"   name="videofile"  id="videofile"  autocomplete="off" placeholder="请输入minzi " >
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择课时名称</label>
        <div class="layui-input-block">
            <select name="hour" lay-filter="aihao">
                <option value="">选择课时名称</option>
                <#list list as l>
                    <option value="${l.id}">${l.catalogue}</option>
                </#list>
            </select>
        </div>
    </div>


    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
-->

<form  action="/hour/${chapter.id}/save"  method="post" enctype="multipart/form-data" >
    <input type="hidden" name="chapter_id" value="${chapter.id}">
    <input type="hidden" name="course_id" value="${chapter.course.id}">
    <table class="layui-table" >
        <tbody>
        <tr>
            <td style="width: 80px ;font-size: 18px"> 章节名字 </td>
          <td> ${chapter.chapname}</td>
        </tr>
        <tr>
            <td style="width: 80px ;font-size: 18px"> 名字 </td>
          <td> <input type="text"    name="name"></td>
        </tr>
        <tr>
            <td style="width: 80px ;font-size: 18px">选择视频</td>
            <td>  <input type="file"  name="video"/></td>
        </tr>
        <tr>
            <td>      <button   class="layui-btn"  type="submit">提交</button></td>

        </tr>
        </tbody>
    </table>
</form>
<script src="/layui/layui.js" charset="utf-8"></script>


</body>

</html>