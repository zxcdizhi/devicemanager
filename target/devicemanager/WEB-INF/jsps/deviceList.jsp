<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>


<!-- https://www.cnblogs.com/MonaSong/p/5109991.html jqGrid文档 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>- 设备列表</title>
<meta name="keywords" content="">
<meta name="description" content="">

<link rel="shortcut icon" href="${ctx}/static/favicon.ico">
<link href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"
	rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">

<!-- jqgrid-->
<link href="${ctx}/static/css/plugins/jqgrid/ui.jqgrid.css?0820"
	rel="stylesheet">

<link href="${ctx}/static/css/animate.css" rel="stylesheet">
<link href="${ctx}/static/css/style.css?v=4.1.0" rel="stylesheet">

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
						<h5>设备列表</h5>
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
	<script src="http://code.jquery.com/jquery-migrate-1.1.1.js"></script>
	<script src="${ctx}/static/js/plugins/layer/laydate/laydate.js"></script>

	<!-- Peity -->
	<script src="${ctx}/static/js/plugins/peity/jquery.peity.min.js"></script>

	<!-- jqGrid -->
	<script
		src="${ctx}/static/js/plugins/jqgrid/i18n/grid.locale-cn.js?0820"></script>
	<script src="${ctx}/static/js/plugins/jqgrid/jquery.jqGrid.min.js?0820"></script>

	<!-- 自定义js -->
	<script src="${ctx}/static/js/content.js?v=1.0.0"></script>

	<!-- Page-Level Scripts -->
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
    			url:"${ctx}/device/deviceList",
    			datatype:"json",
    			height: 350,
                autowidth: true,
                shrinkToFit:true,
                rownumbers:true,
                rowNum: 10,//每页显示记录条数
                sortname:"invid",
                sortorder:"desc",
                viewrecords: true,
                emptyrecords:"没有符合记录的数据!",
                autoencode:true,
                colNames:['序号','设备名称','鉴定日期','设备类型','设备状态'],
                colModel: [
                	{
                    	key:true, 
                    	name: 'did',
                    	index: 'did',
                    	editable: true,
                    	width: 60, 
                    	sorttype: "int",
                    	search: true
                    },
                    {
                    	name: 'dname',
                    	index: 'dname',
                    	editable: true, 
                    	width: 90, 
                    	sortable:false
                    },
                    {
                    	name: 'dtime',
                    	index: 'dtime', 
                    	editable: true,
                    	formatoptions: {srcformat:'YYYY-MM-DD',newformat:'YYYY-MM-DD'},
                    	formatter:function(cellvalue, options, row){
                    		var fdate = new Date(cellvalue).toLocaleString();
                    		return fdate.substring(0,9);
                    	},
                    	editoptions: {dataEvents: [{ type: 'focus', fn: function (e) { laydate({istime: true, format: 'YYYY-MM-DD'}) } }] } ,
                        width: 100
                    },					
                    {
                    	name: 'dtype',
                        index: 'dtype',
                        editable: true,
						edittype:'select',
						editoptions: { value: '00:请选择; 1:主件; 2:辅件'},	
						formatter:function(cellvalue){
							if(cellvalue==1){
								return '主件';
							}
							if(cellvalue==2){
								return '辅件';
							}
						},
						multiselectWidth:80,
                        width: 80
                    },
                    {
                    	name: 'dstate',
                        index: 'dstate',
                        editable: true,
						edittype:'select',
						editoptions: { value: " 0:请选择; 1:已归还; 2:使用中; 3:损坏" },			
						formatter:function(cellvalue){
							if(cellvalue==1){
								return '已归还';
							}
							if(cellvalue==2){
								return '使用中';
							}
							if(cellvalue==3){
								return '损坏';
							}
						},
						required:true,
                        width: 80
                    }
                ],
                pager: "#pager_list_2",
                caption: "全部设备",
                add: true,
                edit: true,
                addtext: 'Add',
                edittext: 'Edit',
                editurl:'${ctx}/device/deviceEdit'
    		});
    		
            //按条件查询的按钮的id
    		<!--$("fbox_table_list_2_search")-->
    		
    		$("#table_list_2").jqGrid('navGrid', '#pager_list_2', {edit: true,add: true,del: true,search: true}, {
                height: 200,
                reloadAfterSubmit: true
            });
            
            // Add selection
            $("#table_list_2").setSelection(4, true);


            // Add responsive to jqGrid
            $(window).bind('resize', function () {
                var width = $('.jqGrid_wrapper').width();
                $('#table_list_1').setGridWidth(width);
                $('#table_list_2').setGridWidth(width);
            });
        });
        
    </script>




</body>

</html>
