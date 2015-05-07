// DISPLAY MARKERS ON MAP
// Display Google Map (on index page)
// Get data from database using Ajax
// Loop over data to plot markers onto map

// CREATE AUTOCOMPLETE
// Use Google to create autocomplete field

var myMap = myMap || {};
var infoWindow, contentString;

myMap.createMarker = function(item){
  latLng = new google.maps.LatLng(item.latitude, item.longitude);
  var marker = new google.maps.Marker({
    position: latLng,
    map: this.map
  });
  myMap.addInfoWindow(marker, item);
  marker.setMap(this.map);
}

myMap.createMarkers = function(items){
  $.each(items, function(i, item){
    myMap.createMarker(item)
  });
}

myMap.getData = function(resource){
  $.ajax({
    method: "GET",
    url: "/" + resource + ".json",
    dataType: "json"
  }).done(function(data){
    myMap.createMarkers(data);
  });
}

myMap.displayMap = function() {
  if ($('#googleMap').length > 0) {
    var mapContainer = document.getElementById('googleMap');
    var lat = 51.52;
    var lng = -0.115;
    var userLat = $('#userLat').text();
    var userLng = $('#userLng').text();
    if(userLat != "" && userLng !== ""){
      lat = parseFloat(userLat);
      lng = parseFloat(userLng);
    }


    var myOptions = { 
      center: { lat:lat, lng:lng }, 
      zoom: 12, 
    };

    this.map = new google.maps.Map(mapContainer, myOptions);
    this.getData("coffeeshops");
  }
}

myMap.createAutcomplete = function() {
  if ($('.autocomplete').length > 0) {
    var $field = $('.autocomplete')[0];
    var autoComplete = new google.maps.places.Autocomplete($field);
    myMap.autocompleteCompleteFields(autoComplete);
  }
}

myMap.geolocation = function() {
  navigator.geolocation.getCurrentPosition(function(position){
    var $lat = $('#lat');
    var $lng = $('#lng');
    $lat.val(position.coords.latitude);
    $lng.val(position.coords.longitude);
  }, function(){
    alert("something wrong")
  });
}

//location.A and location.F may change randomly. Please change accordingly. Check by console.log(thisplace)
myMap.autocompleteCompleteFields = function(autoComplete){
  google.maps.event.addListener(autoComplete, 'place_changed', function() {
    var thisplace = autoComplete.getPlace();
    var $lat = $('#lat');
    var $lng = $('#lng');

    $lat.val(thisplace.geometry.location.A);
    $lng.val(thisplace.geometry.location.F);

  });
  
}

myMap.initialize = function(){
  myMap.displayMap();
  myMap.createAutcomplete();
  $("#geolocation").click(function(event){
    event.preventDefault();
    $("#submit_address").attr('disabled','disabled');

    myMap.geolocation();
    //super cheap timeout
    var timer;  
    var delay = 1000;
    window.clearTimeout(timer);
    timer = window.setTimeout(function(){
        $("#submit_address").removeAttr('disabled', 'disabled');
    }, delay);
  
  });
}

myMap.addInfoWindow = function(marker, item){
  google.maps.event.addListener(marker, 'click', function() {

    
    //add a function here to center on area
    console.log(marker.getPosition());
    this.map.panTo(marker.getPosition());
    contentString = item.name +"<p>"+"Address: "+ item.address;

    if(typeof infoWindow != 'undefined'){
      infoWindow.close();
    } 

    infoWindow = new google.maps.InfoWindow({
              content: contentString
          });

      infoWindow.open(this.map,this);
  
    });
}


$(function(){
  myMap.initialize();

});  