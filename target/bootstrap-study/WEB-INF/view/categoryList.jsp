<%--
  Created by IntelliJ IDEA.
  User: decade
  Date: 2019/10/20
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="commons.jsp"></jsp:include>
    <%-- 添加 --%>
    <script type="text/html" id="addFrom">
        <div>
            新增节点的父节点：<input type="text" id="addFatherName" disabled="disabled"><br>
            新增节点的名字：<input type="text" id="addName"><br>
            <input type="hidden" id="addFatherId" >
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
                <input type="hidden" id="updateFatherId" >
                <input type="hidden" id="updateId" >
            </form>

        </div>
    </script>
    <script type="text/javascript">
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
                            var category = {};
                            category.name = $("#updateName").val();
                            category.pid = $("#updateFatherId").val();
                            category.id=$("#updateId").val();
                            $.post(
                                "<%=request.getContextPath() %>/category/updateCategory.action",
                                category,
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

            $("#updateName").val(Name);
            $("#updateId").val(id);
            $("#updateFatherName").val(parentNode.name);
            $("#updateFatherId").val(parentNode.id);

        }

        //删除
        function deleteNode(){
            var nodes=zTreeObj.getSelectedNodes();
            var id=nodes[0].id;
            $.post("<%=request.getContextPath()%>/category/deleteCategory.action",{"id":id},function(data){
                var nodes=zTreeObj.getSelectedNodes();
                zTreeObj.removeNode(nodes[0]);
            })

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
                            var category = {};
                            category.name = $("#addName").val();
                            category.pid = $("#addFatherId").val();
                            $.post(
                                "<%=request.getContextPath() %>/category/addCategory.action",
                                category,
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

        /* 刷新 */
        function queryList(){
            $("#treeDemo").dataTable().fnDraw(false); //点击事件触发table重新请求服务器
        }

        //显示  增加 删除 修改 按钮
        function onclicZtree(){
            $("#buttonDiv").css("display","");
            $("#addDiv").css("display","nane");
            $("#updateDiv").css("display","none");
        }
        var zTreeObj;
        var setting = {
            callback: {
                onClick: onclicZtree
            },
            check: {
                enable: true,
                chkStyle: "checkbox",
                chkboxType: { "Y": "", "N": "" }

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
                "<%=request.getContextPath()%>/category/queryCoregoryList.action",
                function(data){
                    zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, data);
                    zTreeObj.expandAll(true);
                }
            )


        });
    </script>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
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
