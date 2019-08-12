<template>
	<div id="app">
		<nav-bar />
		<div class="container-fluid">
			
			<router-view />
		</div>
	</div>
</template>

<script>
import NavBar from "@/components/NavBar";
export default {
	components: {
		NavBar
	},
	data() {
		return {
			API_KEY: "AIzaSyABC5flhXSPvxkw4u_jWhH4Rq5wliY4A3k",
			GOOD_READS_API: "zAPW4dVltiCzgZbvtgnWWw"
		};
	}
};
</script>

<style>
.container-fluid {
	/* border: solid blue 1px; */
}
</style>
