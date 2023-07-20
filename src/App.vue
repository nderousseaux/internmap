<template>
  <MainMap/>
  <!-- <DSView/> -->
</template>

<script>
import MainMap from './views/MapView.vue'
// import DSView from './views/DSView.vue'

export default {
  name: 'App',
  components: {
    MainMap,
    // DSView,
  },
}
</script>

<style>
@import './assets/_reset.scss';
@import './assets/_variables.scss';

#app {
  font-family: var(--font-family);
}
</style>
