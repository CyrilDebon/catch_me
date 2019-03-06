import mapboxgl from 'mapbox-gl';

window.addEventListener("load",function() {
    setTimeout(function(){
        // This hides the address bar:
        window.scrollTo(0, 1);
    }, 0);
});

const initMapbox = (userPosition) => {
  const mapElement = document.getElementById('map');

  const buildMap = () => {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    return new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/light-v9',
      zoom: 16,
      center: userPosition
    });
  };


  const addMarkersToMap = (map, markers) => {
    markers.forEach((marker) => {
      var el = document.createElement('div');

      el.innerHTML = marker.code;
      el.className = 'marker-stop';
      el.style.backgroundColor = "#" + marker.background;


      new mapboxgl.Marker(el)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(
          new mapboxgl.Popup({ offset: 25 }).setHTML(marker.popup)
        )
        .addTo(map);
    });
  };


  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);

    var el = document.createElement('div');
    el.className = 'marker-user';

    new mapboxgl.Marker(el)
      .setLngLat(userPosition)
      .addTo(map);

  }
};


export { initMapbox };
