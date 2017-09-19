<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ page import="java.util.*"%>
<%@ page import="com.fav.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.add.model.*"%>
<!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>Information Page</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		<link rel="stylesheet" type="text/css" href="../css/base.css">
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		
	</head>
		<style type="text/css">
			.page-header.order-page {
				margin-top: 0;
				margin-bottom: 20px;
				font-size: 24px;
			}
			form.search,
			.input-group-sm {
				line-height: 2;
				display: flex;
			}
			span.middle,
			span.divider {
				margin-left: 8px;
				margin-right: 8px;
				vertical-align: middle;
			}
			th {
				font-size: 16px;
				max-width: 100%;
				white-space:nowrap;
			}
			td {
				font-size: 14px;
				max-width: 100%;
				white-space:nowrap;
			}
			caption {
				font-size: large;
				text-align: center;
				color: #777;
			}
			.input-sm {
				border: 2px solid #ccc;
				border-top-right-radius: 0;
				border-bottom-right-radius: 0;
			}
			button.btn.btn-query.btn-sm {
				border-top-left-radius: 0;
				border-bottom-left-radius: 0;
				color: #fff;
				font-size: 14px;
			}
			.pagination>li>a {
				color: #34495E;
				font-size: 18px;
			}
			.pagination>li>a:focus {
				color: #fff;
				background-color: #888;
				border-color: #888;
			}
			.pager>li>a {
				color: #34495E;
				font-size: 18px;
			}
			.pager>li>a:focus {
				color: #fff;
				background-color: #888;
				border-color: #888;
			}
			.btn {
					font-size: 15px;
					text-align: right;
					padding: 3px;
                 }
            .margintt{
            	margin: 5px 
            }     
		</style>
	<body>
<!-- header======================================= -->	
		<div class="page-header center-header">
		  <span>食在方便<small>店家中心</small></span>
		</div>

<!-- navbar======================================= -->
		<nav class="navbar center-navbar navbar-inverse" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
						<span class="sr-only">選單切換</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="str_profile01.html">百花窯</a>
				</div>
				
		<!-- 手機隱藏選單區=======================================-->
				<div class="collapse navbar-collapse navbar-ex1-collapse">
			<!-- 左選單 =======================================-->
					<ul class="nav navbar-nav">
						<li><a href="str_center.html">店家中心</a></li>
						<li><a href="str_dish.html">菜單專區</a></li>
						<li><a href="str_order.html">訂單專區</a></li>
						<li><a href="str_inform.html">個人訊息</a></li>
						<li><a href="str_advertise.html">廣告專區</a></li>
						<li class="active"><a href="str_bonus.html">優惠專區</a></li>
					</ul>
				
			<!-- 右選單 =======================================-->
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">百花窯 您好<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="str_profile01.html">店家資料</a></li>
								<li><a href="str_order.html">訂單查詢</a></li>
								<li><a href="str_inform.html">個人訊息</a></li>
							</ul>
						</li>
						<li><a href='#modal-id' data-toggle="modal">登出</a></li>
					</ul>
				</div>
		<!-- 手機隱藏選單區結束 =======================================-->
			</div>
		</nav>

<!-- modal登出視窗 =======================================-->
		<div class="modal fade" id="modal-id">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">確定登出</h4>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary btn-success" data-dismiss="modal">關閉</button>
					</div>
				</div>
			</div>
		</div>
		
<!-- breadcrumb 麵包屑 =======================================-->
		<ol class="breadcrumb">
			<li>
				<a href="../index.html">首頁</a>
			</li>
			<li>
				<a href="str_center.html">店家中心</a>
			</li>
			<li class="active">優惠專區</li>
		</ol>


<!-- container 內文開始 =======================================-->
<div class="container">
	<div class="row">
<!-- 左邊開始 =======================================-->
		<div class="col-xs-12 col-sm-3">
			<div class="list-group">
				<a href="#" class="list-group-item list-group-custom active">促銷優惠</a>
				<a href="#" class="list-group-item ">促銷專區總覽</a>
				<a href="#" class="list-group-item list-group-item-info">促銷活動申請</a>
				
			</div>
		</div>


<!-- 右邊開始 =======================================-->			
		<div class="col-xs-12 col-sm-9" >
			

			<div class="page-header order-page">優惠上架</div>
			<div class="toolbar">
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/pro/proin.do" >
				<div class="margintt"><td>開始日期:</td>
					<input type="date" name="datestr" id="bookdate" value="2014-09-09" min="2017-09-09" max="2020-09-18">
				</div>
				<div class="margintt"><td>結束日期:</td>
					<input type="date" name="dateend" id="bookdate" value="2014-09-09" min="2017-09-09" max="2020-09-18"><br>
				</div>
					
				<div class="margintt">優惠種類:
					<select name="month" class="select-sm" >
						<option value="1">金額</option>
						<option value="2">類別</option>
						
					</select></div>
				<div class="margintt">
					條件:<input type="text" name="">
				</div>	
				<div class="margintt">
					折扣:<input type="text" name="">
					</div>	
				<td><button type="button" class="btn btn-info margintt">上架</button></td>

			</FORM>
			</div>
		
		</div>

	</div>
</div>



		
		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>