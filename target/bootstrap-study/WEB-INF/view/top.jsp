<%--
  Created by IntelliJ IDEA.
  User: decade
  Date: 2019/10/20
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<style>
    .show-grid [class ^="col-"] {
        padding-top: 10px;
        padding-bottom: 10px;
        background-color: #;
        border: 1px solid #ddd;
        background-color: rgba(86, 61, 124, .15);
        border: 1px solid rgba(86, 61, 124, .2);
    }
</style>
<body>
<%--面包屑 导航--%>
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
            <a class="navbar-brand" href="#">1904A</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav" id="item-ul">
               <%-- <li class="active" id="item1"><a href="<%=request.getContextPath()%>/goods/bootTables.action#1">商品管理</a></li>
                <li id="item2"><a href="<%=request.getContextPath()%>/category/toList.action#2">商品类型管理</a></li>
                <li id="item7"><a href="<%=request.getContextPath()%>/area/toList.action#7">地区管理</a></li>
                <li id="item3"><a href="<%=request.getContextPath()%>/user/toList.action#3">用户管理</a></li>
                <li id="item4"><a href="<%=request.getContextPath()%>/log/toList.action#4">日志管理</a></li>
                <li id="item5"><a href="<%=request.getContextPath()%>/resource/toList.action#5">权限管理</a></li>
                <li id="item6"><a href="<%=request.getContextPath()%>/role/toList.action#6">角色管理</a></li>--%>
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
            <ul class="nav navbar-nav navbar-right">
                <li><a href="<%=request.getContextPath()%>/user/refresh.action">刷新</a></li>
                <li><a href="<%=request.getContextPath()%>/user/loginOut.action">退出登录</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<script>
var imgUrl = "http://192.168.12.61:8000/";
$.ajaxSetup({
    complete(data,TS) {
        var time = data.getAllResponseHeaders("ajaxTime");
        if(time == "tomePut"){
            window.location.href="/login.jsp"
        }
    }
    });



    $(function(){
        buildMenu();
        getResource();
        var hash = window.location.hash;
        if(hash.length > 0){
            //清除样式
            $("#item-ul > li").removeClass("active");
            //去除#
            var id = hash.substring(1);
            //添加样式
            $("#item"+id).addClass("active");

        }

    });

    var resourceList = [];
    //菜单拦截
    function buildMenu() {
        $.ajaxSettings.async = false;
    $.post(
        "<%=request.getContextPath()%>/resource/getCurrentResourceAndUser.action",
        function (data) {
            if(data.status==200){
                resourceList = data.data;
                var  str = "";
                for (var i=0; i<resourceList.length; i++){
                    var resource = resourceList[i];
                    if(resource.type==1){
                        str += ' <li id="item'+ resource.id +'"><a href="<%=request.getContextPath()%>'+ resource.url +'#'+ resource.id +'">'+ resource.name +'</a></li>';
                    }
                }
                $("#item-ul").append(str);
            }
        }
    );
        $.ajaxSettings.async = true;
    }
    //'按钮拦截
var btu_add='hidden';
var btu_update='hidden';
var btu_delete='hidden';
    function getResource() {
      //console.log("---------------"+resourceList);
        var hash = window.location.hash;
        //去除#
        var id = hash.substring(1);
        for (var i=0; i<resourceList.length; i++) {
            var resource = resourceList[i];
            if (id == resource.pid) {
                if (resource.name == "修改") {
                    btu_update = '';
                }
                if (resource.name == "删除") {
                    btu_delete = '';
                }
                if (resource.name == "新增") {
                    //  console.log("dsrfsafsf");
                    btu_add = '';
                }
            }
        }
    }

</script>
</body>
</html>
