<template>
	<div class="nav-bar sticky-top">
		<nav class="navbar navbar-expand-md navbar-light ">
			<router-link class="nav-left" :to="{ name: 'home' }"
				><img src="~@/assets/img/bkwrm.png"></router-link
			>
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
						:to="{ name: 'books' }"
						tag="li"
						class="nav-item nav-link"
					>
						Search
					</router-link>
					<router-link
						:to="{ name: 'list' }"
						tag="li"
						class="nav-item nav-link"
					>
						myList
					</router-link>
					<router-link
						:to="{ name: 'forum' }"
						tag="li"
						class="nav-item nav-link"
					>
						Forums
					</router-link>
					<router-link
						v-if="this.getUserName != null"
						:to="{ name: 'home' }"
						tag="li"
						class="nav-item nav-link nav-right"
					>
						Welcome back, {{ this.getUserName() }}!
					</router-link>
					<router-link
						v-else
						:to="{ name: 'login' }"
						tag="li"
						class="nav-item nav-link nav-right"
					>
						Login
					</router-link>
				</ul>
			</div>
		</nav>
	</div>
</template>

<script>
import auth from "../auth";
export default {
	data() {
		return {
			routes: this.$router.options.routes,
			user: {}
		};
	},
	methods: {
		getUserName() {
			if (auth.getUser()) {
				return auth.getUser().sub;
			} else {
				return null;
			}
		}
	}
};
</script>

<style scoped>
.nav-bar {
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: white;
	padding: 0.2% 0;
	/* box-shadow: 5px 1px 5px; */
}

.nav-item:hover {
	cursor: pointer;
}
.nav-item > div:hover {
	color: cornflowerblue;
	text-decoration: underline;
}
.nav-left {
	position: fixed;
	left: 0;
	margin-left: -5px;
}
.nav-right {
	position: fixed;
	right: 0;
	margin-right: 10px;
	text-transform: capitalize;
}
li.nav-item.nav-link {
	color: black;
}

img {
	width: 200px;
	height: 200px;
}
</style>
