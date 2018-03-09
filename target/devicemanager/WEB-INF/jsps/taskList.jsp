<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 任务列表</title>
    <link rel="shortcut icon" href="${ctx}/static/favicon.ico"> <link href="${ctx}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- jqgrid-->
    <link href="${ctx}/static/css/plugins/jqgrid/ui.jqgrid.css" rel="stylesheet">

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
<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>任务列表</h5>
                       
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
	
    <script src="${ctx}/static/js/plugins/layer/laydate/laydate.js"></script>
    <!--多选下拉框js-->
	<script type="text/javascript" src="${ctx}/static/js/bootstrap-multiselect.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			var bobj = document.getElementById("jltime");
			
		});
    </script>
    
    
    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function () {

            $.jgrid.defaults.styleUI = 'Bootstrap';
            // Examle data for jqGrid
            var mydata = [
                {
                    id: "1",     
					ttitle:"地下电力管线",				
					instrumentG:"套装1",
					instrumentD: "罗盘",               
                    groupLeader: "张三",
					crew:"李四 王五",
					jltime: "2018-01-24",                    
                    address: "北京市大兴区庞各庄镇",
                    car: "京N5ZU68"
                },{
                    id: "2",          
					ttitle:"地下电力管线",					
					instrumentG:"套装2",
					instrumentD: "相机",          
                    groupLeader: "牛牛",
					crew:"李四 王五",
					jltime: "2018-01-24",                    
                    address: "北京市大兴区庞各庄镇",
                    car: "京N5ZU68"
                },{
                    id: "3",     
					ttitle:"地下电力管线",					
					instrumentG:"套装3",
					instrumentD: "地质锤",               
                    groupLeader: "huahua",
					crew:"李四 王五",
					jltime: "2018-01-24",                    
                    address: "北京市大兴区庞各庄镇",
                    car: "京N5ZU68"
                },{
                    id: "4",  
					ttitle:"地下电力管线",
					instrumentG:"套装4",
					instrumentD: "相机",                  
                    groupLeader: "赵四",
					crew:"李四 王五",
					jltime: "2018-01-24",                    
                    address: "北京市大兴区庞各庄镇",
                    car: "京N5ZU68"
                },{
                    id: "5",   
					ttitle:"地下电力管线",
					instrumentG:"套装5",
					instrumentD: "罗盘",                 
                    groupLeader: "赵迪",
					crew:"李四 王五",
					jltime: "2018-01-24",                    
                    address: "北京市大兴区庞各庄镇",
                    car: "京N5ZU68"
                }
            ];


            // 全部显示的列
            $("#table_list_2").jqGrid({
				url:'data.json',
                data: mydata,
                datatype: "local",
                height: 350,
                autowidth: true,
                shrinkToFit: true,
                rowNum: 20,
                rowList: [10, 20, 30],
                colNames:['序号','任务标题', '套装' ,'工具','组长', '组员', '时间' , '地点', '车辆' ],
                colModel: [
                    {
                        name: 'id',
                        index: 'id',
                        width: 60,
                        sorttype: "int",
                        search: true
                    },
					{
                        name: 'ttitle',
                        index: 'ttitle',
                        editable: true,						
						editoptions: {required:true,dataEvents: [{ type: 'focus', fn: function (e) { checkTitle() } }] } ,
                        width: 90
                    },
					{
                        name: 'instrumentG',
                        index: 'instrumentG',
                        editable: true,	
						edittype:'select',               			
						multiselect:true,
						multiple:'multiple',
						editoptions: {dataEvents: [{ type: 'function', fn: function (e) { multiselect() } }],value: "ER:请选择; FE:套装1; IN:套装2; TN:套装3; TP:套装4; TO:套装5" } ,					
                        width: 100                        
                    },
					{
                        name: 'instrumentD',
                        index: 'instrumentD',
                        editable: true,	
						edittype:'select',               			
						multiselect:true,
						multiple:'multiple',
						editoptions: {dataEvents: [{ type: 'function', fn: function (e) { multiselect() } }],value: "ER:请选择; FE:相机; IN:罗盘; TN:地质锤" } ,					
                        width: 100                        
                    },
                    {
                        name: 'groupLeader',
                        index: 'groupLeader',
                        editable: true,
						edittype:'select',
						editoptions: { value: "ER:请选择; FE:张三; IN:李四; TN:王五" },						
						required:true,
                        width: 90                     
                    },
                    {
                        name: 'crew',
                        index: 'crew',
                        editable: true,		
						edittype:'select',               			
						multiselect:true,
						multiple:'multiple',
						multiselectWidth:'340px',
						editoptions: { value: "ER:请选择; FE:张三; IN:李四; TN:王五" },																			
                        width: 100
                    },
					{
                        name: 'jltime',
                        index: 'jltime',
						editable: true,
						editoptions: {dataEvents: [{ type: 'focus', fn: function (e) { laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'}) } }] } ,
                        width: 100						
                    },                    
                    {
                        name: 'address',
                        index: 'address',
                        editable: true,
                        width: 120,						
                        sorttype: "float"
                    },
                    {
                        name: 'car',
                        index: 'car',
                        editable: true,
                        width: 80,
                        sorttype: "float"
                    }
                    				
                ],
                pager: "#pager_list_2",
                viewrecords: true,
                caption: "全部任务",
                add: true,
                edit: true,
                addtext: 'Add',
                edittext: 'Edit',
                hidegrid: true	
            });

            // Add selection
            $("#table_list_2").setSelection(4, true);

            // Setup buttons
            $("#table_list_2").jqGrid('navGrid', '#pager_list_2', {
				
                edit: true,
                add: true,
                del: true,
                search: true
            }, {
                height: 200,
                reloadAfterSubmit: true
            });

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