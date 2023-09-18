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

    <MarkerCluster>
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

    </MarkerCluster>



  </GoogleMap>
</template>

<script>
import { GoogleMap, CustomMarker, MarkerCluster } from 'vue3-google-map'


import ButtonComp from '@/components/design_system/Button.vue'
import CompagnyDetails from '@/components/CompanyDetails.vue'
import LocationDot from '@/components/design_system/LocationDot.vue'

export default ({
  name: 'MainMap',
  components: {
    ButtonComp,
    CompagnyDetails,
    CustomMarker,
    GoogleMap,
    LocationDot,
    MarkerCluster
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
      if (event.domEvent.explicitOriginalTarget == null)
        return;
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

<style>
/* On change la couleur des clusters */
[src*="data:image/svg+xml;base64,CiAgPHN2ZyBmaWxsPSIjMDAwMGZmIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNDAgMjQwIj4KICAgIDxjaXJjbGUgY3g9IjEyMCIgY3k9IjEyMCIgb3BhY2l0eT0iLjYiIHI9IjcwIiAvPgogICAgPGNpcmNsZSBjeD0iMTIwIiBjeT0iMTIwIiBvcGFjaXR5PSIuMyIgcj0iOTAiIC8+CiAgICA8Y2lyY2xlIGN4PSIxMjAiIGN5PSIxMjAiIG9wYWNpdHk9Ii4yIiByPSIxMTAiIC8+CiAgPC9zdmc+"] {
  filter: brightness(0) saturate(100%) invert(39%) sepia(91%) saturate(371%) hue-rotate(137deg) brightness(87%) contrast(96%);
}
[src*="data:image/svg+xml;base64,CiAgPHN2ZyBmaWxsPSIjZmYwMDAwIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNDAgMjQwIj4KICAgIDxjaXJjbGUgY3g9IjEyMCIgY3k9IjEyMCIgb3BhY2l0eT0iLjYiIHI9IjcwIiAvPgogICAgPGNpcmNsZSBjeD0iMTIwIiBjeT0iMTIwIiBvcGFjaXR5PSIuMyIgcj0iOTAiIC8+CiAgICA8Y2lyY2xlIGN4PSIxMjAiIGN5PSIxMjAiIG9wYWNpdHk9Ii4yIiByPSIxMTAiIC8+CiAgPC9zdmc+"] {
  filter: brightness(0) saturate(100%) invert(28%) sepia(80%) saturate(1785%) hue-rotate(352deg) brightness(91%) contrast(106%);
}
</style>