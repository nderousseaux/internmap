<template>
  feur
  <MainMap/>
  <!-- <DSView/> -->
  <!-- <TestView/> -->
</template>

<script>
import MainMap from './views/MapView.vue'
import DSView from './views/DSView.vue'
import TestView from './views/TestView.vue'

export default {
  name: 'App',
  components: {
    // eslint-disable-next-line
    MainMap,
    // eslint-disable-next-line
    DSView,
    // eslint-disable-next-line
    TestView,
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
