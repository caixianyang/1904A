<%--
  Created by IntelliJ IDEA.
  User: decade
  Date: 2019/10/22
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理页面</title>
    <jsp:include page="/WEB-INF/view/commons.jsp"></jsp:include>
</head>
<%-- 添加 --%>
<script type="text/html" id="addDiv">
    <form class="form-horizontal" >
        <div class="form-group">
            <label  class="col-sm-2 control-label">用户名称</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="add_name" placeholder="用户名称">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">用户密码</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="add_pwd" placeholder="用户密码">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">真实名称</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="add_realUserName" placeholder="用户名称">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">性别</label>
            <div class="col-sm-4">
                <input type="radio" name="add_sex"    aria-describedby="sizing-addon1" value="1">男
                <input type="radio" name="add_sex"    aria-describedby="sizing-addon1" value="2">女
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">年龄</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="add_age" placeholder="年龄">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">手机号</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="add_phone" placeholder="手机号">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">电子邮箱</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="add_email" placeholder="电子邮箱">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">薪水</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="add_salary" placeholder="薪水">
            </div>
        </div>
        <div class="form-group" id="addRole">
            <label  class="col-sm-2 control-label">执行角色</label>

        </div>
        <div class="form-group" id="add_area">
            <label  class="col-sm-2 control-label">地区分类</label>

        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label" style="margin-bottom: 300px">图片</label>
            <div class="col-sm-7" style="height: 300px">
                <input id="add_file" multiple type="file" name="file" data-show-caption="true" >
                <input id="add_filepath"  type="hidden" name="filePath" >
            </div>
        </div>
    </form>

</script>
<%-- 修改 --%>
<script type="text/html" id="updateDiv">
    <form class="form-horizontal" >
        <div class="form-group">
            <label  class="col-sm-2 control-label">用户名称</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="update_name" placeholder="用户名称">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">真实名称</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="update_realUserName" placeholder="用户名称">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">性别</label>
            <div class="col-sm-4">
                <input type="radio" name="add_sex"    aria-describedby="sizing-addon1" value="1">男
                <input type="radio" name="add_sex"    aria-describedby="sizing-addon1" value="2">女
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">年龄</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="update_age" placeholder="年龄">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">手机号</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="update_phone" placeholder="手机号">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">电子邮箱</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="update_email" placeholder="电子邮箱">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">薪水</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="update_salary" placeholder="薪水">
            </div>
        </div>
        <div class="form-group" id="update_area">
            <label  class="col-sm-2 control-label">地区分类</label>

        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label" style="margin-bottom: 300px">图片</label>
            <div class="col-sm-7" style="height: 300px">
                <input id="update_file" multiple type="file" name="file" data-show-caption="true" >
                <input id="update_filepath"  type="hidden" name="filePath" >
            </div>
        </div>
    </form>

</script>
<script>
    var table;
    var idsList=[];
    /* 初始化 */
    $(function(){

        getPageData();
        initDate();
        initBindEvent();
       initFileUpdateInput();
        showAddArea(0,null,1);
        showUpdateArea(0,null,1);

    });

    /* 刷新 */
    function queryList(){
        $("#example").dataTable().fnDraw(false); //点击事件触发table重新请求服务器
    }

    /* 角色单选 */
    function queryRoleList(){

        $.post(
            "<%=request.getContextPath()%>/role/queryRoleList.action",
            function(result){
                if(result.status==200){
                    var data=result.data;
                    var str = "";
                    for ( var i = 0; i < data.length; i++) {
                        str += "<input type='checkbox' name='add_role' value=\"" + data[i].id + "\"/>"+ data[i].roleName+"&nbsp;&nbsp;&nbsp;";
                    }
                    $("#addRole").append(str);

                }
            }
        )

    }

    /* 添加地区三级联动 */
    function showAddArea(pid,obj,a) {
        $(obj).parent().nextAll().remove();
        $.ajax({
            url:"<%=request.getContextPath()%>/area/queryArea.action",
            type:"post",
            dataType:"json",
            data:{"pid":pid},
            success:function(data){
                if(data.length >0 ){
                    var str = "<div class=\"col-sm-3\">\n" +
                        "                        <select class=\"form-control\" id=\"add_area"+(a++)+"\"  onchange=\"showAddArea(this.value,this,"+ a +")\"><option value='-1'>请选择</option>";
                    for ( var i = 0; i < data.length; i++) {
                        str += "<option value=" + data[i].id + ">" + data[i].name + "</option>";
                    }
                    str += "  </select></div>";
                    $("#add_area").append(str);
                }

            },
            error:function(){
                alert("请求类型失败！！！");
            }
        });
    }
    /* 修改地区三级联动 */
    function showUpdateArea(pid,obj,a) {
        $(obj).parent().nextAll().remove();
        $.ajax({
            url:"<%=request.getContextPath()%>/area/queryArea.action",
            type:"post",
            dataType:"json",
            data:{"pid":pid},
            success:function(data){
                if(data.length >0 ){
                    var str = "<div class=\"col-sm-3\">\n" +
                        "                        <select class=\"form-control\" id=\"update_area"+(a++)+"\"  onchange=\"showUpdateArea(this.value,this,"+ a +")\"><option value='-1'>请选择</option>";
                    for ( var i = 0; i < data.length; i++) {
                        str += "<option value=" + data[i].id + ">" + data[i].name + "</option>";
                    }
                    str += "  </select></div>";
                    $("#update_area").append(str);
                }

            },
            error:function(){
                alert("请求类型失败！！！");
            }
        });
    }
    /* 添加 */
    function toAdd() {
        bootbox.dialog({
            title: "添加用户",
            message: $("#addDiv").html(),
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
                        var user = {};
                        user.name = $("#add_name").val();
                        user.pwd = $("#add_pwd").val();
                        user.phone = $("#add_phone").val();
                        user.realUserName = $("#add_realUserName").val();
                        user.age = $("#add_age").val();
                        user.email = $("#add_email").val();
                        user.salary = $("#add_salary").val();
                        user.userImgUrl = $("#add_filepath").val();
                        user.area1 = $("#add_area1").val();
                        user.area2 = $("#add_area2").val();
                        user.area3 = $("#add_area3").val();
                        user.area4 = $("#add_area4").val();
                        user.sex = $("[name='add_sex']:checked").val();
                        var roleArr = [];
                       $("[name='add_role']:checked").each(function(){
                           roleArr.push(this.value);
                        });
                        user.roleArr = roleArr;
                        $.post(
                            "<%=request.getContextPath() %>/user/insertUser.action",
                            user,
                            function (result) {
                                if(result.status==200){
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
        showAddArea(0,null,1);
        initFileAddInput();
        queryRoleList();
    }

    /* 条件查询时间 */
    function initDate() {
        var minDate = $('#minDate').datetimepicker({
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn')
        });
        var maxDate = $('#maxDate').datetimepicker({
            format: 'YYYY-MM-DD',
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
                "url": "<%=request.getContextPath()%>/user/queryMapUserList.action",
                "type": "POST",
                "data": function ( d ) {
                    //添加额外的参数传给服务器
                    d.name = $("#name").val();
                    d.minTime = $("#minDate").val();
                    d.maxTime = $("#maxDate").val();
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
                {"data": "id", render:function(data){
                        return '<input type="checkbox" value="'+data+'" name="ids"/>'
                    }},
                {"data": "name"},
                {"data": "realUserName"},
                {"data": "sex",
                    render:function(data){
                        return data==1?"男":"女";
                    }},
                {"data": "age"},
                {"data": "phone"},
                {"data": "email"},
                {"data": "salary"},
                {"data": "userImgUrl",render: function(data) {
                        buttons = '<img src="'+imgUrl+''+data+'" width="50px"/>';
                        return buttons;
                    }},
                {"data":"area"},
                {"data": "cteateDate",
                    render:function(data){
                        return new Date(data).toLocaleDateString();
                    }
                },
                {"data": "id",render: function(data) {
                        buttons ='<button type="button" class="btn btn-primary '+ btu_update +' " onclick="toUpdate('+data+')"><li class="glyphicon glyphicon-pencil" ></li>&nbsp;修改</button> '+
                            '<button type="button" class="btn btn-danger '+ btu_delete +' " onclick="deleteUser('+data+')"><li class="glyphicon glyphicon-remove-sign" ></li>&nbsp;删除</button>';
                        return buttons;
                    }
                }
            ],
            "drawCallback": function( settings ) {
                console.log(idsList);
                if(idsList.length>0){
                    $("[name='ids']").each(function () {
                        if(idsList.indexOf(this.value)!=-1){
                            this.checked=true;
                            $(this).parent().parent().css("background-color","pink");
                        }
                    })
                }
                showquery();
            },
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
    /* 删除 */
    function deleteUser(id){
        var housePrice = $("#housePrice").val();
        window.event.stopPropagation();// 阻止冒泡
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
                            "<%=request.getContextPath() %>/user/deleteUser.action",
                            {"id":id},
                            function(result){
                                if(result.status==200) {
                                    var data = result.data;
                                    if (data.status == 200) {
                                        alert("操作完成");
                                        queryList();

                                    } else {
                                        bootbox.alert(
                                            "系统异常，请联系管理员", function () {

                                            }
                                        )
                                    }
                                }
                            }
                        )



                    }
                }
            }
        });

        queryList();
    }
    /* 反选 */
    function xuanAll(){
        window.event.stopPropagation();// 阻止冒泡
        $("[name='ids']").each(function(){
            if(!this.checked){
                $(this).parent().parent().css("background-color","pink");
                idsList.push(this.value)

            }else{
                $(this).parent().parent().css("background-color","");
                idsList.splice(idsList.indexOf(this.value),1)
            }
            this.checked=!this.checked;


        })
    }
    /* 单击变色 */
    function initBindEvent(){
        $("#example").on('click','tr',function () {
            var data = table.row(this).data();//获取单击那行的数据
            console.log(data);
            //复选框
            var checkBox = $(this).find("[name='ids']")[0];
            if(checkBox.checked){
                checkBox.checked = false;
                $(this).css("background-color","");
                idsList.splice(idsList.indexOf(checkBox.value),1);
            }else{
                checkBox.checked = true;
                $(this).css("background-color","pink");
                idsList.push(checkBox.value);
            }
        })
    }
    /* 批量删除 */
    function deleteBath(){
        window.event.stopPropagation();// 阻止冒泡
        if(idsList.length>0){
            $.post(
                "<%=request.getContextPath() %>/user/deleteBatch.action",
                {"idsList":idsList},
                function(result){
                    if(result.status==200) {
                        var data = result.data;
                        if (data.status == 200) {
                            queryList();
                        } else {
                            bootbox.confirm("操作失败,请联系管理员!", function () {

                            })
                        }
                    }
                }
            )
        }else{
            bootbox.alert("请选择要删除的数据！",function(){

            })
        }
        queryList();
    }
    /* 修改 */
    function toUpdate(id) {
        window.event.stopPropagation();// 阻止冒泡
        bootbox.dialog({
            title: "修改商品",
            message: $("#updateDiv").html(),
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
                        var user = {};
                        user.name = $("#update_name").val();
                        user.phone = $("#update_phone").val();
                        user.realUserName = $("#update_realUserName").val();
                        user.age = $("#update_age").val();
                        user.email = $("#update_email").val();
                        user.salary = $("#update_salary").val();
                        user.userImgUrl = $("#update_filepath").val();
                        user.area1 = $("#update_area1").val();
                        user.area2 = $("#update_area2").val();
                        user.area3 = $("#update_area3").val();
                        user.area4 = $("#update_area4").val();
                        user.sex = $("[name='uppdate_sex']:checked").val();
                        user.id = id;
                        $.post(
                            "<%=request.getContextPath() %>/user/updateUser.action",
                            user,
                            function(result){
                                if(result.status==200) {
                                    var data = result.data;
                                    if (data.status == 200) {
                                        alert("操作完成");
                                        queryList();
                                    } else {
                                        bootbox.alert(
                                            "系统异常，请联系管理员", function () {

                                            }
                                        )
                                    }
                                }
                            }
                        )
                    }
                }
            }
        });

        $.post(
            "<%=request.getContextPath() %>/user/getUserById.action",
            {"id":id},
            function(result){
                if(result.status==200) {
                    var data = result.data;
                    $("#update_name").val(data.name);
                    $("#update_phone").val(data.phone);
                    $("#update_realUserName").val(data.realUserName);
                    $("#update_age").val(data.age);
                    $("#update_email").val(data.email);
                    $("#update_salary").val(data.salary);
                    $("#update_filepath").val(data.userImgUrl);
                    $("#update_area1").val(data.area1);
                    $("#update_area2").val(data.area2);
                    $("#update_area3").val(data.area3);
                    $("#update_area4").val(data.area4);
                    $("[name='uppdate_sex']").each(
                            function () {
                                if (this.value == data.status){
                                    this.checked = true;
                                }
                            }
                    );
                    initFileUpdateInput();
                    showUpdateArea(0,null,1);
                }
            }
        );
        queryList();
    }
    /* 修改图片上传 */
    function initFileUpdateInput() {
        var aaa = $("#update_filepath").val();
        $("#update_file").fileinput({
            initialPreview: [ //预览图片的设置
                "<img src='"+imgUrl+""+aaa+"' class='file-preview-image' style='width:100px'>"
            ],
            language: 'zh', //设置语言
            uploadUrl: "<%=request.getContextPath()%>/uploadFile/photoUploadByFtp.action", //上传的地址
            allowedFileExtensions: ['jpg', 'gif', 'png', 'exe'],//接收的文件后缀
            //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
            uploadAsync: true, //默认异步上传
            showUpload: true, //是否显示上传按钮
            showRemove: true, //显示移除按钮
            showPreview: true, //是否显示预览
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            //dropZoneEnabled: true,//是否显示拖拽区域
            //minImageWidth: 50, //图片的最小宽度
            //minImageHeight: 50,//图片的最小高度
            //maxImageWidth: 1000,//图片的最大宽度
            //maxImageHeight: 1000,//图片的最大高度
            //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
            //minFileCount: 0,
            maxFileCount: 10, //表示允许同时上传的最大文件个数
            enctype: 'multipart/form-data',
            validateInitialCount: true,
            previewFileIcon: "<i class='glyphicon glyphicon-cloud'></i>",
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            layoutTemplates: {
                //actionDelete:'', //去除上传预览的缩略图中的删除图标
                //actionUpload:'',//去除上传预览缩略图中的上传图片；
                //actionZoom:''   //去除上传预览缩略图中的查看详情预览的缩略图标。
            }
        }).on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功
            $("#update_filepath").val(data.response.filePath);

        })
    }
    /* 添加图片上传 */
    function initFileAddInput() {
        $("#add_file").fileinput({
            language: 'zh', //设置语言
            uploadUrl: "<%=request.getContextPath()%>/uploadFile/photoUploadByFtp.action", //上传的地址
            allowedFileExtensions: ['jpg', 'gif', 'png','exe'],//接收的文件后缀
            //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
            uploadAsync: true, //默认异步上传
            showUpload: true, //是否显示上传按钮
            showRemove : true, //显示移除按钮
            showPreview : true, //是否显示预览
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            //dropZoneEnabled: true,//是否显示拖拽区域
            //minImageWidth: 50, //图片的最小宽度
            //minImageHeight: 50,//图片的最小高度
            //maxImageWidth: 1000,//图片的最大宽度
            //maxImageHeight: 1000,//图片的最大高度
            //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
            //minFileCount: 0,
            maxFileCount: 10, //表示允许同时上传的最大文件个数
            enctype: 'multipart/form-data',
            validateInitialCount:true,
            previewFileIcon: "<i class='glyphicon glyphicon-cloud'></i>",
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            layoutTemplates :{
                //actionDelete:'', //去除上传预览的缩略图中的删除图标
                //actionUpload:'',//去除上传预览缩略图中的上传图片；
                //actionZoom:''   //去除上传预览缩略图中的查看详情预览的缩略图标。
            }
        }).on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功
            $("#add_filepath").val(data.response.filePath);

        })
    }

    function showquery(){/*  */
        var str = '<button type="button" onclick="toAdd()" class="btn btn-primary  '+btu_add+'  "><li class="glyphicon glyphicon-plus"></li>&nbsp; 添加</button>\n' +
            '            <button type="button" onclick="deleteBath()" class="btn btn-danger" ><li class="glyphicon glyphicon-trash"></li>&nbsp;批量删除</button>';
        $("#show_ade").html(str);
    }

</script>
<body>
<%--面包屑 导航--%>

<jsp:include page="/WEB-INF/view/top.jsp"></jsp:include>

<div class="col-lg-12">
    <%-- 条件查询 --%>
    <form class="form-horizontal">
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">用户名称</label>
            <div class="form-group col-sm-2">
                <input type="text" class="form-control" id="name" placeholder="用户名称">
            </div>
            <label for="inputPassword5" class="col-sm-1 control-label">注册时间</label>
            <div class="col-sm-3">
                <div class="input-group">
                    <input type="text" id="minDate" class="form-control" placeholder="00.00" aria-describedby="sizing-addon1">
                    <span class="input-group-addon glyphicon glyphicon-minus" id="inputPassword5"></span>
                    <input type="text" id="maxDate" class="form-control" placeholder="00.00" aria-describedby="sizing-addon1">
                </div>
            </div>
            <div class="col-sm-2"></div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-7">
                <button type="button" onclick="queryList()" class="btn btn-primary">Submit</button>
                <button type="reset" class="btn btn-info">Reset</button>
            </div>
        </div>
    </form>
    <div class="form-group">
        <div class="col-sm-offset-9 col-sm-3" id="show_ade">
           <%-- <button type="button" onclick="toAdd()" class="btn btn-primary btu_add "><li class="glyphicon glyphicon-plus"></li>&nbsp; 添加</button>
            <button type="button" onclick="deleteBath()" class="btn btn-danger"><li class="glyphicon glyphicon-trash"></li>&nbsp;批量删除</button>--%>
        </div>
    </div>
    <%--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!--%>
    <div class="panel panel-primary">
        <div class="panel-body">
            <div class="bs-example" data-example-id="striped-table">
                <table id="example" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                    <tr>
                        <th>
                            <input type="checkbox" onclick="xuanAll()"/>全选
                        </th>
                        <th>名称</th>
                        <th>真实姓名</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>手机号</th>
                        <th>邮箱</th>
                        <th>工资</th>
                        <th>头像</th>
                        <th>地址</th>
                        <th>时间</th>
                        <th>Salary</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>


</body>
</html>
