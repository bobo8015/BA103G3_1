<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ page import="java.util.*"%>
<%@ page import="com.fav.model.*"%>

<%
	String mem_no = (String) session.getAttribute("mem_no");	
	
	if(mem_no == null){
		session.setAttribute("mem_no", "MEM_0006");		
		mem_no = (String) session.getAttribute("mem_no");		
	}
%>

<!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>食在方便</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="short Icon" type="images/x-icon" href="../../images/logo.png">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/search/css/search.css">
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
<script type="text/javascript"
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyARIsuM7Be0Gmf9mxeQ5R3uuE9WCzcC1L8">
</script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

    <script src="js/search.js"></script>
	</head>
	<body>


	<!--導覽列==========================================================================-->
<header>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <a href="../../index.html" class="navbar-brand" href="#" id="navbar-title"><img src="../../images/logo.png" width="30px" id="imgTop" class="pull-left"><b>食在方便</b></a>
    </div>
    <ul class="nav navbar-nav">
            <li><a href="search.html" style="background-color:#C63300;border-color: #C63300;">搜尋店家</a></li>
            <li><a href="../blog/blog.html">美食日記</a></li>
            <li><a href="../rank/rank.html">排行榜</a></li>
            <li><a href="#">便當盒</a></li>
            <li><a href="../member/member.html">會員專區</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
           <li><a href="../../class/member/login.html"><span class="glyphicon glyphicon-user"></span><b> 會員登入</b></a></li>
           <li><a href="../../class/store/str_login.html"><span class="glyphicon glyphicon-home"></span><b> 店家登入</b></a></li>
    </ul>      
    
 </div>
</nav>
</header>


<div class="container">

 <!--第一列===================================================================-->
  <div class="row firstRow">

    <form class="form-horizontal">
    <div class="col-xs-12 col-sm-3">
      <div>

          <label class="control-label" for="address">
            <span class="glyphicon glyphicon-globe"></span> 依地址:
            </label>

            <div>
              <input class="form-control " type="text" name="address" id="address" value= "台北市" size="50">              
            </div>
      </div>
      <br>
      <div>
            <label class="control-label">
            <span class="glyphicon glyphicon-cutlery"></span> 依取餐方式:
            </label>
            <br>
            <input type="radio" name="type" checked="" value="">自取　
            <input type="radio" name="type" value="">外送
      </div>
    </div>

    <div class="col-xs-12 col-sm-3">
      <div>
            <label class="checkbox">
            <span class="glyphicon glyphicon-home"></span> 依店家類別:
            </label>

            <input type="checkbox" name="store_style" value="">中式　　
            <input type="checkbox" name="store_style" value="">西式<br>
            <input type="checkbox" name="store_style" value="">義式　　
            <input type="checkbox" name="store_style" value="">泰式<br>
            <input type="checkbox" name="store_style" value="">法式　　
            <input type="checkbox" name="store_style" value="">越式<br>
            
      </div>
    </div>

    <div class="col-xs-12 col-sm-3">
      <div>
            <label class="control-label" >
            <span class=" glyphicon glyphicon-usd" ></span> 依菜單價錢:
            </label>
            <br>
            <input type="radio" name="price_range" value="">$150以下<br>
            <input type="radio" name="price_range" value="">$150~500<br>
            <input type="radio" name="price_range" value="">$500~1000<br>
            <input type="radio" name="price_range" value="">$1000以上<br>

      </div>
    </div>

    <div class="col-xs-12 col-sm-3">
      <div>
            <label class="control-label" for="keyWord">
            <span class=" glyphicon glyphicon-search"></span> 依關鍵字:
            </label>

            <div>
              <input class="form-control" type="text" name="keyWord" id="keyWord" value= "" placeholder="輸入美食關鍵字" >
            </div>
            <br>

           <input type="button" value="查詢" onClick="codeAddress()" class="btn btn-success btn-lg" role="button"> 
<!--             <a href="search.html" class="btn btn-success btn-lg" role="button"><b>查詢</b></a> -->

      </div>
      </form>
    </div>

  </div>

 <!--第二列===================================================================-->
  
  <div class="row">

    <div class="col-xs-12 col-sm-6   map" id="map-canvas" style="width: 50%; height: 600px">
<!--     <img src="images/map.png" width=100%> -->
    
    </div>


    <div class="col-xs-12 col-sm-6   store" >
     <!--  經度 -->
      <input id="lat" type="text" value=""> 
     <!-- 緯度 -->
      <input id="lng" type="text"  value="">

      <div class="store_select">

        <img src="../../images/index/food/food1.jpg" width="110px" align="left" class="store_img">
        
        <div>
        <h4><b>店家1</b></h4>
        (02)1234-5678<br>
        台北市XX區XX巷XX號
        </div>

        <div class="store_introduce">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
          tempor incididunt ut labore et dolore
        </div>

         <div align="right">
         
         	<a href=<%=request.getContextPath()%>/fav/infav.do?mem_no=${mem_no}&str_no=STR_0001&action=insert_For_Fav >
         	<img src="<%=request.getContextPath()%>/search/images/heart/white.png" id="heart" title="加入最愛"></a>
           <a href="search_store.html" class="btn btn-danger" role="button">進入店家</a>
           <a href="search_store_menu.html" class="btn btn-danger" role="button">我要訂餐</a>
         </div>
      </div>

      <div class="store_select">
        <img src="../../images/index/food/food2.jpg" width="110px" align="left" class="store_img">
        
        <div>
        <h4><b>店家2</b></h4>
        (02)1234-5678<br>
        台北市XX區XX巷XX號
        </div>

        <div class="store_introduce">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
          tempor incididunt ut labore et dolore
        </div>

         <div align="right">
           <a href=http://localhost:8081<%=request.getContextPath()%>/fav/infav.do?mem_no=${mem_no}&str_no=STR_0008&action=insert_For_Fav >
         		<img src="<%=request.getContextPath()%>/search/images/heart/white.png" id="heart" title="加入最愛"></a>　　
           <a href="search_store.html" class="btn btn-danger" role="button">進入店家</a>
           <a href="search_store_menu.html" class="btn btn-danger" role="button">我要訂餐</a>
         </div>
      </div>

      <div class="store_select">
        <img src="../../images/index/food/food3.jpg" width="110px" align="left" class="store_img">
        
        <div>
        <h4><b>店家3</b></h4>
        (02)1234-5678<br>
        台北市XX區XX巷XX號
        </div>

        <div class="store_introduce">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
          tempor incididunt ut labore et dolore
        </div>

         <div align="right">
           <a href=<%=request.getContextPath()%>/fav/infav.do?mem_no=${mem_no}&str_no=STR_0010&action=insert_For_Fav >
         		<img src="<%=request.getContextPath()%>/search/images/heart/white.png" id="heart" title="加入最愛"></a>　　
           <a href="search_store.html" class="btn btn-danger" role="button">進入店家</a>
           <a href="search_store_menu.html" class="btn btn-danger" role="button">我要訂餐</a>
         </div>
      </div>

      <div class="store_select">
        <img src="../../images/index/food/food4.jpg" width="110px" align="left" class="store_img">
        
        <div>
        <h4><b>店家4</b></h4>
        (02)1234-5678<br>
        台北市XX區XX巷XX號
        </div>

        <div class="store_introduce">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
          tempor incididunt ut labore et dolore
        </div>

         <div align="right">
           <a href=<%=request.getContextPath()%>/fav/infav.do?mem_no=${mem_no}&str_no=STR_0011&action=insert_For_Fav >
         		<img src="<%=request.getContextPath()%>/search/images/heart/white.png" id="heart" title="加入最愛"></a>
           <a href="search_store.html" class="btn btn-danger" role="button">進入店家</a>
           <a href="search_store_menu.html" class="btn btn-danger" role="button">我要訂餐</a>
         </div>
      </div>
      <div class="store_select">
        <img src="../../images/index/food/food5.jpg" width="110px" align="left" class="store_img">
        
        <div>
        <h4><b>店家5</b></h4>
        (02)1234-5678<br>
        台北市XX區XX巷XX號
        </div>

        <div class="store_introduce">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
          tempor incididunt ut labore et dolore
        </div>

         <div align="right">
           <a href=<%=request.getContextPath()%>/fav/infav.do?mem_no=${mem_no}&str_no=STR_0012&action=insert_For_Fav >
         <img src="<%=request.getContextPath()%>/search/images/heart/white.png" id="heart" title="加入最愛"></a>　　
           <a href="search_store.html" class="btn btn-danger" role="button">進入店家</a>
           <a href="search_store_menu.html" class="btn btn-danger" role="button">我要訂餐</a>
         </div>
      </div>
     

    </div>
  </div>





<!--底部平台介紹================================================================-->
</div>

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

	</body>
</html>