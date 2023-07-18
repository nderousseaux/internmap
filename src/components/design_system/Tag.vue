<!-- Boutton constitué uniquement d'un icone -->

<template>
	<button id="TagComp" class="tag"
		:class="classes"
		@click="clicked = !clicked"	
	>
		<span>#{{ text }}</span>
	</button>
</template>

<script>
export default {
	name: 'TagComp',
	props: {
		text: String,
		primary: Boolean,
		secondary: Boolean,
	},
	data() {
		return {
			clicked: false,
		};
	},

	computed: {
		classes() {
			return {
				'tag-primary': this.primary,
				'tag-secondary': this.secondary,
				'tag-clicked': this.clicked,
			};
		},
	},
}
</script>

<style scoped>
  @import './_tags.scss';
</style>
