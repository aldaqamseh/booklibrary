<template>
	<div class="forum">
		<h1>Welcome to the bkwrm Forums!</h1>

		<div v-for="post in posts" :key="post.id">
			<router-link
				:to="{
					params: { postId: post.id },
					path: post.id
				}"
				append
				>click</router-link
			>
		</div>
	</div>
</template>

<script>
import ForumPost from "@/components/ForumPost.vue";
export default {
	data() {
		return {
			API_URL: "https://5d4c29ab00dbb1001487a5c8.mockapi.io/api/posts",
			posts: []
		};
	},
	components: {
		ForumPost
	},
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
</style>
