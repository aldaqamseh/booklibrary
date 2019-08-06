<template>
	<div class="nav-bar">
		<nav class="navbar navbar-expand-lg navbar-light">
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
				<ul class="navbar-nav">
					<router-link
						v-for="route in routes"
						:key="route.path"
						:to="{ name: route.name }"
						tag="li"
						class="nav-item nav-link"
					>
						{{ route.name }}
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
	height: 100px;
}
.nav-item {
	text-transform: capitalize;
}
.nav-item:hover {
	cursor: pointer;
}
</style>
