<template>
  <MainMap/>
</template>

<script>
import MainMap from './components/MainMap.vue'

export default {
  name: 'App',
  components: {
    MainMap
  },
}
</script>

<!-- TODO: créer un système pour les styles -->
<style>
body {
  margin: 0;
} 
#app { 
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  margin: 0;
}
</style>
