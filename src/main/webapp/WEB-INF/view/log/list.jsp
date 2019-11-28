<%--
  Created by IntelliJ IDEA.
  User: decade
  Date: 2019/10/28
  Time: 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>日志管理页面</title>
    <jsp:include page="/WEB-INF/view/commons.jsp"></jsp:include>
    <script>
        var table;
        /* 初始化 */
        $(function(){
            getPageData();
            initDate();

        });

        /* 刷新 */
        function queryList(){
            $("#example").dataTable().fnDraw(false); //点击事件触发table重新请求服务器
        }
        /* 条件查询时间 */
        function initDate() {
            var minDate = $('#minDate').datetimepicker({
                format: 'YYYY-MM-DD hh:mm',
                locale: moment.locale('zh-cn')
            });
            var maxDate = $('#maxDate').datetimepicker({
                format: 'YYYY-MM-DD hh:mm',
                locale: moment.locale('zh-cn')
            });
            //动态设置最小值
            minDate.on('dp.change', function (e) {
                maxDate.data('DateTimePicker').minDate(e.date);
            });
            //动态设置最大值
            maxDate.on('dp.change', function (e) {
                minDate.data('DateTimePicker').maxDate(e.date);
            });

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
                    "url": "<%=request.getContextPath()%>/log/queryMapLoginList.action",
                    "type": "POST",
                    "data": function ( d ) {
                        //添加额外的参数传给服务器
                       d.name = $("#name").val();
                       d.minTime = $("#minDate").val();
                       d.maxTime = $("#maxDate").val();
                       d.motion = $("#motion").val();
                       d.status = $("[name='status']:checked").val();
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
                    {"data": "userName"},

                    {"data":"status",render: function(data) {
                            return data==1?"成功":"失败";
                        }},
                    {"data": "info"},
                    {"data": "createTime",
                        render:function(data){
                            return new Date(data).toLocaleString();
                        }
                    },
                    {"data": "motion"}
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

    </script>
</head>
<body>
<jsp:include page="/WEB-INF/view/top.jsp"></jsp:include>
<div class="col-lg-12">
    <%-- 条件查询 --%>
    <form class="form-horizontal">
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">用户名称</label>
            <div class="form-group col-sm-2">
                <input type="text" class="form-control" id="name" placeholder="用户名称">
            </div>
            <div class="col-sm-2"></div>
            <label for="motion" class="col-sm-2 control-label">动作</label>
            <div class="form-group col-sm-2">
                <input type="text" class="form-control" id="motion" placeholder="动作">
            </div>
        </div>
        <div class="form-horizontal">
            <label for="inputPassword5" class="col-sm-1 control-label">注册时间</label>
            <div class="col-sm-4">
                <div class="input-group">
                    <input type="text" id="minDate" class="form-control" placeholder="00.00" aria-describedby="sizing-addon1">
                    <span class="input-group-addon glyphicon glyphicon-minus" id="inputPassword5"></span>
                    <input type="text" id="maxDate" class="form-control" placeholder="00.00" aria-describedby="sizing-addon1">
                </div>
            </div>
            <div class="col-sm-2"></div>
            <label for="inputPassword5" class="col-sm-1 control-label">是否成功</label>
            <div class="col-sm-3">
                <div class="input-group">
                    <input type="radio" name="status" aria-describedby="sizing-addon1" value="1">成功
                    <input type="radio" name="status" aria-describedby="sizing-addon1" value="2">失败
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-7">
                <button type="button" onclick="queryList()" class="btn btn-primary">Submit</button>
                <button type="reset" class="btn btn-info">Reset</button>
            </div>
        </div>
    </form>
    <%--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!--%>
    <div class="panel panel-primary">
        <div class="panel-body">
            <div class="bs-example" data-example-id="striped-table">
                <table id="example" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                    <tr>
                        <th>用户名称</th>
                        <th>状态</th>
                        <th>内容</th>
                        <th>创建时间</th>
                        <th>动作</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>


</body>
</html>
