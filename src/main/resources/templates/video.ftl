<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>



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
            <input  type="file"   name="url"  id="url"  autocomplete="off" placeholder="请输入minzi " >
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



<script src="/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
        //监听提交
        form.on('submit(demo1)', function(data){
            var formObj=document.getElementById("mydemo");
            formObj.action="/video/save";
            formObj.method="post";
            formObj.submit();
            return false;
        });



    });
</script>

</body>

</html>