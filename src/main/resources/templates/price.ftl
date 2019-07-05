<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
</head>
<body>

<form class="layui-form"  id="demo" action="/admin/course/${course.id}/q" method="post">

    <div class="layui-form-item">
        <label class="layui-form-label">价钱</label>
        <div class="layui-input-inline">
            <input type="number" name="price" lay-verify="required" min="0" placeholder="请输入" autocomplete="off" class="layui-input" value="${course.price}">
        </div>
    </div>

    <h3>折扣设置</h3>
    <br><br>
    <div class="layui-form-item">
        <label class="layui-form-label">折扣后</label>
        <div class="layui-input-inline">
            <input type="number" name="discount" lay-verify="required" min="0" placeholder="${course.discount!"请输入"}" autocomplete="off" class="layui-input"  >
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">起止时间</label>
            <div class="layui-input-inline" style="width: 150px;">
                <input type="text" name="createdistime" id="date1" lay-verify="date" placeholder="${course.createdistime!"开始时间"}" autocomplete="off" class="layui-input" >
            </div>
            <div class="layui-form-mid">-</div>
            <div class="layui-input-inline" style="width: 150px;">
                <input type="text" name="outdistime" id="date2" lay-verify="date" placeholder="${course.outdistime!"结束时间"}" autocomplete="off" class="layui-input" >
            </div>
        </div>
    </div>




    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" type="submit" >立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script src=" /layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date2'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#date1'
            ,type: 'datetime'
        });




        //监听提交
        form.on('submit(demo1)', function(data){

        });




    });
</script>


</body>
</html>