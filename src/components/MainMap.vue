<template>
  <div id="map"></div>
</template>

<script>

export default {
  name: 'MainMap',
  data () {
    return {
      map: null
    }
  },
  mounted () {
    this.initMap()
  },

  methods: {
    initMap() {
      const selector = document.getElementById("map")
      const options = {
        center: { lat: 48.8589466, lng: 2.2769956 },
        zoom : 8,
      }
      this.map = new window.google.maps.Map(selector, options)
    },
  },
}
</script>

<!-- TODO: créer un système pour les styles (couleurs/polices/etc...) -->
<style scoped>
#map {
  width: 100vw;
  height: 100vh;
  background: #d6d6d6 ;
}
</style>
