<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<style>
    .rank ul{
        list-style: none;
        border: none;
        margin: 0;
        padding: 0;
        font-family: "Microsoft Yahei";
    }
    .rank ul li{
        float: left;
        position: relative;
        width: 230px;
        height: 295px;
        margin-right: 10px;
        margin-bottom: 10px;
        background: #fff;
        overflow: hidden;
    }
    .rank a{
        color: #666;
        text-decoration: none;
    }
    .rank li img{
        display: block;
        width: 180px;
        height: 180px;
        margin: 20px 25px 10px;
        transition: transform .5s;
    }
    .rank li p{
        width: 140px;
        height: 40px;
        font-size: 14px;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        overflow: hidden;
        margin-left: 45px;
        margin-bottom: 10px;
        letter-spacing: 1.17px;
    }
    .rank li:hover{
        background-color: #1beb11;
    }
</style>
<body>
<div class="rank">
    <ul>
        <#list list as li>
        <li>
            <a href="/course/${li.id}"  ><img src="${li.avatar!}" alt="">
                <p  >${li.name!}</p>
                <p  >￥&nbsp;<em>${li.intro!}</em></p></a>
                <a href="javascript:;" class="cartbtn"></a>
        </li>
        </#list>


    </ul>
</div>
</body>
</html>