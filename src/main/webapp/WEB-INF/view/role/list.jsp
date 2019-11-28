<%--
  Created by IntelliJ IDEA.
  User: decade
  Date: 2019/11/7
  Time: 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>角色管理</title>
    <jsp:include page="/WEB-INF/view/commons.jsp"></jsp:include>

    <%--添加--%>
    <script type="text/html" id="addForm"  >
        <div>
            <form class="form-horizontal">
                <div class="form-group">
                    <label  class="col-sm-2 control-label">角色名称</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="add_name" placeholder="角色名称">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">角色描述</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="add_remark" placeholder="角色描述">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">角色权限</label>
                    <div class="col-sm-10">
                        <ul id="addTreeDemo" class="ztree"></ul>
                    </div>
                </div>
            </form>
        </div>
    </script>
    <%--修改--%>
    <script type="text/html" id="updateForm"  >
        <div>
            <form class="form-horizontal" >
                <div class="form-group">
                    <label  class="col-sm-2 control-label">角色名称</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="update_name" placeholder="角色名称">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">角色描述</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="update_remark" placeholder="角色描述">

                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">角色权限</label>
                    <div class="col-sm-10">
                        <ul id="updateTreeDemo" class="ztree"></ul>
                    </div>
                </div>
                <input type="hidden"  id="update_id" >
            </form>
        </div>
    </script>

</head>
<body>
<jsp:include page="/WEB-INF/view/top.jsp"></jsp:include>
<%--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!--%>
<div>

</div>
<%--collapse 折叠--%>

<div class="col-lg-12">

    <div class="form-group">
        <div class="col-sm-offset-5 col-sm-7">
            <button type="button" onclick="toAdd()" class="btn btn-success"><li class="glyphicon glyphicon-plus"></li>&nbsp; 添加</button>
        </div>
    </div>
    <%--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!--%>
    <div class="panel panel-primary">
        <div class="panel-body">
            <div class="bs-example" data-example-id="striped-table">
                <table id="example" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>角色名</th>
                        <th>角色描述</th>
                        <th>录入时间</th>
                        <th>更新时间</th>
                        <th>Salary</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</body>
<script>
    var table;
    var zTreeObj;
    var setting = {
        check: {
            enable: true,
            chkStyle: "checkbox",
            chkboxType: { "Y": "ps", "N": "ps" }
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
    $(function(){
        getPageData();
    });
/* 添加 */
   function interAddZtree(){


       $(document).ready(function(){
           $.post(
               "<%=request.getContextPath()%>/resource/queryResourceList.action",
               function(data){
                   zTreeObj = $.fn.zTree.init($("#addTreeDemo"), setting, data.data);
                   zTreeObj.expandAll(true);
               }
           )
       });
   }
   /*修改*/
   function interUpdateZtree(id){


       $(document).ready(function(){
           $.post(
               "<%=request.getContextPath()%>/resource/queryResourceListByRoleId.action",
               {"roleId":id},
               function(data){
                   zTreeObj = $.fn.zTree.init($("#updateTreeDemo"), setting, data.data);
                   zTreeObj.expandAll(true);
               }
           )
       });
   }

    /* 刷新页面 */
    function queryList(){
        $("#example").dataTable().fnDraw(false); //点击事件触发table重新请求服务器
    }

    /* 分页查询 */
    function getPageData(){
        var buttons="";
        table=$('#example').DataTable({
            "processing": true,
            "serverSide": true,//开启服务的模式
            "searching":false,
            "ordering":true,
            "order":[[0,'asc'],[1,'desc']],
            "aLengthMenu": [3, 5, 20], //更改显示记录数选项
            "ajax": {
                "url": "<%=request.getContextPath()%>/role/queryMapRoleList.action",
                "type": "POST",
                "data": function ( d ) {
                    //添加额外的参数传给服务器

                },
                dataSrc: function (result) {
                    if (result.status==200) {
                        result.draw = result.data.draw;
                        result.recordsTotal = result.data.recordsTotal;
                        result.recordsFiltered = result.data.recordsFiltered;
                        return result.data.data;
                    }else{
                        return "";
                    }

                }
            },
            "columns": [
                {"data": "id"},
                {"data": "roleName"},
                {"data": "remark"},
                {"data": "insertDate",
                    render:function(data){
                        return new Date(data).toLocaleDateString();
                    }
                },
                {"data": "updateDate",
                    render:function(data){
                        return new Date(data).toLocaleDateString();
                    }
                },

                {"data" : "id",render:function(data, type, row, meta) {
                        buttons = '<button type="button" class="btn btn-primary" onclick="toUpdate('+data+',\''+row.roleName+'\',\''+row.remark+'\')"><li class="glyphicon glyphicon-pencil" ></li>&nbsp;修改</button>'+
                            '<button type="button" class="btn btn-danger " onclick="deleteGoods('+data+')"><li class="glyphicon glyphicon-remove-sign" ></li>&nbsp;删除</button>';

                        return buttons;
                    }}

            ],

            "language": {                              // 这是修改语言的显示
                buttons: {
                    pageLength: {
                        _: "显示%d条",
                        '-1': "全部显示"
                    }
                },
                paginate: {
                    first: "首条",
                    previous: "前一页",
                    next: "下一页",
                    last: "末页"
                },
                "info": "第_PAGE_页,共_PAGES_页",
                "infoEmpty": "未找到相关数据",
                "search": "关键字",
                "zeroRecords": "未找到相关数据",
                "decimal": ".",
                "thousands": ","
            }
        })
    }
    /* 添加 */
    function toAdd(){
        bootbox.dialog({
            title: "添加商品",
            message: $("#addForm").html(),
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

                        var  name = $("#add_name").val();
                        var remark = $("#add_remark").val();
                        var nodes = zTreeObj.getCheckedNodes(true);
                        var resourceIds = "";
                        $(nodes).each(function () {
                            resourceIds += "," + this.id;
                        });
                        $.post(
                            "<%=request.getContextPath() %>/role/addRole.action",
                            {"name":name,"remark":remark,"resourceIds":resourceIds},
                            function (result) {
                                if(result.status==200){
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
        interAddZtree();
    }

    /* 删除 */
    function deleteGoods(id){
        bootbox.dialog({
            message: "你确定要删除吗",
            title: "危险操作",
            buttons: {
                Cancel: {
                    label: "容我想想",
                    className: "btn-default",
                    callback: function () {
                        alert("操作终止");
                    }
                }
                , OK: {
                    label: "确认删除",
                    className: "btn-primary",
                    callback: function () {
                        $.post(
                            "<%=request.getContextPath() %>/role/deleteRole.action",
                            {"id":id},
                            function (result) {
                                if(result.status==200){
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
    }
    /* 修改 */
    function toUpdate(id,name,remark){
        window.event.stopPropagation();// 阻止冒泡
        bootbox.dialog({
            title: "修改商品",
            message: $("#updateForm").html(),
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
                        var  name = $("#update_name").val();
                        var remark = $("#update_remark").val();
                        var id = $("#update_id").val();
                        var nodes = zTreeObj.getCheckedNodes(true);
                        var resourceIds = [];
                        $(nodes).each(function () {
                            resourceIds.push(this.id);
                        });
                        var id = id;//
                        $.post(
                            "<%=request.getContextPath() %>/role/updateRole.action",
                            {"name":name,"remark":remark,"resourceIds":resourceIds,"id":id},
                            function (result) {
                                if(result.status==200){
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
        $("#update_name").val(name);
        $("#update_remark").val(remark);
        $("#update_id").val(id);
        interUpdateZtree(id);
    }

</script>
</html>
