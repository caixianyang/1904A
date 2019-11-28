<%--
  Created by IntelliJ IDEA.
  User: decade
  Date: 2019/11/7
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>地区管理</title>
    <jsp:include page="/WEB-INF/view/commons.jsp"></jsp:include>
    <%-- 添加 --%>
    <script type="text/html" id="addFrom">
        <div>
            新增节点的父id：<input type="text" id="addFatherId" disabled="disabled"><br>
            新增节点的名字：<input type="text" id="addName"><br>

        </div>
    </script>
    <script type="text/javascript">
        //修改
        function update(){
            var nodes=zTreeObj.getSelectedNodes();
            nodes[0].pid= $("#updateFatherId").val();
            nodes[0].id = $("#updateId").val();
            nodes[0].name = $("#updateName").val();

            $.post(
                "<%=request.getContextPath()%>/resource!updateResource.action",
                {"rewsource.pid":nodes[0].pid,"rewsource.id":nodes[0].id,"rewsource.name":nodes[0].name},
                function(data){

                    zTreeObj.updateNode(nodes[0]);
                    //修改完成后 隐藏div
                    $("#updateDiv").css("display","none");
                })

        }
        //回显
        function toUpdate(){
            $("#updateDiv").css("display","");
            $("#addDiv").css("display","none");
            var nodes=zTreeObj.getSelectedNodes();
            $("#updateFatherId").val(nodes[0].pid);
            $("#updateId").val(nodes[0].id);
            $("#updateName").val(nodes[0].name);
        }
        //删除
        function deleteNode(){
            var nodes=zTreeObj.getSelectedNodes();
            var id=nodes[0].id
            $.post("<%=request.getContextPath()%>/resource/deleteResource.action",{"id":id},function(data){
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
                                        queryList();
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
            var pid=nodes[0].id;
            $("#addFatherId").val(pid);
        }
        //增加
        function add(){
            var pid = $("#addFatherId").val();
            var name = $("#addName").val();
            $.post(
                "<%=request.getContextPath()%>/resource!addResource.action",
                {"rewsource.name":name,"rewsource.pid":pid},
                function(data){
                    var node={"id":data,"name":name,"pid":pid};
                    //获取父节点
                    var pNode=zTreeObj.getSelectedNodes();

                    zTreeObj.addNodes(pNode[0],node);
                    $("#addDiv").css("display","none");

                }
            )


        }



        //显示  增加 删除 修改 按钮
        function onclicZtree(){
            $("#buttonDiv").css("display","");
        }
        var zTreeObj;
        var setting = {
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
                "<%=request.getContextPath()%>/area/queryAreaList.action",
                function(data){
                    zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, data);
                    zTreeObj.expandAll(true);
                }
            )


        });
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


<!-- 修改 -->
<div id="updateDiv" style="display:none;">
    <input type="hidden" id="updateFatherId"><br>
    节点id:<input type="text" id="updateId" disabled="disabled"><br>
    节点name:<input type="text" id="updateName"><br>
    <input type="button" onclick="update()" value="修改">
</div>
</body>
</html>