
<<<<<<< HEAD
myMap.initialize = function(){
  var $field = $('.autocomplete')[0];
  var autoComplete = new google.maps.places.Autocomplete($field);

  var latLngObject = new google.maps.LatLng(51.52, -0.115);

  var myOptions = { 
    center: latLngObject, 
    zoom:14, 
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }

var map = new google.maps.Map(document.getElementById("googleMap"),myOptions);

}




window.onload = myMap.initialize;
=======
function getUserLocation(){ 
    navigator.geolocation.getCurrentPosition(changeHiddenTagValues);
}

 function changeHiddenTagValues(position) {
  console.log(position)
  document.getElementById('lat').value = position.coords.latitude;
  document.getElementById('long').value = position.coords.longitude;
>>>>>>> cheryl

}



  
 
