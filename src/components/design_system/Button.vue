<!-- Boutton constitué uniquement d'un icone -->

<template>
	<button id="ButtonComp" class="btn"
		:class="classes"
	>
		<!-- V-if slot is not use -->
		<span>
			<i v-if="icon" :class="'fas fa-' + icon"></i>
			<span v-if="text">{{ text }}</span>
			<span v-if="bubble" class="arrow"></span>
		</span>

		<!-- Si button bubble, on affiche un composant quand on clique sur le bouton -->
		<slot v-if="slotOpen"></slot>

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
		slotOpen: Boolean,
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
				'btn-slot-only': this.slotOpen,
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
