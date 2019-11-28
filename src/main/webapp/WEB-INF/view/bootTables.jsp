<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品管理页面</title>
    <jsp:include page="commons.jsp"></jsp:include>
    <%--添加--%>
    <script type="text/html" id="addGoods"  >
        <div>
            <form class="form-horizontal" id="addFrom" <%--method="post" href="<%=request.getContextPath() %>/goods/addGoods.action"--%>>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">商品名称</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="add_name" name="name" placeholder="商品名称">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">商品价格</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="add_price" name="price" placeholder="商品价格">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">商品库存</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="add_subTotalCount"  placeholder="商品库存">
                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">生产时间</label>
                    <div class="col-sm-4">
                        <input type="text"  id="add_time" name="time" class="form-control" placeholder="年/月/日" aria-describedby="sizing-addon1">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">商品品牌</label>
                    <div class="col-sm-4">
                        <select class="form-control" id="add_beand" name="brand_id"></select>
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">商品上下架</label>
                    <div class="col-sm-4">
                        <input type="radio" name="add_status"    aria-describedby="sizing-addon1" value="1"> 上架
                        <input type="radio" name="add_status"    aria-describedby="sizing-addon1" value="2"> 下架
                    </div>
                </div>
                <div class="form-group" id="add_category">
                    <label  class="col-sm-2 control-label">商品分类</label>

                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label" style="margin-bottom: 300px">图片</label>
                    <div class="col-sm-7" style="height: 300px">
                        <input id="add_file" multiple type="file" name="file" data-show-caption="true" >
                        <input id="add_filepath"  type="text" name="filePath" >
                    </div>
                </div>
                <div class="form-group">
                    <div style="margin-bottom: 100px"></div>
                </div>
            </form>

        </div>
    </script>
    <%--修改--%>
    <script type="text/html" id="updateGoods">
    <div>
        <form class="form-horizontal" >
            <div class="form-group">
                <label  class="col-sm-2 control-label">商品名称</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="update_name" placeholder="商品名称">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">商品价格</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="update_price" placeholder="商品价格">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">商品库存</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="update_subTotalCount" placeholder="商品库存">
                </div>
            </div>

            <div class="form-group">
                <label  class="col-sm-2 control-label">生产时间</label>
                <div class="col-sm-4">
                    <input type="text"  id="update_time" class="form-control" placeholder="年/月/日" aria-describedby="sizing-addon1">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">商品上下架</label>
                <div class="col-sm-4">
                    <input type="radio" name="update_status"    aria-describedby="sizing-addon1" value="1"> 上架
                    <input type="radio" name="update_status"    aria-describedby="sizing-addon1" value="2"> 下架
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">商品品牌</label>
                <div class="col-sm-4">
                    <select class="form-control" id="update_beand" name="brand.id"></select>
                </div>
            </div>
            <div class="form-group" style="margin-bottom: 100px">
                <label class="control-label col-md-2">图片</label>
                <div class="col-sm-7" style="height: 300px">
                    <input id="update_file" multiple type="file" name="file" data-show-caption="true" >
                    <input id="update_filepath"  type="hidden" >
                </div>
                </div>
        </form>
    </div>
</script>
    <%-- 导入Excel --%>
    <script type="text/html" id="inputExcel">
        <div class="form-group" style="height: 70px">
            <label class="control-label col-md-2">导入EXCEL</label>
            <div class="col-sm-7" >
                <input id="upload_file" multiple type="file" name="file" data-show-caption="true" >
                <input id="upload_filepath"  type="hidden" >
            </div>
        </div>
    </script>


</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<%--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!--%>
<div>

</div>
<div class="col-lg-12">
<%-- 条件查询 --%>
    <form class="form-horizontal" id="queryFrom">
        <div class="form-group">
                <label for="inputName" class="col-sm-2 control-label">Name</label>
            <div class="form-group col-sm-2">
                <input type="text" class="form-control" id="inputName" name="name" placeholder="Name">
            </div>
            <label for="selectType" class="col-sm-3 control-label">品牌</label>
            <div class="col-sm-2" >
                <select class="form-control" id="selectType" name="productId">
                </select>
            </div>
            <div class="col-sm-2"></div>
        </div>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-1 control-label">日期</label>
            <div class="col-sm-4">
                <div class="input-group">
                    <input type="text" id="minDate" name="minTime" class="form-control" placeholder="年/月/日" aria-describedby="sizing-addon1">
                    <span class="input-group-addon glyphicon glyphicon-calendar" id="inputPassword3"></span>
                    <input type="text" id="maxDate" name="maxTime" class="form-control" placeholder="年/月/日" aria-describedby="sizing-addon1">
                </div>
            </div>

            <label for="inputPassword4" class="col-sm-1 control-label">价格</label>
            <div class="col-sm-3">
                <div class="input-group">
                    <input type="text" id="minPrice" name="minPrice" class="form-control" placeholder="00.00" aria-describedby="sizing-addon1">
                    <span class="input-group-addon glyphicon glyphicon-minus" id="inputPassword4"></span>
                    <input type="text" id="maxPrice" name="maxPrice" class="form-control" placeholder="00.00" aria-describedby="sizing-addon1">
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
    <div class="form-group">
        <div class="col-sm-offset-5 col-sm-7">
            <button type="button" onclick="toAdd()" class="btn btn-success"><li class="glyphicon glyphicon-plus"></li>&nbsp; 添加</button>
            <button type="button" onclick="deleteBath()" class="btn btn-danger"><li class="glyphicon glyphicon-trash"></li>&nbsp;批量删除</button>
            <button type="button" onclick="downloadExcal()" class="btn btn-info"><li class="glyphicon glyphicon-cloud-download"></li>&nbsp;导出Excel</button>
            <button type="button" onclick="downloadPtf()" class="btn btn-info"><li class="glyphicon glyphicon-download"></li>&nbsp;导出pdf</button>
            <button type="button" onclick="downloadWord()" class="btn btn-info"><li class="glyphicon glyphicon-save"></li>&nbsp;导出Word</button>
            <button type="button" onclick="uploadExcal()" class="btn btn-info"><li class="glyphicon glyphicon-cloud-upload"></li>&nbsp;导入Excel</button>
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
                        <th>编号</th>
                        <th>名称</th>
                        <th>Price</th>
                        <th>库存</th>
                        <th>日期</th>
                        <th>上下架</th>
                        <th>品牌</th>
                        <th>图片</th>
                        <th>商品分类</th>
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
    var idsList=[];
    $(function(){
        getPageData();
        queryBrandList();
        initDate();
        initBindEvent();
        initFileAddInput();
        initFileUpdateInput();
        showAddCategory(0,null,1);
        initAddValidator();
    });
    /* 添加表单验证 */
    function initAddValidator(){
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
                    message: '商品名验证失败',
                    validators: {
                        notEmpty: {
                            message: '商品名不能为空'
                        }
                    }
                },
                price: {
                    validators: {
                        notEmpty: {
                            message: '价格不能为空'
                        },
                        digits:{
                            message:'只能是数字'
                        }
                    }
                }
            }
        });
    }
    /* 添加三级联动 */
    function showAddCategory(pid,obj,a) {
        $(obj).parent().nextAll().remove();
        $.ajax({
            url:"<%=request.getContextPath()%>/category/queryCategory.action",
            type:"post",
            dataType:"json",
            data:{"pid":pid},
            success:function(data){
                if(data.length >0 ){
                    var str = "<div class=\"col-sm-3\">\n" +
                        "                        <select class=\"form-control\" id=\"add_category"+(a++)+"\"  onchange=\"showAddCategory(this.value,this,"+ a +")\"><option value='-1'>==请选择==</option>";
                    for ( var i = 0; i < data.length; i++) {
                        str += "<option value=" + data[i].id + ">" + data[i].name + "</option>";
                    }
                    str += "  </select></div>";
                    $("#add_category").append(str);
                }

            },
            error:function(){
                alert("请求类型失败！！！");
            }
        });
    }
    /* 条件查询日期 */
    function initDate() {
        var minDate = $('#minDate').datetimepicker({
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn')
        });
        var maxDate = $('#maxDate').datetimepicker({
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn')
        });
         $('#createTime').datetimepicker({
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
    /* 刷新页面 */
    function queryList(){

        $("#example").dataTable().fnDraw(false); //点击事件触发table重新请求服务器
    }
    /* 条件查询下拉框 */
    function queryBrandList(){

        $.post(
            "<%=request.getContextPath()%>/goods/queryBrandList.action",
            function(result){
                if(result.status==200){
                    var data=result.data;
                    var str = "<option value='0'>==请选择==</option>";
                    for ( var i = 0; i < data.length; i++) {
                        str += "<option value=" + data[i].id + ">" + data[i].name + "</option>";
                    }
                    $("#selectType").html(str);

                }
            }
        )

    }
    //分页查询
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
                "url": "<%=request.getContextPath()%>/goods/queryMapGoodsList.action",
                "type": "POST",
                "data": function ( d ) {
                    //添加额外的参数传给服务器
                    d.productName = $("#inputName").val();
                    d.minTime = $("#minDate").val();
                    d.maxTime = $("#maxDate").val();
                    d.brandId = $("#selectType").val();
                    d.minPrice = $("#minPrice").val();
                    d.maxPrice = $("#maxPrice").val();
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
                {"data": "id"},
                {"data": "name"},
                {"data": "price"},
                {"data": "subTotalCount"},
                {"data": "time",
                    render:function(data){
                        return new Date(data).toLocaleDateString();
                    }
                },
                {"data": "status",
                    render:function(data){
                        return data==1?"上架":"下架";
                    }
                },
                {"data": "brand.name"},
                {"data": "filePath",render: function(data) {
                        buttons = '<img src="'+imgUrl+''+data+'" width="50px"/>';
                        /*<img src="ftp://csdn123:csdn123@10.0.0.8/analysis/recognize/original/58df17c7577454098cf64e42.jpg" />*/
                        return buttons;
                    }},
                {"data":"category"},
                {"data" : "id",render:function(data, type, row, meta) {
                       if(row.status==1){
                           var buttonName = "下架";
                           var buttonColor = "btn btn-warning";
                           var buttonImg = "glyphicon glyphicon-arrow-down";
                           var status = 2;
                       }else{
                           var buttonName = "上架";
                           var buttonColor = "btn btn-success";
                           var buttonImg = "glyphicon glyphicon-arrow-up";
                           var status = 1;
                       }
                        buttons = '<button type="button" class="btn btn-primary" onclick="toUpdate('+data+')"><li class="glyphicon glyphicon-pencil" ></li>&nbsp;修改</button>'+
                        '<button type="button" class="btn btn-danger " onclick="deleteGoods('+data+')"><li class="glyphicon glyphicon-remove-sign" ></li>&nbsp;删除</button>'+
                       '<button type="button" class="'+buttonColor+'" onclick="updateStatusDown('+data+','+status+')"><li class="'+buttonImg+'" ></li>&nbsp;'+buttonName+'</button>';
                        return buttons;
                    }}

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
    //下架
    function updateStatusDown(id,status) {
        window.event.stopPropagation();// 阻止冒泡
        bootbox.dialog({
            message: "你确定要上下架吗",
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
                    label: "确认",
                    className: "btn-primary",
                    callback: function () {
                        $.post(
                            "<%=request.getContextPath() %>/goods/updateStatusDown.action",
                            {"id":id,"status":status},
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

    /* 添加 */
    function toAdd(){
        bootbox.dialog({
                         title: "添加商品",
                         message: $("#addGoods").html(),
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
                         var goods = {};
                            goods.name = $("#add_name").val();
                            goods.price = $("#add_price").val();
                            goods.time = $("#add_time").val();
                            goods.subTotalCount = $("#add_subTotalCount").val();
                            goods.brand_id = $("#add_beand").val();
                            goods.filePath = $("#add_filepath").val();
                            goods.category1 = $("#add_category1").val();
                            goods.category2 = $("#add_category2").val();
                            goods.category3 = $("#add_category3").val();
                            goods.status = $("[name='add_status']:checked").val();
                             $.post(
                                 "<%=request.getContextPath() %>/goods/addGoods.action",
                                 goods,
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
        queryAddBrandList();
        addInitDate();
        initFileAddInput();
        showAddCategory(0,null,1);
        initAddValidator();
    }
    /* 删除 */
    function deleteGoods(id){
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
                                   "<%=request.getContextPath() %>/goods/deleteGoods.action",
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
    function toUpdate(id){
        window.event.stopPropagation();// 阻止冒泡
        bootbox.dialog({
            title: "修改商品",
            message: $("#updateGoods").html(),
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
                        var goods = {};
                        goods.name = $("#update_name").val();
                        goods.price = $("#update_price").val();
                        goods.subTotalCount = $("#update_subTotalCount").val();
                        goods.time = $("#update_time").val();
                        goods.brand_id = $("#update_beand").val();
                        goods.filePath = $("#update_filepath").val();
                        goods.status = $("[name='update_status']:checked").val();
                        goods.id = id;
                        $.post(
                            "<%=request.getContextPath() %>/goods/updateGoods.action",
                            goods,
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
        queryUpdateBrandList();
        queryList();
        $.post(
            "<%=request.getContextPath() %>/goods/getGoodsById.action",
            {"id":id},
            function(result){
                if(result.status==200) {
                    var data = result.data;
                    $("#update_name").val(data.name);
                    $("#update_price").val(data.price);
                    $("#update_subTotalCount").val(data.subTotalCount);
                    $("#update_beand").val(data.brand_id);
                    $("#update_category1").val(data.category1);
                    $("#update_category2").val(data.category2);
                    $("#update_category3").val(data.category3);
                    $("#update_time").val(new Date(data.time).toLocaleDateString());
                    $("#update_filepath").val(data.filePath);
                    $("[name='update_status']").each(
                        function () {
                            if (this.value == data.status){
                                this.checked = true;
                            }
                        }
                    );
                    initFileUpdateInput();
                    updateInitDate();
                }
            }
        );

    }
    /*添加下拉*/
    function queryAddBrandList(){
        $.post(
            "<%=request.getContextPath()%>/goods/queryBrandList.action",
            function(result) {
                if (result.status == 200) {
                    var data = result.data;
                    var str = "<option value='0'>==请选择==</option>";
                    for (var i = 0; i < data.length; i++) {
                        str += "<option value=" + data[i].id + ">" + data[i].name + "</option>";
                    }
                    $("#add_beand").html(str);
                }
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
    /*修改下拉*/
    function queryUpdateBrandList(){
        $.ajaxSettings.async = false;
        $.post(
            "<%=request.getContextPath()%>/goods/queryBrandList.action",
            function(result){
                if(result.status==200) {
                    var data = result.data;
                    var str = "<option value='0'>==请选择==</option>";
                    for (var i = 0; i < data.length; i++) {
                        str += "<option value=" + data[i].id + ">" + data[i].name + "</option>";
                    }
                    $("#update_beand").html(str);
                }
            })

        $.ajaxSettings.async = true;
    }
    /*添加时间*/
    function addInitDate() {
        $('#add_time').datetimepicker({
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn')
        });
    }
    /*修改时间*/
    function updateInitDate() {
        $('#update_time').datetimepicker({
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn')
        });
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
                "<%=request.getContextPath() %>/goods/deleteBatch.action",
                {"idsList":idsList},
                function (result) {
                    if(result.status==200){
                        queryList();
                    }else{
                        bootbox.confirm("操作失败,请联系管理员!",function () {

                        })
                    }
                }
            )
        }else{
            bootbox.alert("请选择要删除的数据！",function(){

            })
        }
    }
    /* 导出Excal */
    function downloadExcal(){
       var form =  document.getElementById("queryFrom");
        form.action="<%=request.getContextPath() %>/goods/exportExcel.action";
        form.method="post";
        form.submit();
    }
    /* 导出Word */
    function downloadWord(){
       var form =  document.getElementById("queryFrom");
        form.action="<%=request.getContextPath() %>/goods/exportWord.action";
        form.method="post";
        form.submit();
    }
    /* 导出Word */
    function downloadPtf(){
       var form =  document.getElementById("queryFrom");
        form.action="<%=request.getContextPath() %>/goods/downloadPtf.action";
        form.method="post";
        form.submit();
    }
    /*excel上传 */
    function initFileExcelInput() {
        //var aaa = $("#update_filepath").val();
        $("#upload_file").fileinput({
            language: 'zh', //设置语言
            uploadUrl: "<%=request.getContextPath()%>/uploadFile/photoUpload.action", //上传的地址
            uploadAsync: true, //默认异步上传
            showUpload: true, //是否显示上传按钮
            showRemove: true, //显示移除按钮
            showPreview: false, //是否显示预览
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            maxFileCount: 1, //表示允许同时上传的最大文件个数
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
            $("#upload_filepath").val(data.response.filePath);

        })
    }
    /* 导入EXCEL */
    function uploadExcal() {
        bootbox.dialog({
            title: "导入excel",
            message: $("#inputExcel").html(),
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
                        var filePath = $("#upload_filepath").val();
                        if(filePath != null){
                            $.post(
                                "<%=request.getContextPath() %>/goods/addExcelDrug.action",
                                {"filePath":filePath},
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
            }
        });
        initFileExcelInput();
        queryList();
    }
</script>
</html>
