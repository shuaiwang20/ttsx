<%--
  Created by IntelliJ IDEA.
  User: shuaiwang20
  Date: 2019/10/21
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>天天生鲜-登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customer/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customer/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/customer/js/jquery-1.12.4.min.js"></script>
</head>
<body>
<div class="login_top clearfix">
    <a href="${pageContext.request.contextPath}/user/login" class="login_logo">
        <img src="${pageContext.request.contextPath}/customer/images/logo02.png">
    </a>
</div>

<div class="login_form_bg">
    <div class="login_form_wrap clearfix">
        <div class="login_banner fl"></div>
        <div class="slogan fl">日夜兼程 · 急速送达</div>
        <div class="login_form fr">
            <div class="login_title clearfix">
                <h1>用户登录</h1>
                <a href="${pageContext.request.contextPath}/WEB-INF/register.jsp">立即注册</a>
            </div>
            <div class="form_input">
                <form action="index.html" id="form">

                    <input type="text" id="username" name="username" class="name_input" value="<shiro:principal/>"  placeholder="请输入用户名">
                    <div class="user_error" id="user_error"></div>
                    <input type="password" id="password" name="password" class="pass_input" placeholder="请输入密码">
                    <div class="pwd_error">输入错误</div>
                    <div style="position: absolute;left: 0;top: 120px;">
                        <img src="${pageContext.request.contextPath}/captcha" id="img" style="width: 120px ;height: 30px;vertical-align: middle" >
                        <input type="text" id="vcode" style="background: #fdfdfd;height: 25px;width: 80px;vertical-align: middle;">
                        <img id="tip" width="40" style="vertical-align: middle">
                    </div>
                    <div class="more_input clearfix">
                        <input type="checkbox" id="auto" name="auto" value="1">
                        <label>记住用户名</label>
                        <a href="#">忘记密码</a>
                    </div>
                    <input type="button" id="button" value="登录" class="input_submit">
                </form>
            </div>
        </div>
    </div>
</div>



<script type="text/javascript">


    /*验证码检测*/
    var c=0;
    $("#vcode").blur(function(){
            $("#tip").change("src","${pageContext.request.contextPath}/customer/images/run.gif")
            $.ajax({
                url:"${pageContext.request.contextPath}/user/checkVcode",
                type:"POST",
                data:"vcode="+document.getElementById("vcode").value,
                contentType:"application/x-www-form-urlencoded",
                success:function(date){
                    if (date==1){
                        //验证通过
                       $("#tip").attr("src","${pageContext.request.contextPath}/customer/images/ok.jpg")
                        c=1;
                        //让button可以点击
                        $("#button").removeAttr("disabled");
                    }else{
                        //验证不通过
                        $("#tip").attr("src","${pageContext.request.contextPath}/customer/images/error.jpg")
                        //让button不可点击
                        $("#button").attr("disabled", "disabled")
                        c=0;
                    }

                }
            });
        })


    /*怎么从jsp页面给handle传参*/
    $("#button").click(function () {
        // var username=$("#username").value;
        // var password=$("#password").value;
        var username=document.getElementById("username").value;
        var password=document.getElementById("password").value;

        if (username!=''&& username!=null&&username!=null&&username!=''&&c==1){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/login",
                type:"POST",
                // data:"username="+$("#username").value()+"&password="+$("#password").value()+"&auto="+$("#auto").value(),
                data:$("#form").serialize(),
                dataType:"json",
                contentType:"application/x-www-form-urlencoded",
                success:function(data){
                    if (data.code==1){
                        //验证通过
                        alert("登录成功")
                        location="${pageContext.request.contextPath}/user/index";
                    }else{
                        //验证不通过
                        $("#user_error").text("用户名或密码错误")
                        $("#user_error").show();
                    }
                }
            });
        } else{
            // alert("用户名或密码不能为空")
            var val = $("#username").val();
            // alert(val);
            $("#user_error").text("用户名或密码不能为空")
            $("#user_error").show();

        }

    })


    $(function(){
        $("#img").click(function(){
            //刷新验证码
            path = $(this).attr("src")+"?"+new Date().getTime();
            $(this).attr("src",path);
        });
    });



</script>
<div class="footer no-mp">
    <div class="foot_link">
        <a href="#">关于我们</a>
        <span>|</span>
        <a href="#">联系我们</a>
        <span>|</span>
        <a href="#">招聘人才</a>
        <span>|</span>
        <a href="#">友情链接</a>
    </div>
    <p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>
    <p>电话：010-****888    京ICP备*******8号</p>
</div>

</body>
</html>
