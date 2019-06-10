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
            <a href="/admin/course">添加课程 </a>
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
 
