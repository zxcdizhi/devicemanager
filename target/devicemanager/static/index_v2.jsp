<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--360浏览器优先以webkit内核解析-->


    <title> - 主页示例</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/clock/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/css/calendar.css">
    <link rel="shortcut icon" href="favicon.ico"> <link href="${ctx}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="${ctx}/static/css/animate.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=4.1.0" rel="stylesheet">
	<style type="text/css">
    	.rightBar{ width:32%; height:100%;  float:right; margin-top:20px;}
    	table{ margin-top:20px;}
    </style>
</head>
<body class="gray-bg">             
    <div class="rightBar">
    	 <div id="time">
                <div id="clock" class="light">
                    <div class="display">
                        <div class="weekdays"></div>
                        <div class="ampm"></div>
                        <div class="alarm"></div>
                        <div class="digits"></div>
                    </div>
                </div>        
        </div>             
        <div id="date">
        	<div id="calendar" class="calendar"></div>     
        </div>		
    </div>  
	
	<!-- 全局js -->
    <script src="${ctx}/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
    <!-- Flot -->
    <script src="${ctx}/static/js/plugins/flot/jquery.flot.js"></script>
    <script src="${ctx}/static/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="${ctx}/static/js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="${ctx}/static/js/plugins/flot/jquery.flot.pie.js"></script>
    <!-- 日历 -->
    <script src="${ctx}/static/js/calendar.js"></script>
    <!--时间-->
    <script src="${ctx}/static/js/clock/html5.js"></script>
    <script src="${ctx}/static/js/clock/moment.min.js"></script>
    <script src="${ctx}/static/js/clock/script.js"></script>
    <!-- 自定义js -->
    <script src="${ctx}/static/js/content.js"></script>
    
     <!--flotdemo-->
    <script type="text/javascript">
        $(function() {
            var container = $("#flot-line-chart-moving");
            var maximum = container.outerWidth() / 2 || 300;
            var data = [];

            function getRandomData() {
                if (data.length) {
                    data = data.slice(1);
                }
                while (data.length < maximum) {
                    var previous = data.length ? data[data.length - 1] : 50;
                    var y = previous + Math.random() * 10 - 5;
                    data.push(y < 0 ? 0 : y > 100 ? 100 : y);
                }
                var res = [];
                for (var i = 0; i < data.length; ++i) {
                    res.push([i, data[i]])
                }
                return res;
            }
            series = [{
                data: getRandomData(),
                lines: {
                    fill: true
                }
            }];
            var plot = $.plot(container, series, {
                grid: {

                    color: "#999999",
                    tickColor: "#f7f9fb",
                    borderWidth:0,
                    minBorderMargin: 20,
                    labelMargin: 10,
                    backgroundColor: {
                        colors: ["#ffffff", "#ffffff"]
                    },
                    margin: {
                        top: 8,
                        bottom: 20,
                        left: 20
                    },
                    markings: function(axes) {
                        var markings = [];
                        var xaxis = axes.xaxis;
                        for (var x = Math.floor(xaxis.min); x < xaxis.max; x += xaxis.tickSize * 2) {
                            markings.push({
                                xaxis: {
                                    from: x,
                                    to: x + xaxis.tickSize
                                },
                                color: "#fff"
                            });
                        }
                        return markings;
                    }
                },
                colors: ["#4fc5ea"],
                xaxis: {
                    tickFormatter: function() {
                        return "";
                    }
                },
                yaxis: {
                    min: 0,
                    max: 110
                },
                legend: {
                    show: true
                }
            });

            // Update the random dataset at 25FPS for a smoothly-animating chart

            setInterval(function updateRandom() {
                series[0].data = getRandomData();
                plot.setData(series);
                plot.draw();
            }, 40);
        });
        $(function() {
            

            function euroFormatter(v, axis) {
                return "&yen;"+v.toFixed(axis.tickDecimals);
            }

            function doPlot(position) {
                $.plot($("#yesterday"), [{
                    data: oilprices,
                    label: "老玩家"
                }, {
                    data: exchangerates,
                    label: "新玩家",
                    yaxis: 2
                }], {
                    xaxes: [{
                        mode: 'time'
                    }],
                    yaxes: [{
                        min: 0
                    }, {
                        alignTicksWithAxis: position == "right" ? 1 : null,
                        position: position,
                        tickFormatter: euroFormatter
                    }],
                    legend: {
                        position: 'sw'
                    },
                    colors: ["#f7f9fb"],
                    grid: {
                        color: "#999999",
                        hoverable: true,
                        clickable: true,
                        tickColor: "#f7f9fb",
                        borderWidth:0,
                        hoverable: true 

                    },
                    tooltip: true,
                    tooltipOpts: {
                        content: "%s %x 为 %y",
                        xDateFormat: "%y-%0m-%0d",

                        onHover: function(flotItem, $tooltipEl) {
                            // console.log(flotItem, $tooltipEl);
                        }
                    }
                });
    }

    doPlot("right");

    $("button").click(function() {
        doPlot($(this).text());
    });
});
    </script>
</body>

</html>
</body>
</html>