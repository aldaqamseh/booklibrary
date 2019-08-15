<template>
	<div class="forum">
		<div class="container">
			<h1 class="text-center">Welcome to the bkwrm Forums!</h1>
			<br>
			<div v-if="username" class="add-post my-5">
				<h5 class="text-center">Make a New Forum Post</h5>
				<form v-on:submit.prevent class="my-2 my-lg-0">
					<div
						class="row d-flex justify-content-center align-items-center"
					>
						<div class="col col-9">
							<input
								class="form-control mr-sm-2"
								type="text"
								placeholder="Add title..."
								aria-label="Reply"
								v-model="newPost.title"
								required
							/>
						</div>
						<input type="hidden" v-model="newPost.user" />
						<div class="col col-3 text-right">
							<button
								class="btn btn-primary my-2 my-sm-2"
								type="submit"
								@click="handleNewPost"
							>
								Submit
							</button>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<textarea
								rows="4"
								class="form-control mr-sm-2"
								placeholder="Add post..."
								aria-label="Reply"
								v-model="newPost.body"
								required
							/>
						</div>
					</div>
				</form>
			</div>

			<div v-for="post in posts.slice().reverse()" :key="post.id">
				<router-link
					:to="{
						params: { postId: post.id },
						path: '/forum/' + post.id
					}"
					tag="div"
					class="card mb-4 px-4 py-2"
					append
				>
					<div class="card-title m-0 post-title">
						<h5 class="mt-1 d-md-inline">{{ post.title }}</h5>
						<br>
						<p class="m-0 d-md-inline float-md-left">
							<i class="fas fa-user mr-1"></i>
							{{ post.user }}
							<span class="ml-5"
								>Date Posted:
								{{ post.datePosted }}</span
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
import auth from "../auth";

export default {
	data() {
		return {
			API_URL:
				"http://localhost:8080/AuthenticationApplication/api/forum",
			posts: [],
			newPost: {
				body: "",
				title: "",
				user: this.getUserName()
			}
		};
	},
	computed: {
		username() {
			if (auth.getUser()) {
				console.log(auth.getUser().sub);
				return auth.getUser().sub;
			} else return "";
		}
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
		},
		addPost() {
			if (this.newPost.title && this.newPost.body) {
				fetch(this.API_URL, {
					method: "POST",
					mode: "cors",
					headers: {
						Accept: "application/json",
						"Content-Type": "application/json",
						Authorization: "Bearer " + auth.getToken()
					},
					body: JSON.stringify(this.newPost)
				}).then(res => {
					console.log(res);
					console.log(JSON.stringify(this.newPost));
					this.fetchAllPosts();
					this.newPost.body = "";
					this.newPost.title = "";
				});
				// .then(res => console.log(res));
			}
		},
		getUserName() {
			if (auth.getUser()) {
				console.log(auth.getUser().sub);
				return auth.getUser().sub;
			} else return "";
		},
		handleNewPost() {
			this.addPost();
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
.add-post {
	border: 1px solid rgba(0, 0, 0, 0.125);
	padding: 2%;
}
</style>
