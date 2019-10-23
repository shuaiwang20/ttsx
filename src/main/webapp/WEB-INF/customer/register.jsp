<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: shuaiwang20
  Date: 2019/10/21
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>天天生鲜-注册</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customer/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/customer/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/customer/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/customer/js/register.js"></script>
</head>
<body>
<div class="register_con">
    <div class="l_con fl">
        <a class="reg_logo"><img src="../../customer/images/logo02.png"></a>
        <div class="reg_slogan">足不出户  ·  新鲜每一天</div>
        <div class="reg_banner"></div>
    </div>

    <div class="r_con fr">
        <div class="reg_title clearfix">
            <h1>用户注册</h1>
            <a href="${pageContext.request.contextPath}/WEB-INF/login.jsp">登录</a>
        </div>
        <div class="reg_form clearfix">
            <form>
                <ul>
                    <li>
                        <label>用户名:</label>
                        <input type="text" name="user_name" id="user_name">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>密码:</label>
                        <input type="password" name="pwd" id="pwd">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>确认密码:</label>
                        <input type="password" name="cpwd" id="cpwd">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>邮箱:</label>
                        <input type="text" name="email" id="email">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li class="agreement">
                        <input type="checkbox" name="allow" id="allow" checked="checked">
                        <label>同意”天天生鲜用户使用协议“</label>
                        <span class="error_tip2">提示信息</span>
                    </li>
                    <li class="reg_sub">
                        <input type="button" id="submit" value="注 册">
                    </li>
                </ul>
            </form>
        </div>

    </div>

</div>

<script type="text/javascript">
    var u=0;
    var e=0;
    $(function(){
        $("#user_name").change(function(){
            //使用ajax 做username 的异步验证 checkUsername?username=xxxx
            $.post("${pageContext.request.contextPath}/user/checkUsername","username="+this.value,function(data){
                if(data=="1"){
                    u=1;
                    $('#user_name').next().html('用户名可用').css("color","green")
                    $('#user_name').next().show();
                    error_name = true;
                }else{
                    $('#user_name').next().html('用户名已存在').css("color","red")
                    $('#user_name').next().show();
                    error_name = true;
                }
                /*可以在这里补充用户名长度*/
            })
        });
    })


    $("#email").blur(function(){
                var re = /^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$/;

                if(re.test($('#email').val()))
                {
                    $('#email').next().hide();
                    error_email = false;
                    e=1;
                }
                else{
                    $('#email').next().html('你输入的邮箱格式不正确')
                    $('#email').next().show();
                    error_check_password = true;
                    e=0;
                }

                if (e==1){
                    //使用ajax 做username 的异步验证 checkUsername?username=xxxx
                    $.post("${pageContext.request.contextPath}/user/checkEmail","email="+this.value,function(data){
                        if(data=="1"){
                            $('#email').next().html('邮箱可用').css("color","green")
                            $('#email').next().show();
                            e=1;
                            error_name = true;
                        }else{
                            $('#email').next().html('邮箱已被注册').css("color","red")
                            $('#email').next().show();
                            error_name = true;
                        }
                        /*可以在这里补充用户名长度*/
                    })
                }
            });



    $(function(){
    $("#submit").click(function () {
        var name = document.getElementById("user_name").value;
        var password = document.getElementById("pwd").value;
        var email = document.getElementById("email").value;

        // var name=$("#user_name").value;
        // var password=$("#pwd").value;
        // var email=$("#email").value;
        var data={username:name,password:password,email:email};
        if (u==1&&e==1){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/register",
                type:"post",
                async:false,

                contentType:'application/json',
                data:JSON.stringify({
                    username:document.getElementById("user_name").value,
                    password:document.getElementById("pwd").value,
                    email:document.getElementById("email").value
                }),
                success:function (value) {
                    if (value==1){
                        confirm("注册成功!")
                        <%--location:"${pageContext.request.contextPath}/customer/login.jsp"--%>
                        window.location.href = '${pageContext.request.contextPath}/user/login';
                    }else{
                        confirm("抱歉")
                    }

                }
            });
        } else{
            alert("提供信息错误，请重试")
        }

    });
    })
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
