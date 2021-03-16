import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import places from 'places.js';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  const addMarkersToMap = (map, markers) => {
    markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);      // Create a HTML element for your custom marker
    });

    fitMapToMarkers(map, markers)
  }

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    // Generate the Map
    const map = new mapboxgl.Map ({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    // Add markers and fit them to the map
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);


    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                      mapboxgl: mapboxgl }));

  }

};

export { initMapbox };

