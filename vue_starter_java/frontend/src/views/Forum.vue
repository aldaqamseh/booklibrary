<template>
	<div class="forum">
		<div class="container">
			<h1 class="text-center">Welcome to the bkwrm Forums!</h1>

			<div v-for="post in posts" :key="post.id">
				<router-link
					:to="{
						params: { postId: post.id },
						path: post.id
					}"
					tag="div"
					class="card mb-4 px-4 py-2"
					append
				>
					<div class="card-title m-0 post-title">
						<h5 class="mt-1 d-md-inline">{{ post.title }}</h5>
						<p class="m-0 d-md-inline float-md-right">
							<i class="fas fa-user mr-1"></i
							>{{ post.username }}
							<span class="ml-5"
								>Date Posted:
								{{
									post.date_posted.substring(0, 10)
								}}</span
							>
						</p>
					</div>
					<div :id="'card-body-' + post.id">
						<div class="card-body p-1">
							<hr />
							<p class="mb-0">{{ post.body }}</p>
							<p class="text-right mt-2 more">More...</p>
						</div>
					</div>
				</router-link>
			</div>
		</div>
	</div>
</template>

<script>
import moment from "moment";
export default {
	data() {
		return {
			API_URL:
				"http://localhost:8080/AuthenticationApplication/api/forum",
			posts: [],
			newPost: {
				body: "",
				username: "",
				datePosted: moment().format("YYYY-MM-DD")
			}
		};
	},
	components: {},
	methods: {
		fetchAllPosts() {
			fetch(this.API_URL)
				.then(response => {
					return response.json();
				})
				.then(posts => {
					this.posts = posts;
					console.log(this.posts);
				});
		}
	},

	created() {
		this.fetchAllPosts();
	}
};
</script>

<style>
.forum .card:hover {
	text-decoration: none;
	cursor: pointer;
}
.card-title p,
.card-body {
	color: black;
}
.more {
	color: cornflowerblue;
}
</style>
