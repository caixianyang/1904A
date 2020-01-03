<%--
  Created by IntelliJ IDEA.
  User: decade
  Date: 2019/10/24
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/WEB-INF/view/commons.jsp"></jsp:include>
</head>
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
                   var flag=result.data;
                   if(flag==2){
                       bootbox.alert("用户名已存在");
                   }else if(flag==1){
                       bootbox.alert("注册成功");
                       location.href="login.jsp";
                   }
               }
           }
       )}
</script>
<body>
<%----%>
<div >
    <h1> 注册 </h1>
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
            <div class="col-sm-offset-5 col-sm-7">
                <button  type="button" onclick="adduser()" class="btn btn-primary">Submit</button>
                <button type="reset" class="btn btn-info">Reset</button>
            </div>
        </div>
    </form>

</div>
</body>
</html>
