function $id(id){
  return document.getElementById(id);
}
//加入收藏 或 取消收藏
function switchFavorite(){
  var heart = $id("heart");
  if( heart.title == "加入最愛"){
    heart.src = "images/heart/red.png";
    heart.title = "取消最愛";
  }else{ //取消收藏
    heart.src = "images/heart/white.png";
    heart.title = "加入最愛";
  }
}



//地圖部份
function initialize() {
  var myAddress=document.getElementById("address").value;

//   var geocoder = new google.maps.Geocoder();
// geocoder.geocode({  "address": myAddress },
// function (result, status) {
//   if (status == google.maps.GeocoderStatus.OK) {

//     var location = result[0].geometry.location;
//     // location.Pa 緯度
//     // location.Qa 經度

//   } else {
//     alert('解析失敗!回傳狀態為：' + status);
//   }
// });


  var mapOptions = {
    zoom: 8,
    center: new google.maps.LatLng(25.037531, 121.5639969)
  };

    var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

  var marker = new google.maps.Marker({
      position: new google.maps.LatLng(25.037531, 121.5639969),
          map: map
      });


 }

function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
      '&signed_in=true&callback=initialize';
  document.body.appendChild(script);

}

  // function codeAddress() {
  //   var address = document.getElementById("address").value;
  //   geocoder.geocode( { 'address': address}, function(results, status) {
  //     if (status == google.maps.GeocoderStatus.OK) {
  //       map.setCenter(results[0].geometry.location);

  //   document.getElementById("lat").value=results[0].geometry.location.lat();
  //   document.getElementById("lng").value=results[0].geometry.location.lng();
  //       var marker = new google.maps.Marker({
  //           map: map,
  //           position: results[0].geometry.location
  //       });

  //   showAddress(results[0], marker);
  //     } else {
  //       alert("失敗, 原因: " + status);
  //     }
  //   });
  // }

  // function showAddress(result, marker) {
  //       var popupContent = result.formatted_address;
  //       popup.setContent(popupContent);
  //       popup.open(map, marker);
  // }

function init(){
  //設定[加入收藏 或 取消收藏]的點按事件
  $id("heart").onclick=switchFavorite;
  loadScript();

}//init
window.onload = init;
