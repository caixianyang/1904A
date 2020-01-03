<%--
  Created by IntelliJ IDEA.
  User: decade
  Date: 2019/11/12
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <jsp:include page="/WEB-INF/view/commons.jsp"></jsp:include>
</head>
<body>
<h1>修改密码</h1>
<form class="form-horizontal" style="margin-left: 550px;margin-top:100px">

    <div class="form-group">

        <label  class="col-sm-2 control-label">用户手机号</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="phone"  placeholder="用户手机号">
        </div>
        <button type="button" onclick="codeForget()"  class="btn btn-primary"><li class="glyphicon glyphicon-plus"></li>&nbsp;获取验证码</button>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">验证码</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="code"  placeholder="验证码">
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">密码</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="pwd"  placeholder="密码">
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">确认密码</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="pwd2"  placeholder="确认密码">
        </div>
    </div>

    <div class="form-group" style="margin-top: 80px">
        <div class="col-sm-offset-1 col-sm-5">
            <button type="button" onclick="allBackPassWord()"  class="btn btn-primary"><li class="glyphicon glyphicon-plus"></li>&nbsp;确定</button>
        </div>
    </div></form>
</body>
<script>

    function codeForget(){

        var phone=$("#phone").val();
        $.post(
            "<%=request.getContextPath()%>/user/codeForget.action",
            {"phone":phone},
            function(result){
                if(result.status==200){
                    var res=result.data;
                    if(res == 2){
                        bootbox.alert("发送失败")
                    }else if(res == 3){
                        bootbox.alert("手机号不能为空")
                    }

                }else{
                    bootbox.alert("发送失败")
                }
            }
        )

    }

    //修改密码
    function allBackPassWord(){

        var phone=$("#phone").val();
        var code=$("#code").val();
        var pwd=$("#pwd").val();
        var pwd2=$("#pwd2").val();
        if(pwd != null && pwd == pwd2){
            $.post(
                "<%=request.getContextPath()%>/user/allBackPassWord.action",
                {
                    "phone":phone,
                    "code":code,
                    "pwd":pwd
                },
                function(result){
                    if(result.status==200){
                        location.href="/login.jsp";
                    }else if(result.status==1001){
                        bootbox.alert("验证码输入错误")
                    }else{
                        bootbox.alert("操作失败")
                    }
                }
            )
        }else{
            bootbox.alert("两次密码输入不一致");
        }



    }

</script>

</html>
