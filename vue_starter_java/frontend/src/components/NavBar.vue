<template>
	<div class="nav-bar sticky-top">
		<nav class="navbar navbar-expand-md navbar-light ">
			<router-link :to="{ name: 'home' }">bkwrm</router-link>
			<button
				class="navbar-toggler"
				type="button"
				data-toggle="collapse"
				data-target="#navbarNav"
				aria-controls="navbarNav"
				aria-expanded="false"
				aria-label="Toggle navigation"
			>
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto text-center">
					<router-link
						v-for="route in routes"
						:key="route.path"
						:to="{ name: route.name }"
						tag="li"
						class="nav-item nav-link"
					>
						<div
							v-if="
								route.name != 'post' &&
									route.name != 'home' &&
									route.name != 'book'
							"
						>
							{{ route.name }}
						</div>
					</router-link>
				</ul>
			</div>
		</nav>
	</div>
</template>

<script>
export default {
	data() {
		return {
			routes: this.$router.options.routes
		};
	}
};
</script>

<style scoped>
.nav-bar {
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #85c1e9;
	padding: 0.2% 0;
	
}
.nav-item {
	text-transform: capitalize;
	
	
}
.nav-item:hover {
	cursor: pointer;

}


</style>
