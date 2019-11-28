<%--
  Created by IntelliJ IDEA.
  User: decade
  Date: 2019/10/26
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <jsp:include page="/WEB-INF/view/commons.jsp"></jsp:include>


</head>
<body>
<%--面包屑--%>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp">1904A</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav" id="item-ul">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Java <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
            </ul>

            <%--!!!!!!!!!!!!!!!!!--%>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#" onclick="loginUser()">Login</a></li>
                <li><a href="#" onclick="registerUser()">Register</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>
            </ul>
            <%--!!!!!!!!!!!!!!!!!--%>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<center>
    <div style="margin-top: 5%">
        <h1>欢迎来到飞狐教育 <small>Flying fox doesn't make the last shift old</small></h1>
        <blockquote class="blockquote-reverse">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
            <footer>Someone famous in <cite title="Source Title">Source Title</cite></footer>
        </blockquote>
    </div>
</center>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-full" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="addFrom">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">用户名称</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="name" name="name" placeholder="用户名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">用户密码</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="pwd" name="pwd" placeholder="用户密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">确认密码</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="rped" name="rpwd" placeholder="确认密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-4">
                            <button  type="button" onclick="adduser()" class="btn btn-primary">Submit</button>
                            <button type="reset" class="btn btn-info">Reset</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button"  class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="LoginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-full" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLogin">Login</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="loginForm" enctype="multipart/form-data" method="post">
                    <div class="form-group">
                        <label for="login_name">Name</label>
                        <input type="text" class="form-control" id="login_name"  placeholder="Name">
                    </div>
                    <div class="form-group">
                        <label for="login_pwd">PassWord</label>
                        <input type="text" class="form-control" id="login_pwd"  placeholder="PassWord">
                    </div>
                    <div class="form-group">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">记住密码</label>
                            <div class="col-sm-1">
                                <input type="checkbox" class="form-control" name="rememberMe" value="1">
                            </div>
                        </div>
                            <a href="/forget.jsp">忘记密码</a>
                    </div>

                    <div class="form-group" style="margin-top: 80px">
                        <div class="col-sm-offset-1 col-sm-5">
                            <button type="button" onclick="login()"  class="btn btn-primary"><li class="glyphicon glyphicon-plus"></li>&nbsp;登陆</button>
                            <input type="reset" class="btn btn-default" >
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button"  class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                <button type="button"  class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
            </div>
        </div>
    </div>
</div>
<form class="form-horizontal" style="margin-left: 550px;margin-top:100px">

    </form>
</div>
</body>
<script>

    function login(){

        var name=$("#login_name").val();
        var pwd=$("#login_pwd").val();
        var rememberMe = 0;
        if($("[name='rememberMe']").prop("checked")){
            rememberMe = 1;//
        }
        $.post(
            "<%=request.getContextPath()%>/user/login.action",
            {"name":name,
                "pwd":pwd,
            "rememberMe":rememberMe},
            function(result){
                if(result.status==200){
                    var flag=result.data;
                    if(flag==1){
                        bootbox.alert("用户名不存在");
                    }else if(flag==2){
                        bootbox.alert("密码错误");
                    } else {
                        bootbox.alert("登陆成功!!!");
                        location.href="/index.jsp";
                    }
                }
            }
        )

    }


    function toadd(){

        location.href="/register.jsp";
    }



</script>
<script>
    $(function(){
        var hash = window.location.hash;
        if(hash.length > 0){
            $("#item-ul > li").removeClass("active");
            var id = hash.substring(1);
            $("#item"+id).addClass("active");
        }
    });




    function registerUser(){
        $("#myModalLabel").text("新增");
        $('#myModal').modal();
    }

    function loginUser(){
        $("#myModalLogin").text("新增");
        $('#LoginModal').modal();
    }

</script>
<script>

    $( function(){

        addInto();

    });
    /* 注册验证 */
    function addInto() {
        $("#addFrom").bootstrapValidator({
            // 默认的提示消息
            message: 'This value is not valid',

            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                name: {
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        remote: {//ajax验证。server result:{"valid",true or false}
                            url: "/user/checkUserByName.action",
                            message: '用户名已存在,请重新输入',
                            delay: 1000,//ajax刷新的时间是1秒一次
                            type: 'POST',
                            //自定义提交数据，默认值提交当前input value
                            data: function(validator) {
                                return {
                                    userName : $("input[name=name]").val()
                                };
                            }
                        }
                    },
                    pwd: {
                        message: '密码无效',
                        validators: {
                            notEmpty: {
                                message: '密码不能为空'
                            }
                        }
                    },
                    rpwd: {
                        message: '密码无效',
                        validators: {
                            notEmpty: {
                                message: '用户名不能为空'
                            },
                            identical: {//相同
                                field: 'pwd',
                                message: '两次密码不一致'
                            }
                        }
                    }
                }
            }
        });
    }

    /* ajax提交表单 */
    function adduser(){
        var name=$("#name").val();
        var pwd=$("#pwd").val();
        var area1 = $("#add_area1").val();
        var area2 = $("#add_area2").val();
        var area3 = $("#add_area3").val();
        var area4 = $("#add_area4").val();
        $.post(
            "<%=request.getContextPath()%>/user/addUser.action",
            {
                "name":name,
                "pwd":pwd,
                "area1":area1,
                "area2":area2,
                "area3":area3,
                "area4":area4

            },
            function(result){
                if(result.status==200){
                        bootbox.alert("注册成功");
                        location.href="login.jsp";
                }
            }
        )}
</script>
</html>
