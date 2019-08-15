<template>
	<div class="container-fluid p-0">
		<div class="hero d-flex align-items-center">
			<div class="row justify-content-start">
				<div class="col col-6">
					<!-- <register-box/> -->
					<register-box v-if="!isLoggedIn" />
				</div>
			</div>
		</div>

		<div class="row copy-row justify-content-start">
			<div class="col col-12">
				<h1>
					Welcome to <strong>bkwrm</strong> 
					<br> <em>Book lovers unite!</em><br />
				</h1>
			</div>
		</div>
		<div class="row icon-row justify-content-center">
			<div class="col col-4">
				<p class="text-center">
					<img id="info" src="~@/assets/img/info.svg" />
				</p>
				<p>
					<strong>bkwrm</strong> is an exclusive online community
					where book lovers come to discuss all things literary. 
					
					Located in Columbus, OH? Swing by our local lending library with your pre-loved books
					and come away with some fresh finds. What better way to breath new life into old stories?
				</p>
			</div>

			<div class="col col-4">
				<p class="text-center">
					<img id="heart" src="~@/assets/img/heart.svg" />
				</p>

				<p>
					<em
						>"Bkwrm has litterally changed my life, it's so
						refreshing to connect with other bkwrms like
						myself."</em
					>
					- Steve C.
				</p>
				<p>
					<em
						>"I love the ability to add books to my reading
						list, my reading binge never has to end!"</em
					>
					- Andrew F.
				</p>
				<p>
					<em
						>"The forums are a great place to discuss upcoming
						books, my favorite authors, and get into heated
						discussions about Tolkiens meaning behind
						Gandalf."</em
					><br />
					- Katie D.
				</p>
			</div>

			<div class="col col-4">
				<p class="text-center">
					<img id="forum" src="~@/assets/img/forum.svg" />
				</p>
				<p>
					The bkwrm forums are a great place for open minded book
					lovers to share their thoughts! Discuss your favorite
					authors, books, upcoming releases, and more! We'd love
					to have you be a part of our community. What are you waiting for? Sign-up today!
				</p>
				<p class="text-center mt-5">
					<button class="btn btn-primary">
						<a href="register">Join today!</a>
					</button>
				</p>
			</div>
		</div>
	</div>
</template>

<script>
import RegisterBox from "@/components/RegisterBox.vue";
import auth from "../auth";

export default {
	computed: {
		isLoggedIn() {
			return auth.getUser();
		}
	},
	components: {
		RegisterBox
	}
};
</script>
<style scoped>
@import url("https://fonts.googleapis.com/css?family=Open+Sans&display=swap");
.hero {
	background-image: url("~@/assets/img/homepage-2.jpg");
	/* background-attachment: fixed; */
	background-repeat: no-repeat;
	background-size: 110%;
	/* border: solid red 1px; */
	min-height: 70vh;
	background-position: 0% 55%;
}

.justify-content-start {
	/* border: solid green 2px; */
	text-align: center;
}

.justify-content-start h1 {
	/* border: solid blue 3px; */
	text-align: center;
}

.col-12 {
	margin-bottom: 25px;
	margin-top: 15px;
	color: cornflowerblue;
}

.col-6 {
	margin-left: 50px;
	/* border: solid yellow 5px; */
}

.col-4 {
	text-align: left;
	padding: 25px;
}
.icon-row {
	width: 95%;
	margin: auto;
}
.copy-row {
	width: 80%;
	margin: auto;
}

#info {
	height: 50px;
	width: 50px;
	margin: 10px;
}

#heart {
	height: 50px;
	width: 50px;
	margin: 10px;
}

#forum {
	height: 50px;
	width: 50px;
	margin: 10px;
}

h1 {
	font-family: "Open Sans", sans-serif;
}

p {
	font-family: "Open Sans";
}

.btn a {
	color: white;
}
</style>