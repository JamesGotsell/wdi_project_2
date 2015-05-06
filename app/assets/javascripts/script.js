
function getUserLocation(){ 
    navigator.geolocation.getCurrentPosition(changeHiddenTagValues);
}

 function changeHiddenTagValues(position) {
  console.log(position)
  document.getElementById('lat').value = position.coords.latitude;
  document.getElementById('long').value = position.coords.longitude;

}



  
 
