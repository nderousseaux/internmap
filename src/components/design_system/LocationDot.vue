<!-- Marqueur de localisation -->
<template>
	<span id="LocationDot">
		<span id="ApproxCircle" v-if="approxCircle">
			<span id="Base" :class="classes"></span>
			<span id="PulseDot" :class="classes" v-if="approxCircle">
			</span>
		</span>	
		<span id="CentralDot" :class="classes">
			<span id="Border" :class="classes"></span>
			<span id="Dot" :class="classes"></span>
		</span>
	</span>
</template>

<script>

export default {
	name: 'LocationDot',
	props: {
		primary: Boolean,
		secondary: Boolean,
		approxCircle: Boolean,
	},

	computed: {
		classes() {
			return {
				'loc-primary': this.primary,
				'loc-secondary': this.secondary,
			};
		},
	},
}
</script>

<style scoped>
@import "./_locationDot.scss";
  
</style>
