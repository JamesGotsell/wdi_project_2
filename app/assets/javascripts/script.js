// DISPLAY MARKERS ON MAP
// Display Google Map (on index page)
// Get data from database using Ajax
// Loop over data to plot markers onto map

// CREATE AUTOCOMPLETE
// Use Google to create autocomplete field

var myMap = myMap || {};

myMap.createMarker = function(item){
  latLng = new google.maps.LatLng(item.latitude, item.longitude);
  var marker = new google.maps.Marker({
    position: latLng,
    map: this.map
  });
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

    var myOptions = { 
      center: { lat:lat, lng:lng }, 
      zoom: 12, 
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    this.map = new google.maps.Map(mapContainer, myOptions);
    this.getData("coffeeshops");
  }
}

myMap.createAutcomplete = function() {
  if ($('.autocomplete').length > 0) {
    var $field = $('.autocomplete')[0];
    var autoComplete = new google.maps.places.Autocomplete($field);
  }
}

myMap.initialize = function(){
  myMap.displayMap();
  myMap.createAutcomplete();
}

$(function(){
  myMap.initialize();
});  