<template>
	<div class="forum-post">
		<div class="card mb-4 px-3 pt-3">
			<div
				class="card-title m-0 post-title"
				data-toggle="collapse"
				:href="'#card-body-' + post.id"
				aria-expanded="false"
				:aria-controls="'card-body-' + post.id"
			>
				<h5>{{ post.title }}</h5>
				<p>
					<i class="fas fa-user mr-1"></i>{{ post.username }}
					<span class="ml-5"
						>Date Posted:
						{{ post.date_posted.substring(0, 10) }}</span
					>
				</p>
			</div>
			<div class="collapse" :id="'card-body-' + post.id">
				<div class="card-body p-1">
					<hr />
					<p class="mb-0">{{ post.body }}</p>
				</div>
				<div class="card-body pt-0">
					<comments-section :postId="post.id" />
				</div>
			</div>
		</div>
	</div>
</template>

<script>
import CommentsSection from "@/components/CommentsSection.vue";
export default {
	name: "forum-post",
	components: {
		CommentsSection
	},
	data() {
		return {
			post: {},
			API_URL: "https://5d4c29ab00dbb1001487a5c8.mockapi.io/api/posts/"
		};
	},
	props: {
		postId: String
	},
	methods: {
		fetchPostById() {
			fetch(this.API_URL + this.$route.params.postId)
				.then(response => {
					return response.json();
				})
				.then(post => {
					this.post = post;
					console.log(this.posts);
				});
		}
	},
	created() {
		this.fetchPostById();
		console.log(this.$route.params.postId);
	}
};
</script>

<style>
.post-title:hover {
	cursor: pointer;
}
.post-title h5 {
	color: cornflowerblue;
}
</style>
