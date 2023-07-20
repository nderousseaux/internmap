<template>
  <GoogleMap
    id="MainMap"
    :api-key="api_key"
    :map-id="map_id"
    disable-default-ui=True
    :center="center"
    :zoom="12"
  >
    <GmapCustomMarker
    :marker="center"
    alignment="center"
    >
    <LocationDot v-if="gps" primary />
        
    </GmapCustomMarker>

  </GoogleMap>
</template>

<script>
import { GoogleMap } from 'vue3-google-map'
import GmapCustomMarker from 'vue3-gmap-custom-marker'

import LocationDot from '../components/design_system/LocationDot.vue'


export default ({
  name: 'MainMap',
  components: {
    GoogleMap,
    GmapCustomMarker,
    LocationDot,
  },

  data() {
    return {
      api_key: process.env.VUE_APP_GOOGLE_MAPS_API_KEY,
      map_id: process.env.VUE_APP_GOOGLE_MAPS_ID,
      center: {
        lat: 47.767793,
        lng: 6.997605
      },
      gps: false,
    }
  },

  mounted() {
    this.placeLocation()
  },

  methods: {
    placeLocation() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition((position) => {
          this.center = {
            lat: position.coords.latitude,
            lng: position.coords.longitude,
          }
          this.gps = true
          console.log(this.gps)
        })
      }
    },
  },
})
</script>

<style scoped>
#MainMap {
  width: 100vw;
  height: 100vh;
  background: #d6d6d6 ;
}
</style>
