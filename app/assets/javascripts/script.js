var myMap = {}

myMap.initialize = function(){
  var $field = $('.autocomplete')[0];
  var autoComplete = new google.maps.places.Autocomplete($field);
}

window.onload = myMap.initialize;

