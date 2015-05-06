var myMap = {}

function createMarkerForCoffeeshop(){
  
}

function mapCoffeeshop(){

}

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

  $.ajax({
    method: "GET",
    url: "/coffeeshop.json"
    data: null,
    datatype: "json",
  }).done(function(data){
   mapCoffeeShop(data)
  });

};





window.onload = myMap.initialize;

