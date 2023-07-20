<!-- Marqueur de localisation -->
<template>
	<span id="LocationDot" class='location-dot'
		:class="classes"
	>
		<span class="pulse-dot">
		</span>
		<span class="central-dot">
		</span>
	</span>
</template>

<script>
export default {
	name: 'LoactionDot',
	props: {
		primary: Boolean,
		secondary: Boolean,
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
