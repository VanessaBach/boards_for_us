require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// External imports
import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import 'mapbox-gl/dist/mapbox-gl.css';
import "@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css";

document.addEventListener('turbolinks:load', () => {
  initMapbox();
	loadDynamicBannerText();
  initUpdateNavbarOnScroll();
  initAutocomplete();
  });
