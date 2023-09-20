<template>
  <div id="BlankView">
    <div class="group-btn-text">
      <ButtonComp icon="envelope" text="Lorem ipsum" primary/>
      <ButtonComp text="Lorem ipsum" primary shadow/>
      <ButtonComp icon="globe" primary/>
      <ButtonComp text="Lorem ipsum" primary dimmed/>
    </div>
    <div>
      <ButtonComp icon="mobile-screen" text="Lorem ipsum" secondary/>
      <ButtonComp text="Lorem ipsum" secondary shadow/>
      <ButtonComp icon="location-dot" secondary/>
      <ButtonComp text="Lorem ipsum" secondary dimmed/>
    </div>
    <div>
      <ButtonComp icon="location-arrow" secondary shadow rounded/>
    </div>
    <div>
      <ButtonComp icon="sliders" primary shadow big rotate/>
    </div>
    <div>
      <ButtonComp text="Natter Electricité" primary shadow bubble/>
      <ButtonComp text="Lorem ipsum" primary dimmed shadow bubble/>
      <ButtonComp text="Lorem ipsum" secondary shadow bubble/>
      <ButtonComp text="Lorem ipsum" secondary dimmed shadow bubble/>
    </div>
    <div>
      <LocationDot primary approxCircle/>
      <LocationDot secondary approxCircle/>
    </div>
    <div>
      <TagComp text="Lorem" primary/>
      <TagComp text="Lorem" secondary/>
    </div>
    <div>
      <ClickableText text="Lorem ipsum, Dolor Sit Amet" :method="clicked"/>
      <ClickableText icon="globe" text="Lorem ipsum, Dolor Sit Amet" :method="clicked"/>
    </div>
    <div>
      <CompanyDetails/>
    </div>

  </div>
</template>

<script>
import ButtonComp from '@/components/design_system/Button.vue'
import LocationDot from '@/components/design_system/LocationDot.vue'
import TagComp from '@/components/design_system/Tag.vue'
import ClickableText from '@/components/design_system/ClickableText.vue'
import CompanyDetails from '@/components/CompanyDetails.vue'


export default {
  name: 'BlankView',
  components: {
    ButtonComp,
    LocationDot,
    TagComp,
    ClickableText,
    CompanyDetails
  },

  methods: {
    clicked() {
      alert('clicked !!')
    },
  },
}
</script>

<style scoped>
#BlankView {
  width: 100%;
  min-height: 100vh;
  max-height: 100%;
  background: #C3C3C3;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  gap: 20px;
  padding: 50px;

  div {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 20px;
  }
}

</style>
