<%--
  Created by IntelliJ IDEA.
  User: decade
  Date: 2019/11/7
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>权限管理</title>
    <jsp:include page="/WEB-INF/view/commons.jsp"></jsp:include>

    <%-- 添加 --%>
    <script type="text/html" id="addFrom">
        <div>
            <form class="form-horizontal">
                <div class="form-group ">
                    <label for="addFatherName" class="col-sm-2 control-label">父节点:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control"  id="addFatherName" readonly="readonly">
                    </div>
                </div>
                <div class="form-group ">
                    <label  class="col-sm-2 control-label">新增节点:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control"  id="addName" >
                    </div>
                </div>
                <div class="form-group ">
                    <label  class="col-sm-2 control-label">url:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control"  id="addUrl" >
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">类型</label>
                    <div class="col-sm-4">
                        <input type="radio" name="add_type"    aria-describedby="sizing-addon1" value="1">菜单
                        <input type="radio" name="add_type"    aria-describedby="sizing-addon1" value="2">按钮
                    </div>
                </div>
                <%--父节点：<input type="text" class="form-control" id="addFatherName" readonly="readonly"><br>--%>
                <%--  新增节点：<input type="text" id="addName" ><br>--%>
                <input type="hidden" id="addFatherId" >

            </form>

        </div>
    </script>
    <%-- 修改 --%>
    <script type="text/html" id="updateFrom">
        <div>
            <form class="form-horizontal">
                <div class="form-group ">
                    <label for="addFatherName" class="col-sm-2 control-label">父节点:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control"  id="updateFatherName" readonly="readonly">
                    </div>
                </div>
                <div class="form-group ">
                    <label  class="col-sm-2 control-label">当前节点:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control"  id="updateName" >
                    </div>
                </div>
                <div class="form-group ">
                    <label  class="col-sm-2 control-label">url:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control"  id="updateUrl" >
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">类型</label>
                    <div class="col-sm-4">
                        <input type="radio" name="update_type"    aria-describedby="sizing-addon1" value="1">菜单
                        <input type="radio" name="update_type"    aria-describedby="sizing-addon1" value="2">按钮
                    </div>
                </div>
                <input type="hidden" id="updateFatherId" >
                <input type="hidden" id="updateId" >

            </form>

        </div>
    </script>
    <script type="text/javascript">

        //显示  增加 删除 修改 按钮
        function onclicZtree(){
            $("#buttonDiv").css("display","");
        }
        var zTreeObj;
        var setting = {
            callback: {
                onClick: onclicZtree
            },
            data: {
                key: {
                    url: "xUrl"
                },
                simpleData: {
                    enable: true,
                    pIdKey: "pid"
                }
            }

        };
        $(document).ready(function(){
            $.post(
                "<%=request.getContextPath()%>/resource/queryResourceList.action",
                function(data){
                    zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, data.data);
                    zTreeObj.expandAll(true);
                }
            )
        });

        /* 刷新 */
        function queryList(){
            $("#treeDemo").dataTable().fnDraw(false); //点击事件触发table重新请求服务器
        }

        /* 添加 */
        function showAddDiv(){
            bootbox.dialog({
                title: "添加商品",
                message: $("#addFrom").html(),
                buttons: {
                    Cancel: {
                        label: "撤销",
                        className: "btn-default",
                        callback: function () {
                            alert("操作终止");
                        }
                    }
                    , OK: {
                        label: "提交",
                        className: "btn-primary",
                        callback: function () {
                            var resource = {};
                            resource.name = $("#addName").val();
                            resource.pid = $("#addFatherId").val();
                            resource.url = $("#addUrl").val();
                            resource.type=$("[name='add_type']:checked").val();
                            $.post(
                                "<%=request.getContextPath() %>/resource/addResource.action",
                                resource,
                                function (data) {
                                    if(data.status==200){
                                        alert("操作完成");
                                    } else {
                                        bootbox.alert(
                                            "系统异常，请联系管理员",function() {

                                            }
                                        )
                                    }
                                    queryList();
                                }
                            )
                        }
                    }
                }

            });
            //回显父id  先获取选中的节点
            var nodes=zTreeObj.getSelectedNodes();
            var fName=nodes[0].name;
            var pid = nodes[0].id;
            $("#addFatherName").val(fName);
            $("#addFatherId").val(pid);
        }

        /* 修改 */
        function toUpdate(){
            bootbox.dialog({
                title: "添加商品",
                message: $("#updateFrom").html(),
                buttons: {
                    Cancel: {
                        label: "撤销",
                        className: "btn-default",
                        callback: function () {
                            alert("操作终止");
                        }
                    }
                    , OK: {
                        label: "提交",
                        className: "btn-primary",
                        callback: function () {
                            var resource = {};
                            resource.name = $("#updateName").val();
                            resource.pid = $("#updateFatherId").val();
                            resource.url = $("#updateUrl").val();
                            resource.type=$("[name='update_type']:checked").val();
                            resource.id=$("#updateId").val();
                            $.post(
                                "<%=request.getContextPath() %>/resource/updateResource.action",
                                resource,
                                function (data) {
                                    if(data.status==200){
                                        alert("操作完成");
                                    } else {
                                        bootbox.alert(
                                            "系统异常，请联系管理员",function() {

                                            }
                                        )
                                    }
                                }
                            )
                        }
                    }
                }
            });
            //回显父id  先获取选中的节点
            var nodes=zTreeObj.getSelectedNodes();
            var parentNode = nodes[0].getParentNode();
            var Name=nodes[0].name;
            var id = nodes[0].id;
            var typeId = nodes[0].type;
            var url = nodes[0].url;
            $("[name='update_type']").each(
                function () {
                    if (this.value == typeId){
                        this.checked = true;
                    }
                });
            $("#updateName").val(Name);
            $("#updateId").val(id);
            $("#updateFatherName").val(parentNode.name);
            $("#updateFatherId").val(parentNode.id);
            $("#updateUrl").val(url);
        }

        //删除
        function deleteNode(){
            var nodes=zTreeObj.getSelectedNodes();
            var id=nodes[0].id;
            $.post("<%=request.getContextPath()%>/resource/deleteResource.action",{"id":id},function(data){
                var nodes=zTreeObj.getSelectedNodes();
                zTreeObj.removeNode(nodes[0]);
            })

        }



    </script>
</head>
<body>
<jsp:include page="/WEB-INF/view/top.jsp"></jsp:include>
<div>
    <ul id="treeDemo" class="ztree"></ul>
</div>
<div style="display:none;" id="buttonDiv">
    <button type="button" onclick="showAddDiv()" class="btn btn-primary"><li class="glyphicon glyphicon-plus"></li>&nbsp; 添加</button>
    <button type="button" onclick="deleteNode()" class="btn btn-danger"><li class="glyphicon glyphicon-trash"></li>&nbsp; 删除</button>
    <button type="button" onclick="toUpdate()" class="btn btn-warning"><li class="glyphicon glyphicon-pencil"></li>&nbsp; 修改</button>

</div>
</body>
</html>
