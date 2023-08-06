<template>
  <div id="TestView" @click="open = !open">
    <ButtonComp text="Natter Electricité" primary shadow bubble :slotOpen="open">
      <CompagnyDetails v-if="open" />
    </ButtonComp>
    <ButtonComp text="Natter Electricité" primary dimmed shadow bubble :slotOpen="open">
      <CompagnyDetails v-if="open" />
    </ButtonComp>
    <ButtonComp text="Natter Electricité" secondary shadow bubble :slotOpen="open">
      <CompagnyDetails v-if="open" />
    </ButtonComp>
    <ButtonComp text="Natter Electricité" secondary dimmed shadow bubble :slotOpen="open">
      <CompagnyDetails v-if="open" />
    </ButtonComp>
  </div>
</template>

<script>
import CompagnyDetails from '@/components/CompanyDetails.vue'
import ButtonComp from '@/components/design_system/Button.vue'

export default {
  name: 'TestView',

  components: {
    CompagnyDetails,
    ButtonComp
  },

  data() {
    return {
      open: true,
    };
  },
}

</script>

<style scoped>

#TestView {
  width: 100%;
  min-height: 100vh;
  max-height: 100%;
  background: #C3C3C3;
  display: flex;
  align-items: center;
  justify-content: center;
}

.button {
  padding: 10px;
  background: red;
  
}

</style>