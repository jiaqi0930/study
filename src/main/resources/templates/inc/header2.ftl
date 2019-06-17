<link rel="stylesheet" href="/layui/css/layui.css"  media="all">
<header class="class">
    <ul class="layui-nav">
        <li class="layui-nav-item">
            <a href="/index">首页 </a>
        </li>
        <li class="layui-nav-item">
            <a href="/account/profile">修改信息</a>
        </li>

        <li class="layui-nav-item" <#-- id="bt2"-->  >
                                       <a href="/category/list"> 课程分类 </a>
        </li>
        <li class="layui-nav-item" <#-- id="bt2"-->  >
            <a href="/admin/course/create">添加课程 </a>
        </li>


          <#if Session.loginInfo?exists >
        <li class="layui-nav-item" lay-unselect="" style="margin-left:1150px">
            <a href="javascript:;"><img src="${Session.loginInfo.avatar!}" class="layui-nav-img" >个人选择</a>
            <dl class="layui-nav-child">
                <dd><a href="/mypage">个人中心</a></dd>
                <dd><a href="/public/logout">退出</a></dd>
            </dl>
        </li>
              <#else >
              <li class="layui-nav-item" lay-unselect="" style="margin-left:1150px">
                  <a href="javascript:;"><img src="123.jpg" class="layui-nav-img" >个人选择</a>
                  <dl class="layui-nav-child">
                      <dd><a href="/mypage">个人中心</a></dd>
                      <dd><a href="/public/logout">退出</a></dd>
                  </dl>
              </li>

          </#if>

    </ul>

</header>

<script src="http://xiaowiba.com/live2d_models/L2Dwidget.min.js"></script>
<script type="text/javascript">
    L2Dwidget.init();


</script>
<style>

    canvas#live2dcanvas {
        border: 0 !important;
        top: 5px;
        width: 100px;
    }
</style>