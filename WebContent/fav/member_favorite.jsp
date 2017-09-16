<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ page import="java.util.*"%>
<%@ page import="com.fav.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.add.model.*"%>

<%
	String mem_no = (String) session.getAttribute("mem_no");	
	
	if(mem_no == null){
		session.setAttribute("mem_no", "MEM_0006");		
		mem_no = (String) session.getAttribute("mem_no");		
	}

    FavService favSvc = new FavService();   
    List<FavVO> list = favSvc.getoneFav(mem_no);
    pageContext.setAttribute("list",list); 
    
    
//     strService strSvc = new strService();    
// 	List<StrVO> list2 = strSvc.getAll();
//     pageContext.setAttribute("list2",list2);     
%>	
	<jsp:useBean id="storeSvc" scope="page" class="com.store.model.strService" />
	
	
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>食在方便</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="short Icon" type="images/x-icon" href="images/logo.jpg">
   	<link rel="stylesheet" href="css/member.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/favorite.css">
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
    <link rel="short Icon" type="images/x-icon" href="../../images/logo.png">
    <link rel="stylesheet" href="../../css/base.css">
    <style type="text/css">
 
      ol{
    margin-top: 50px;
    margin-bottom: 10px;
	}
    </style>

	</head>
	<body>


	<!--導覽列===============================================================================-->
<header>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <a href="../../index.html" class="navbar-brand" href="#" id="navbar-title"><img src="../../images/logo.png" width="30px" id="imgTop" class="pull-left"><b>食在方便</b></a>
    </div>
    <ul class="nav navbar-nav">
            <li><a href="../search/search.html" >搜尋店家</a></li>
            <li><a href="../blog/blog.html" >美食日記</a></li>
            <li><a href="../rank/rank.html" >排行榜</a></li>
            <li><a href="#">便當盒</a></li>
            <li><a href="../member/member.html" style="background-color:#C63300;border-color: #C63300;">會員專區</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
           <li><a href="login.html"><span class="glyphicon glyphicon-user"></span><b> 會員登入</b></a></li>
           <li><a href="../../class/store/str_login.html"><span class="glyphicon glyphicon-home"></span><b> 店家登入</b></a></li>
    </ul>     
    
 </div>
</nav>
</header>
<!--第一列===================================================================================-->
<div class="87a">
	<ol class="breadcrumb">
	  <li>
	    <a href="index.html">首頁</a>
	  </li>
	  <li class="active">
	    <a href="#">會員中心</a>
	  </li>
	  <li class="active">
	    <a href="#">最愛店家</a>
	  </li>
	
	</ol>
</div>
<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-3">
			<table class="table table-hover table-bordered" style='word-break: keep-all'>
		        <thead></thead>
		        <tbody><ul>
		          <tr><td class="list first"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;會員訂單</td></tr>
		          <tr><td class="list"><span class="glyphicon glyphicon-user list"> </span>&nbsp;&nbsp;會員資料</td align="center"></tr>
		          <tr><td class="list"><span class="glyphicon glyphicon-map-marker list"> </span>&nbsp;&nbsp;會員地址</td></tr>
		          <tr><td class="list"><span class="glyphicon glyphicon-heart list"> </span>&nbsp;&nbsp;最愛店家</td>
              <tr><td class="list"><i class="fa fa-file-text" style="font-size:16px"></i>&nbsp;&nbsp;美食日記</td>
        		</tbody></ul>
    		</table>
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
              <!-- Indicators -->
              <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
              </ol>
              <h4 class="text-center"><b>店家美食廣告</b></h4>
              <!-- Wrapper for slides -->
              <div class="carousel-inner">
                <div class="item active">
                  <img src="images/P01.jpg" alt="one"  width="570" height="200">
                </div>
  
                <div class="item">
                  <img src="images/P02.jpg" alt="two" width="570" height="200">
                </div>
  
                <div class="item">
                  <img src="images/P03.jpg" alt="three"  width="570" height="200">
                </div>
              </div>
  
              <!-- Left and right controls -->
              <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
		</div>

		<div class="col-xs-12 col-sm-6">
		<div role="tabpanel">
          <!-- 標籤面板：標籤區 -->
          <ul class="nav nav-tabs" role="tablist">
              <li role="presentation" class="active">
                  <a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab" class=toplove>最愛店家</a>
              </li>             
          </ul>
      
          <!-- 標籤面板：內容區 -->
          <div class="tab-content">
			 
			         
          	<div role="tabpanel" class="tab-pane active" id="tab1">
          	
              <c:forEach var="favVO" items="${list}">    
                	<div class="fatable"> <img class="abc" src="images/bobo_image/4_4.jpg">
                		<c:forEach var="strVO" items="${storeSvc.all}">	
                			<c:if test="${favVO.str_no==strVO.str_no}"> 
                			${strVO.str_name} 
                			
                			${strVO.str_img}
                			</c:if>
                		</c:forEach> 	
	                  	<div style="float:right;">
	                  	
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/fav/fav.do">
						    <input type="submit" class="btn btn-danger btn-tb" value="移除">    		
						    <input type="hidden" name="mem_no" value="${mem_no}">
						    <input type="hidden" name="str_no" value="${favVO.str_no}">
						    <input type="hidden" name="action"value="delete_For_Fav"></FORM>
	                  	</div>
                  	</div>
              </c:forEach> 
              
               
                </div>
                 
			</div>
              
          </div>
      </div>	
		


		<div class="col-xs-12 col-sm-3 ">
			<div class="panel panel-default shoppingCart">
        <div class="panel-heading">
          <h3 class="panel-title"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;便當盒</h3>
        </div>
      
        <ul class="list-group">
          <li class="list-group-item">清單項目一
          <div class="input-group">
          <span class="input-group-btn">
              <button type="button" class="btn btn-default btn-number btn-minuse"  data-type="minus" data-field="quant[2]">
                <span class="glyphicon glyphicon-minus"></span>
              </button>
          </span>
          <input type="text" name="quant[2]" class="form-control input-number text-center" value="1" min="1" max="100" size="1">
          <span class="input-group-btn">
              <button type="button" class="btn btn-default btn-number btn-pluss" data-type="plus" data-field="quant[2]">
                  <span class="glyphicon glyphicon-plus"></span>
              </button>
          </span>
      </div>
          </li>
          <li class="list-group-item">清單項目二
          <div class="input-group">
          <span class="input-group-btn">
              <button type="button" class="btn btn-default btn-number btn-minuse"  data-type="minus" data-field="quant[2]">
                <span class="glyphicon glyphicon-minus"></span>
              </button>
          </span>
          <input type="text" name="quant[2]" class="form-control input-number text-center" value="1" min="1" max="100" size="1">
          <span class="input-group-btn">
              <button type="button" class="btn btn-default btn-number btn-pluss" data-type="plus" data-field="quant[2]">
                  <span class="glyphicon glyphicon-plus"></span>
              </button>
          </span>
      </div></li>
          <li class="list-group-item">清單項目三
          <div class="input-group">
          <span class="input-group-btn">
              <button type="button" class="btn btn-default btn-number btn-minuse"  data-type="minus" data-field="quant[2]">
                <span class="glyphicon glyphicon-minus"></span>
              </button>
          </span>
          <input type="text" name="quant[2]" class="form-control input-number text-center" value="1" min="1" max="100" size="1">
          <span class="input-group-btn">
              <button type="button" class="btn btn-default btn-number btn-pluss" data-type="plus" data-field="quant[2]">
                  <span class="glyphicon glyphicon-plus"></span>
              </button>
          </span>
      </div></li>
          <li class="list-group-item text-left">總金額<h2 class="text-right">$299</h2></li>
          <li class="list-group-item"><input type="submit"  class="btn btn-success btn-block" value="結帳"></li>
        </ul>
      </div>
      		

		</div>
	</div>
</div>


<!--底部平台介紹==============================================================================-->
    <footer >
      <div class="container">
        <div class="col-sm-2">
          <img src="../../images/logo.png" class="img-responsive">
        </div>
        <div class="col-sm-2">
          <h5>公司</h5>
          <ul class="list-unstyled">
            <li><a href="#">文件資料</a></li>
            <li><a href="#">Packt出版社</a></li>
            <li><a href="#">關於我們</a></li>
            <li><a href="#">聯絡資訊</a></li>
          </ul>
        </div>
        <div class="col-sm-2">
          <h5>社群</h5>
          <ul class="list-unstyled">
            <li><a href="#">Facebook</a></li>
            <li><a href="#">Twitter</a></li>
            <li><a href="#">部落格</a></li>
          </ul>
        </div>
        <div class="col-sm-2">
          <h5>客戶支援</h5>
          <ul class="list-unstyled">
            <li><a href="#">聯絡資訊</a></li>
            <li><a href="#">隱私政策</a></li>
            <li><a href="#">條款與細則</a></li>
            <li><a href="#">服務台</a></li>
          </ul>
        </div>
        <div class="col-sm-4">
          <address>
            <strong>食在方便有限公司</strong>
            地址第 1 行<br>
			地址第 2 行<br>
            <abbr title="Phone">TEL：</abbr> (02) 1234-5678
          </address>
        </div>
      </div>
    </footer>
		
		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    $(function(){

      var navbarTop = $('.shoppingCart').offset().top;
      
      $('.shoppingCart').affix({
        offset:{
          top: navbarTop         
        }
      })
    })
    $('.btn-minuse').on('click', function(){            $(this).parent().siblings('input').val(parseInt($(this).parent().siblings('input').val()) - 1)
})

$('.btn-pluss').on('click', function(){            $(this).parent().siblings('input').val(parseInt($(this).parent().siblings('input').val()) + 1)
})
    </script>
	</body>
</html>