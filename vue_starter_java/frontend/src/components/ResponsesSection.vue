<template>
	<div class="comments-section mt-4">
		<!-- <h5 class="text-center">Replies</h5> -->

		<div class="comments">
			<div v-for="comment in comments" :key="comment.id">
				<div class="list-group-item">
					<p class="user-name mb-0">
						<i class="fas fa-user mr-1"></i>{{ comment.user }}
						<span
							v-if="comment.datePosted"
							class="date ml-4"
							>{{
								comment.datePosted.substring(0, 10)
							}}</span
						>
					</p>

					<p class="comment-body mb-2">{{ comment.body }}</p>
				</div>
			</div>
		</div>
		<div class="add-comment">
			<form v-on:submit.prevent class="my-2 my-lg-0">
				<input
					class="form-control mr-sm-2"
					type="text"
					placeholder="Add reply..."
					aria-label="Reply"
					v-model="newComment.body"
					required
				/>
				<button
					class="btn btn-primary float-right my-2 my-sm-2"
					type="submit"
					@click="addCommentByPostId"
				>
					Submit
				</button>
			</form>
		</div>
	</div>
</template>

<script>
import moment from "moment";
import auth from "../auth";

export default {
	props: {
		postId: Number
	},
	data() {
		return {
			comments: [],
			API_URL:
				"http://localhost:8080/AuthenticationApplication/api/forum/",
			newComment: {
				body: "",
				user: auth.getUser().sub,
				datePosted: moment().format("YYYY-MM-DD"),
				postId: this.postId
			}
		};
	},
	methods: {
		fetchCommentsByPostId() {
			fetch(this.API_URL + this.postId + "/comments")
				.then(response => {
					return response.json();
				})
				.then(comments => {
					this.comments = comments;
					console.log(this.comments);
				});
		},
		addCommentByPostId() {
			if (this.newComment.body) {
				fetch(this.API_URL + this.postId + "/comments", {
					method: "POST",
					mode: "cors",
					headers: {
						Accept: "application/json",
						"Content-Type": "application/json",
						Authorization: "Bearer " + auth.getToken()
					},
					body: JSON.stringify(this.newComment)
				}).then(res => {
					res.json();
					this.fetchCommentsByPostId();
					this.newComment.body = "";
				});
			}
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
	font-size: 1.2rem;
}
</style>
