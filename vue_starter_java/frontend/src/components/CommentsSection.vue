<template>
	<div class="comments-section">
		<div class="comments-title text-center mb-3">
			<h5
				class="text-right mb-0"
				data-toggle="collapse"
				href="#comments"
				aria-expanded="false"
				aria-controls="comments"
			>
				Show Comments
			</h5>
		</div>

		<div id="comments" class="collapse">
			<div v-for="comment in comments" :key="comment.id">
				<p class="user-name mb-0">
					<i class="fas fa-user mr-1"></i>{{ comment.username }}
					{{ comment.datePosted }}
				</p>

				<p class="comment-body mb-2">{{ comment.body }}</p>
			</div>
		</div>
	</div>
</template>

<script>
import moment from "moment";
export default {
	props: {
		postId: String
	},
	data() {
		return {
			comments: [],
			API_URL: "https://5d4c29ab00dbb1001487a5c8.mockapi.io/api/posts"
		};
	},
	methods: {
		fetchCommentsByPostId() {
			fetch(this.API_URL + "/" + this.postId + "/comments")
				.then(response => {
					return response.json();
				})
				.then(comments => {
					this.comments = comments;
					console.log(this.comments);
				});
		}
	},
	created() {
		this.fetchCommentsByPostId();
	}
};
</script>

<style>
.user-name {
	font-size: 0.8rem;
	color: cornflowerblue;
}
.comment-body {
	font-size: 0.9rem;
}
.comments-section h5 {
	color: cornflowerblue;
	font-size: 0.8rem;
	text-decoration: underline;
}
.comments-section h5:hover {
	cursor: pointer;
}
</style>
