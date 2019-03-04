import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const buildMap = () => {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    return new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
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

    // center to user position
    // set zoom level

  }
};


export { initMapbox };
