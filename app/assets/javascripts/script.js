// var myMap = {}


$(function(){

var map; 

function createMarkerForCoffeeShop(coffeeshop){
  console.log(coffeeshop)
  latLngObjectCoffeeShop = new google.maps.LatLng(coffeeshop.latitude, coffeeshop.longitude);
   var marker = new google.maps.Marker({
     position: latLngObjectCoffeeShop,
     map: map
   });
}

function mapCoffeeShops(coffeeshops){
  $.each(coffeeshops, function(i, coffeeshop){
      createMarkerForCoffeeShop(coffeeshop)

    })
  console.log("hello cheryl")
}

function initialize(){
  var $field = $('.autocomplete')[0];
  var autoComplete = new google.maps.places.Autocomplete($field);

  var myOptions = { 
    center: {lat:51.52 , lng: - 0.115 }, 
    zoom:12, 
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
 
 map = new google.maps.Map(document.getElementById("googleMap"),myOptions); 

  $.ajax({
    method: "GET",
    url: "/coffeeshops.json",
    // data: null,
    dataType: "json",
    // data: "json"
  }).done(function(data){
   mapCoffeeShops(data);
    });
  }


initialize();

});



