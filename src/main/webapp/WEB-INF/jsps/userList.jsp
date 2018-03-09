<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>- 设备列表</title>
<link rel="shortcut icon" href="${ctx}/static/favicon.ico">
<link href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"
	rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<!-- jqgrid-->
<link href="${ctx}/static/css/plugins/jqgrid/ui.jqgrid.css?0820" rel="stylesheet">
<link href="${ctx}/static/css/animate.css" rel="stylesheet">
<link href="${ctx}/static/css/style.css?v=4.1.0" rel="stylesheet">
<!--复选下拉框-->
<link rel="stylesheet" href="${ctx}/static/css/bootstrap-multiselect.css" type="text/css" />
    
<style>
/* Additional style to fix warning dialog position */
#alertmod_table_list_2 {
	top: 900px !important;
}
</style>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>人员列表</h5>
                    </div>
                    <div class="ibox-content">          
                        <h4 class="m-t"></h4>
                    <div class="jqGrid_wrapper">
                            <table id="table_list_2"></table>
                            <div id="pager_list_2"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<!-- 全局js -->
	<script src="${ctx}/static/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
	<!-- Peity -->
	<script src="${ctx}/static/js/plugins/peity/jquery.peity.min.js"></script>
	<!-- jqGrid -->
	<script src="${ctx}/static/js/plugins/jqgrid/i18n/grid.locale-cn.js?0820"></script>
	<script src="${ctx}/static/js/plugins/jqgrid/jquery.jqGrid.min.js?0820"></script>
	<!-- 自定义js -->
	<script src="${ctx}/static/js/content.js?v=1.0.0"></script>
	<!--多选下拉框js-->
	<script type="text/javascript" src="${ctx}/static/js/bootstrap-multiselect.js"></script>
    
    
    <script>
        $(document).ready(function () {

            $.jgrid.defaults.styleUI = 'Bootstrap';
            $("#table_list_2").jqGrid({
            	jsonReader : {
            		root: "list",    // json中代表实际模型数据的入口
            		page: "pageNum",    // json中代表当前页码的数据
            	    total: "pages",    // json中代表页码总数的数据
            		records: "total", // json中代表数据行总数的数据
            	    repeatitems: false, // 如果设为false，则jqGrid在解析json时，会根据name来搜索对应的数据元素（即可以json中元素可以不按顺序）；而所使用的name是来自于colModel中的name设定。
            	},
            	prmNames: {
                    page: "currentPage"   // 表示请求页码的参数名称
                },
    			url:"${ctx}/user/userList",
    			datatype:"json",
                height: 350,
                autowidth: true,
                shrinkToFit: true,
                rowNum: 10,
                colNames:['序号', '姓名', '密码', '角色'],
                colModel: [
                    {
                        name: 'uid',
                        index: 'uid',
                        sorttype: "int",
                        width: 60,
                        editable:true,
                        key:true,
                        search: true
                    },
                    {
                        name: 'uname',
                        index: 'uname',
                        editable: true,
                        width: 90
                    },
					{
                        name: 'upassword',
                        index: 'upassword',
                        editable: true,
                        width: 90
                    },
                    {
                        name: 'roleId',
                        index: 'roleId',
                        editable: true,
						edittype:'select',               			
                        editoptions: { 
                        	value: getRoleType()
                        },	
						formatter:function(cellvalue){
							if(cellvalue==1){
								return '总经理';
							}
							if(cellvalue==2){
								return '经理';
							}
							if(cellvalue==3){
								return '设备检查员';
							}
						},
                        width: 80
                    }                    
                ],
                pager: "#pager_list_2",
                viewrecords: true,
                caption: "全部员工",
                add: true,
                edit: true,
                addtext: 'Add',
                edittext: 'Edit',
                editurl:'${ctx}/user/userEdit'
            });

            // Add selection
            $("#table_list_2").setSelection(4, true);


            // Setup buttons
            $("#table_list_2").jqGrid('navGrid', '#pager_list_2', {
                edit: true,
                add: true,
                del: true,
                search: true
            },{//修改
                recreateForm: true,
				//checkOnUpdate : true,
				//checkOnSubmit : true,
				beforeSubmit : function( postdata, form , oper) {
					if( confirm('数据已修改，确定保存吗?') ) {
						// do something
						return [true,''];
					} else {
						return [false, '修改失败，请重试!'];
					}
				},
                closeAfterEdit: true,
                errorTextFormat: function (data) {
                    return 'Error: ' + data.responseText
                },
				beforeShowForm:function(frm){
					frm.find('#uid').attr('readOnly',true);//把编辑框中的字段设置为只读的。
				}
             },{//添加方法
            	 closeAfterAdd: true,
                    recreateForm: true,
                    errorTextFormat: function (data) {
                        return 'Error: ' + data.responseText
                 },beforeShowForm:function(frm){
 					frm.find('#uid').attr('readOnly',true);//把编辑框中的字段设置为只读的。
 				}
                
             },{
            	 //删除方法
            	 errorTextFormat: function (data) {
                        return 'Error: ' + data.responseText
                 }
             },{
            	 multipleSearch:true,
            	 beforeSearch: function () {
            		alert("开始搜索之前");
            	 },
            	 afterSearch: function () {
            		alert("搜索之后");
            	 },
            	 searchOnEnter: true  //回车触发搜索
             }
            );

            // Add responsive to jqGrid
            $(window).bind('resize', function () {
                var width = $('.jqGrid_wrapper').width();
                $('#table_list_1').setGridWidth(width);
                $('#table_list_2').setGridWidth(width);
            });
        });
        
        
      //动态生成角色下拉框  
        function getRoleType(){
        	var str="";  
        	$.ajax({  
	        	type:"post",  
	        	async:false,  
	        	url:"${ctx}/role/roleList",  
	        	success:function(data){  
		        	if (data != null) {  
		        	        var jsonobj=eval(data);  
		        	        var length=jsonobj.length;  
		        	        str+="0:请选择;"
		        	        for(var i=0;i<length;i++){  
		        	        	
		        	            if(i!=length-1){  
		        	            	str+=jsonobj[i].rid+":"+jsonobj[i].role+";";  
		        	            }else{  
		        	            	str+=jsonobj[i].rid+":"+jsonobj[i].role;// 这里是option里面的 value:label  
		        	            }  
		        	        }     
		        	}  
        		}  
        	});  
        	return str;  
        } 
    </script>
    
</body>
</html>