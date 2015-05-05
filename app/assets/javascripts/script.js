var myMap = {}
myMap.initialize = function(){
var autoComplete = new google.maps.places.Autocomplete(document.getElementById("autocomplete"));
}

window.onload = myMap.initialize;