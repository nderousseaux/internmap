<!-- Boutton constitué uniquement d'un icone -->

<template>
	<button id="ClickableText" class="clickable-text" @click="method">
		<i v-if="icon" :class="'fas fa-' + icon"></i>
		<span>{{ text }}</span>
	</button>
</template>

<script>
export default {
	name: 'ClickableText',
	props: {
		text: String,
		icon: String,
		method: Function,
	},
}
</script>

<style scoped>
  @import './_clickableText.scss';
</style>
