<template>
	<div class="TagsFilters">
		<div id="Title">
			<h1>Filtres d'entreprises</h1>
		</div>
		<div id="Tags">
			<TagComp
				v-for="(tag, idTag) in tags"
				:key=idTag
				:text="tag.name"
				@click="tagClicked(idTag)"
				secondary
				shadow bubble
			/>

		</div>
	</div>
</template>

<script>
import TagComp from '@/components/design_system/Tag.vue'

export default {
	components: {
		TagComp,
	},
	name: 'TagsFilters',
	props: {
		tags: {
			type: Array,
			default: () => [],
		},		
		filter: {
			type: Array,
			default: () => [],
		},
		changeFilter: {
			type: Function,
			default: () => {},
		},
	},

	methods: {
		tagClicked(idTag) {
			idTag = parseInt(idTag)
			// Si le tag est déjà dans le filtre on le retire
			if (this.filter.includes(idTag)) {
				this.changeFilter(this.filter.filter(id => id != idTag))
			}
			
			// Sinon on l'ajoute
			else {
				this.changeFilter([...this.filter, idTag])
			}
		},
	} 
}
</script>
<style scoped>	

#TagsFilter {
	width: 380px;
	
	border-radius: 20px;
	background-color: var(--light-color);

	padding: 21px 17px;

	display: flex;
	flex-direction: column;
	gap:12px;
	box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
}

#Title {
	height: 45px;
	h1 {
		font-size: 35px;
	}
}

#Tags {
	height: auto;
	padding: 10px 0px;
	display: flex;
	align-items: flex-start;
	align-content: flex-start;
	gap: 10px;
	flex-shrink: 0;
	flex-wrap: wrap;
}

</style>