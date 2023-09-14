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
    @click="mapClicked"
  >

    <!-- Location dot -->
    <CustomMarker
      :options="{
        position: gps,
      }"
      v-if="gps"
      @click="map.panTo(gps)"
    >
      <LocationDot v-if="zoom > 15" primary approxCircle/>
      <LocationDot v-else primary/>
    </CustomMarker>


    <!-- Companies markers -->
    <CustomMarker
      v-for="(company, idCompany) in companies"
      :key=idCompany
      :options="{
        position: company.gps,
        anchorPoint: 'BOTTOM_CENTER',
        offsetY: -10,
        zIndex: companyOpen(idCompany) ? 4 : 2,
      }"
    >
      
      <ButtonComp 
      :text="company.name" primary shadow bubble
      :slotOpen="companyOpen(idCompany)"
      @click="companyClicked(idCompany)"
      >
        <CompagnyDetails :compagny="company"/>
      </ButtonComp>
    </CustomMarker>



  </GoogleMap>
</template>

<script>
import { GoogleMap, CustomMarker } from 'vue3-google-map'

import ButtonComp from '../components/design_system/Button.vue'
import CompagnyDetails from '@/components/CompanyDetails.vue'
import LocationDot from '../components/design_system/LocationDot.vue'

export default ({
  name: 'MainMap',
  components: {
    ButtonComp,
    CompagnyDetails,
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
      gps: null,
      zoom: 12,
      json_data: null,
      openCompany: -1,
    }
  },

  mounted() {
    // On place la localisation de l'utilisateur
    this.placeLocation()

    // On charge les données des compagnies
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
    tags() {
      if (this.json_data == null) return
      return this.json_data.tags
    }
  },

  methods: {

    // On place la localisation de l'utilisateur
    placeLocation() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition((position) => {
          this.gps = {
            lat: position.coords.latitude,
            lng: position.coords.longitude,
          }

          this.center = this.gps
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

    // Teste si la compagnie est ouverte
    companyOpen(id) {
      return this.openCompany == id
    },

    // On teste si la carte (et uniquement la carte, pas les boutons) a été cliquée
    mapClicked(event) {
      // Si clique pas sur la carte, on ne fait rien
      if (event.domEvent.explicitOriginalTarget.style.zIndex != 3)
        return;

      // On redefini le centre (pour le bug du bouton qui se déplace quand on ferme le détail)
      this.map.panTo(this.map.getCenter())
      
      // Cliqué sur la carte, réinitialisez openCompany à -1
      this.openCompany = -1;
    },

    // Quand un bouton est cliqué, on ouvre la compagnie
    companyClicked(id) {
      this.map.panTo(this.companies[id].gps)

      this.openCompany = id;
    }
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
