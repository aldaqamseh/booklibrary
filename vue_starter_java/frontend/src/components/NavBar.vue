<template>
	<div class="nav-bar sticky-top">
		<nav class="navbar navbar-expand-md navbar-light ">
			<router-link class="nav-left" :to="{ name: 'home' }"
				><img src="~@/assets/img/bkwrm.png"
			/></router-link>

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
						class="nav-item nav-link nav-link-ltr"
					>
						Search
					</router-link>
					<router-link
					
						:to="{ name: 'myList' }" 
						tag="li"
						class="nav-item nav-link nav-link-ltr"
					>
						myList™
					</router-link>
					<router-link
						:to="{ name: 'forum' }"
						tag="li"
						class="nav-item nav-link nav-link-ltr"
					>
						Forums
					</router-link>
					<div v-if="userName" class="nav-right">
						<router-link
							:to="{ name: 'home' }"
							tag="li"
							class="nav-item nav-link d-inline-block mb-2"
						>
							Welcome back, {{ userName }}!
						</router-link>
						<a
							@click="logout"
							class="d-inline-block nav-item nav-link logout mb-2"
							>Logout</a
						>
					</div>
					<div v-else>
						<router-link
							:to="{ name: 'login' }"
							tag="li"
							class="nav-item nav-link nav-right mb-2"
						>
							Login
						</router-link>
					</div>
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
			routes: this.$router.options.routes
		};
	},
	props: {
		user: Object
	},
	computed: {
		userName() {
			if (this.user) {
				return this.user.sub;
			} else {
				return null;
			}
		}
	},
	methods: {
		getUserName() {
			return auth.getUser().sub;
		},
		logout() {
			this.$emit("logout");
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

.nav-link {
	font-weight: 400;
}

.nav-link:active {
	color: orange;
}
.nav-item:hover {
	cursor: pointer;
}

.navbar-light .navbar-nav .nav-link:focus,
.navbar-light .navbar-nav .nav-link:hover {
	color: cornflowerblue;
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

/* .nav-item nav-link nav-link-ltr router-link-exact-active router-link-active {
	color: orange;
	text-emphasis: underline;
} */

img {
	width: 200px;
	height: 200px;
}

.nav-link:hover {
	opacity: 1;
}

.nav-link::before {
	transition: 300ms;
	height: 5px;
	content: "";
	position: absolute;
	background-color: cornflowerblue;
}

.nav-link-ltr::before {
	width: 0%;
	bottom: 5px;
}

.nav-link-ltr:hover::before {
	width: 22%;
}
a.d-inline-block.nav-item.nav-link.logout.mb-2 {
	color: black;
}
a.d-inline-block.nav-item.nav-link.logout.mb-2:hover {
	color: cornflowerblue;
}
</style>
