<template>
	<div class="text-center">
		<label for="search">Search : </label>
		<input type="text" id="search" @keyup="sendQuery" v-model="query" />
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
