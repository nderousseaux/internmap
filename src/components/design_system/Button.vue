<!-- Boutton constitué uniquement d'un icone -->

<template>
	<button id="ButtonComp" class="btn"
		:class="classes"
	>
		<i v-if="icon" :class="'fas fa-' + icon"></i>
		<span v-if="text">{{ text }}</span>
		<span v-if="bubble" class="arrow"></span>
	</button>
</template>

<script>
export default {
	name: 'ButtonComp',
	props: {
		text: String,
		icon: String,
		primary: Boolean,
		secondary: Boolean,
		dimmed: Boolean,
		shadow: Boolean,
		rounded: Boolean,
		big: Boolean,
		rotate: Boolean,
		bubble: Boolean,
	},
	
	computed: {
		classes() {
			return {
				'btn-primary': this.primary,
				'btn-secondary': this.secondary,
				'btn-dimmed': this.dimmed,
				'btn-shadow': this.shadow,
				'btn-rounded': this.rounded,
				'btn-big': this.big,
				'btn-rotate': this.rotate,
				'btn-bubble': this.bubble,
				'btn-only-icon': !this.text && this.icon,
			};
		},
	},
}
</script>

<style scoped>
  @import './_buttons.scss';

  #ButtonComp {
		position: relative;
	}
</style>
