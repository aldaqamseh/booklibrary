<template>
	<div class="text-center">
		<label for="search"></label>
		<input type="text" id="search" @keyup="sendQuery" v-model="query" placeholder= "Search for a book..." />
	</div>
</template>

<script>
export default {
	data() {
		return {
			query: ""
		};
	},
	methods: {
		sendQuery() {
			this.$emit("search", this.query);
		}
	}
};
</script>

<style>
</style>
