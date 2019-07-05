<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>layui</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="/layui/css/layui.css"  media="all">
	<script src="/assets/js/jquery.min.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<blockquote class="layui-elem-quote layui-text">
	鉴于小伙伴的普遍反馈，先温馨提醒两个常见“问题”：1. <a href="/doc/base/faq.html#form" target="_blank">为什么select/checkbox/radio没显示？</a> 2. <a href="/doc/modules/form.html#render" target="_blank">动态添加的表单元素如何更新？</a>
</blockquote>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	<legend>表单集合演示</legend>
</fieldset>

<form class="layui-form" action="/admin/coupon/save" method="post">


	<div class="layui-form-item">
		<label class="layui-form-label">优惠名字</label>
		<div class="layui-input-inline">
			<input type="text" name="name" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
		</div>
	</div>






	<div class="layui-form-item">
		<label class="layui-form-label">数量</label>
		<div class="layui-input-inline">
			<input type="number" name="amount" lay-verify="required" placeholder="请输入数量	" autocomplete="off" class="layui-input">
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">优惠金额</label>
		<div class="layui-input-inline">
			<input type="number" name="price" lay-verify="required" placeholder="请输入额度" autocomplete="off" class="layui-input">
		</div>
	</div>


	<div class="layui-form-item">
		<div class="layui-inline">
			<label class="layui-form-label">起止时间</label>
			<div class="layui-input-inline" style="width: 150px;">
				<input type="text" name="gettime" id="date1" autocomplete="off" class="layui-input" placeholder="  开始时间">
			</div>
			<div class="layui-form-mid">-</div>
			<div class="layui-input-inline" style="width: 150px;">
				<input type="text" name="outtime" id="date2"  placeholder=" 结束时间" autocomplete="off" class="layui-input" >
			</div>
		</div>
	</div>

	<div class="layui-form-item">
		<div class="layui-inline">
			<label class="layui-form-label">有效时间</label>
			<div class="layui-input-inline" style="width: 150px;">
				<input type="text" name="validTime" id="date3"  placeholder="开始时间" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid">-</div>
			<div class="layui-input-inline" style="width: 150px;">
				<input type="text" name="offtime" id="date4"    placeholder="结束时间" autocomplete="off" class="layui-input" >
			</div>
		</div>
	</div>



	<div class="layui-inline">
		<label class="layui-form-label">适用课程</label>
		<div class="layui-input-inline">
			<select   lay-filter="aihao"  >
				<option value="one">指定课程</option>
				<option  name="courseALL" value="all">全部课程</option>
			</select>
		</div>
	</div>


	<div class="layui-inline" id="mySelect" >
		<label class="layui-form-label">选择课程</label>
		<div class="layui-input-inline">
			<select  name="course"  lay-filter="aihao"  >
				<option value="">无</option>
				<#list course as c >
				<option value="${c.id!}">${c.name!}</option>
				</#list>
			</select>
		</div>
	</div>
	<br>
	<button type="submit" class="layui-btn" lay-submit >提交</button>
</form>


<script src="/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>

    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date1'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#date2'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#date3'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#date4'
            ,type: 'datetime'
        });
        form.on('select(aihao)', function(data){
            console.log(data.value); //得到被选中的值
       if (data.value == 'all'){
           alert(data.value);
           jQuery("#mySelect").hide();
		   return;
	   }else {
            jQuery("#mySelect").show();
                return;
            }

        });

    });




</script>

</body>
</html>