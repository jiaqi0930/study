<link rel="stylesheet" href="/layui/css/layui.css"  media="all">
<header class="class">
    <ul class="layui-nav">
        <li class="layui-nav-item">
            <a href="/index">首页 </a>
        </li>
        <#if Session.loginInfo?exists >
            <li class="layui-nav-item">
                <a href="/account/profile">修改信息</a>
            </li>
            <li class="layui-nav-item">
                <a href="/admin/coupon/save">制作优惠券</a>
            </li>
        </#if>


        <li class="layui-nav-item" <#-- id="bt2"-->  >
                                       <a href="/category/list"> 课程分类 </a>
        </li>
        <#if Session.loginInfo?exists >
        <#if Session.loginInfo.rights == true >
        <li class="layui-nav-item" <#-- id="bt2"-->  >
            <a href="/admin/course/create">添加课程 </a>
        </li>
        </#if>

        <li class="layui-nav-item" <#-- id="bt2"-->  >
            <a href="/user/course">我的课程 </a>
        </li>

        <li class="layui-nav-item" lay-unselect="" style="position:relative; left: 1000px;">
            <a href="javascript:;"><img src="${Session.loginInfo.avatar!}" class="layui-nav-img" >个人选择</a>
            <dl class="layui-nav-child">
                <dd><a href="/mypage">个人中心</a></dd>
                <dd><a href="/public/logout">退出</a></dd>
            </dl>
        </li>
              <#else >
              <li class="layui-nav-item" lay-unselect="" style="margin-left:900px">
                  <a href=" /register" class="text_caps-small">注册？</a></li>
            <li class="layui-nav-item">
                      <a href="/login" class="text_caps-small">登录</a>
                  </li>

          </#if>

    </ul>

</header>

<script src="http://xiaowiba.com/live2d_models/L2Dwidget.min.js"></script>
<script type="text/javascript">
    L2Dwidget.init();


    layui.use(  'element' , function() {
    })
</script>
<style>

    canvas#live2dcanvas {
        border: 0 !important;
        top: 5px;
        width: 100px;
    }

</style>















<script>

    (function(window,document,undefined){
        var hearts = [];
        window.requestAnimationFrame = (function(){
            return window.requestAnimationFrame ||
                window.webkitRequestAnimationFrame ||
                window.mozRequestAnimationFrame ||
                window.oRequestAnimationFrame ||
                window.msRequestAnimationFrame ||
                function (callback){
                    setTimeout(callback,1000/60);


                }
        })();
        init();
        function init(){
            css(".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: absolute;}.heart:after{top: -5px;}.heart:before{left: -5px;}");
            attachEvent();
            gameloop();
        }
        function gameloop(){
            for(var i=0;i<hearts.length;i++){
                if(hearts[i].alpha <=0){
                    document.body.removeChild(hearts[i].el);
                    hearts.splice(i,1);
                    continue;
                }
                hearts[i].y--;
                hearts[i].scale += 0.004;
                hearts[i].alpha -= 0.013;
                hearts[i].el.style.cssText = "left:"+hearts[i].x+"px;top:"+hearts[i].y+"px;opacity:"+hearts[i].alpha+";transform:scale("+hearts[i].scale+","+hearts[i].scale+") rotate(45deg);background:"+hearts[i].color;
            }
            requestAnimationFrame(gameloop);
        }
        function attachEvent(){
            var old = typeof window.onclick==="function" && window.onclick;
            window.onclick = function(event){
                old && old();
                createHeart(event);
            }
        }
        function createHeart(event){
            var d = document.createElement("div");
            d.className = "heart";
            hearts.push({
                el : d,
                x : event.clientX - 5,
                y : event.clientY - 5,
                scale : 1,
                alpha : 1,
                color : randomColor()
            });
            document.body.appendChild(d);
        }
        function css(css){
            var style = document.createElement("style");
            style.type="text/css";
            try{
                style.appendChild(document.createTextNode(css));
            }catch(ex){
                style.styleSheet.cssText = css;
            }
            document.getElementsByTagName('head')[0].appendChild(style);
        }
        function randomColor(){
            return "rgb("+(~~(Math.random()*255))+","+(~~(Math.random()*255))+","+(~~(Math.random()*255))+")";
        }
    })(window,document);
</script>