<template>
  <MainMap/>
  <!-- <DSView/> -->
</template>

<script>
import MainMap from './components/MainMap.vue'
// import DSView from './views/DSView.vue'

export default {
  name: 'App',
  components: {
    MainMap,
    // DSView,
  },
}
</script>

<!-- TODO: créer un système pour les styles -->
<style>
@import './assets/_reset.scss';
@import './assets/_variables.scss';

#app {
  font-family: var(--font-family);
}
</style>
