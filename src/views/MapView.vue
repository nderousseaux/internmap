<template>
  <GoogleMap
    id="MainMap"
    ref="map"
    :api-key="api_key"
    :map-id="map_id"
    :disable-default-ui="true"
    :center="center"
    :zoom="zoom"
    @zoom_changed="updateZoom()"
  >

    <!-- Location dot -->
    <CustomMarker
      :options="{
        position: center,
      }"
      v-if="gps"
    >
      <LocationDot v-if="zoom > 15" primary approxCircle/>
      <LocationDot v-else primary/>
    </CustomMarker>


    <!-- Companies markers -->
    <CustomMarker
      v-for="company in companies"
      :key="company.id"
      :options="{
        position: company.gps,
        anchorPoint: 'BOTTOM_CENTER',
        offsetY: -10,
        zIndex: 999
      }"
    >
      
      <ButtonComp 
      :text="company.name" primary shadow bubble/>
    </CustomMarker>



  </GoogleMap>
</template>

<script>
import { GoogleMap, CustomMarker } from 'vue3-google-map'

import ButtonComp from '../components/design_system/Button.vue'
import LocationDot from '../components/design_system/LocationDot.vue'


export default ({
  name: 'MainMap',
  components: {
    ButtonComp,
    CustomMarker,
    GoogleMap,
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
      zoom: 12,
      json_data: null,
    }
  },

  mounted() {
    this.placeLocation()
    this.loadCompanies()
  },

  computed: {
    map() {
      return this.$refs.map.map
    },
    companies() {
      if (this.json_data == null) return
      return this.json_data.companies
    },
    categories() {
      if (this.json_data == null) return
      return this.json_data.categories
    }
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
        })
      }
    },

    updateZoom() {
      this.zoom = this.map.getZoom()
    },

    loadCompanies() {
      fetch(process.env.VUE_APP_JSON_URL_COMPANIES)
        .then((response) => response.json())
        .then((data) => {
          this.json_data = data
        })
        .catch((error) => {
          console.error('Error:', error)
        })
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
