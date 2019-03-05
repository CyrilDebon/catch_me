import "popper.js";
import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';

import Rails from 'rails-ujs';
Rails.start();
window.Rails = Rails;

import { initCountdown } from '../plugins/init_countdown'
import { flyout } from '../plugins/flyout'
import { initMap } from '../plugins/init_map';
import { initMapbox } from '../plugins/init_mapbox';

flyout();
initCountdown();
initMap();
window.initMapbox = initMapbox;
