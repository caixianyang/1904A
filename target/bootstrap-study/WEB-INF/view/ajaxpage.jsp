<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${page.pageNum != 1}">
 <input type="button" onclick="queryList(1)" value="首页">
 <input type="button" onclick="queryList(${page.pageNum-1})" value="上一页">
</c:if>



<c:if test="${page.totalCount > 0 && page.pageNum != page.totalPage }">
 <input type="button" onclick="queryList(${page.pageNum+1})" value="下一页">
 <input type="button" onclick="queryList(${page.totalPage})" value="尾页">
</c:if>

当前为${page.pageNum}/${page.totalPage}
共${page.totalCount}条数据
<select onchange="selectPageSize(this.value)">
  <option value="5" ${page.pageSize=="5"?"selected":""}>每页展示5条</option>
  <option value="10" ${page.pageSize=="10"?"selected":""}>每页展示10条</option>
  <option value="20" ${page.pageSize=="20"?"selected":""}>每页展示20条</option>
  <option value="50" ${page.pageSize=="50"?"selected":""}>每页展示50条</option>

</select>
跳转到第<input type="text" id="startPage" value="${page.pageNum }"/>页<input type="button" onclick="goPage()" value="跳转"/>
<script type="text/javascript">
      
    function selectPageSize(pageSize) {
    	pageSize = pageSize;
    	queryList(1);
    }
    
   function goPage(){
	   var startPage = $("#startPage").val();
	   var totalPage = ${page.totalPage};
	   var tes = /^\d+$/;
	   if(tes.test(startPage)){
		   if(startPage>0 && startPage <=totalPage){
			   queryList(startPage);
		   }else{
			   alert("请输入合法数据！！！");  
		   }
		   
	   }else{
		   alert("请输入合法数据！！！");
	   }
		   
   } 
</script>
