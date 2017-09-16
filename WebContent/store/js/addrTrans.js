var i;
var split;

function trans() {
    i = 0;
    $("#target").val("");
    var content = $("#county").val() + $("#city").val() + $("#addr").val();
    split = content.split("\n");
    delayedLoop();
}

function delayedLoop() {
    addressToLatLng(split[i]);
    if (++i == split.length) {
        return;
    }
    window.setTimeout(delayedLoop, 1500);
}

function addressToLatLng(addr) {
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({
        "address": addr
    }, function (results, status) {
if ($("#c").attr('checked'))
{
addr = addr + "=";
}
else {
addr = "";
}
        if (status == google.maps.GeocoderStatus.OK) {
            var lat = $("#lat").val();
            var lng = $("#lng").val();
            $("#lat").val(results[0].geometry.location.lat());
            $("#lng").val(results[0].geometry.location.lng());
        } else {
            var lat = $("#lat").val();
            var lng = $("#lng").val();
            $("#lat").val("");
            $("#lng").val("");
        }
    });
}