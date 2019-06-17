<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
    <script src="/layui/layui.js" charset="utf-8"></script>
</head>
<body>

<form action="/admin/hour/${hour.id}/update"   method="post"  enctype="multipart/form-data">
<input name="chapter_id" value="${hour.chapter.id}" type="hidden">
<input name="course_id" value="${hour.chapter.course.id}" type="hidden">
    <table class="layui-table"  >
        <tbody>
            <tr>
                <td style="width: 80px ;font-size: 18px">课程 </td>
                <td>  ${hour.chapter.course.name?default("")}</td>
            </tr>
            <tr>
                <td style="width: 80px ;font-size: 18px">章节 </td>
                <td>  ${hour.chapter.chapname!}</td>
            </tr>
        <tr>
            <td style="width: 80px ;font-size: 18px">课时名称 </td>
            <td>    <input type="text"  name="name " value="${hour.name!}"> </td>
        </tr>
            <tr>
                <td style="width: 80px ;font-size: 18px">原视频 </td>
                <td>
                <#if hour.video ?? && hour.video !="">
                    ${hour.video}
                  <#else >
                    未上传
                </#if>
                </td>
            </tr>
        <tr>
            <td style="width: 80px ;font-size: 18px">选择视频 </td>
            <td><input type="file"  name="video " > </td>
        </tr>
            <br>
        <tr>
            <td>     <Button type="submit"  class="layui-btn">提交</Button><br> </td>
            <td >    <a href="/admin/hoyr/${hour.id}/del"  class="layui-btn  layui-btn-danger">  删除 </a> </td>
        </tr>
        </tbody>
    </table>

</form>


</body>
</html>