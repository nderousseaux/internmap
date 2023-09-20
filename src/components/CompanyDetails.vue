<template>
	<div class="company-details">
		<span>
			<h1>{{ compagny.name }}</h1>
			<div id="Tags">
				<Tag
					v-for="tag in compagny.tagsObj"
					:key="tag"
					:text="tag.name"
				/>
	
			</div>
	
			<div id="Infos">
				<p v-if="compagny.manager"><b>Responsable:</b> {{ compagny.manager }}</p>
				<p v-if="compagny.tutor"><b>Tuteur:</b> {{ compagny.tutor }}</p>
	
				<ClickableText
					icon="location-dot"
					:text="addressFull"
					@click="openMap"
				/>
	
				<ClickableText
					v-if="compagny.phone"
					icon="mobile-screen"
					:text="compagny.phone"
					@click="openPhone"
				/>
	
				<ClickableText
					v-if="compagny.mail"
					icon="envelope"
					:text="compagny.mail"
					@click="openMail"
				/>
	
				<ClickableText
					v-if="compagny.website"
					icon="globe"
					:text="compagny.website"
					@click="openWebsite"
				/>

			</div>
		</span>
	</div>
</template>

<script>
import ClickableText from '@/components/design_system/ClickableText.vue';
import Tag from '@/components/design_system/Tag.vue';


export default {
	name: 'CompanyDetails',

	components: {
		ClickableText,
		Tag,
	},

	props: {
		compagny: Object,
	},

	computed: {
		addressFull() {
			return this.compagny.address + ", " + this.compagny.zip + " " + this.compagny.city;
		},
	},

	methods: {
		openPhone() {
			window.open('tel:' + this.compagny.phone, '_self');
		},

		openMail() {
			window.open('mailto:' + this.compagny.mail, '_self');
		},

		openWebsite() {
			window.open('https://' + this.compagny.website, '_blank');
		},

		openMap() {
			window.open('https://www.google.com/maps/search/?api=1&query=' + this.addressFull, '_blank');
		},
	},
}

</script>

<style scoped>

.company-details {
	display: flex;
	flex-direction: column;
	text-align: start;

	span {
		padding: 25px;
	}

	background-color: var(--light-color);

	overflow: hidden;
}

h1 {
	font-size: 2rem;
	font-weight: bold;
}

#Tags {
	padding: 5px 0;
	white-space: nowrap;
	overflow-x: auto;

	
	display: flex;
	gap: 10px;	
}

#Infos {
	padding: 15px 0 0 0;
	display: flex;
	flex-direction: column;
	gap: 10px;

	& > *:nth-child(-n+2) {
		margin-left: 15px;
	}
}

</style>