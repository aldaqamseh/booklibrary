<template>
	<div class="container-fluid">
		<div class="hero">
			<div class="row justify-content-start">
				<div class="col col-6">
					<register-box v-if="!this.isLoggedIn" />
				</div>
			</div>
		</div>

		<div class="row justify-content-start">
			<div class="col col-12">
			<h1>
				Welcome to <strong>bkwrm</strong>, your new place for all things literature.<br>
				Take a look at the few things that make it a great place to be.
			</h1>
			</div>

			<div class="col col-4">
				<img id="info" src="~@/assets/img/info.svg" />
				<p>
					<strong>bkwrm</strong> is an exclusive online community
					where book lovers come to discuss the hottest trends in
					literature, discuss new releases, upcoming authors, and
					anything else in the literary world. bkwrm also has a
					local lending library located in Columbus, OH where you
					can rent a book donated by one of our users, as long as
					you bring your own to add to the collection!
				</p>
			</div>

			<div class="col col-4">
				<img id="heart" src="~@/assets/img/heart.svg" />

				<p>
					<em
						>"Bkwrm has litterally changed my life, it's so
						refreshing to connect with other bkwrms like
						myself."</em
					>
					- Frank
				</p>
				<p>
					<em
						>"I love the ability to add books to my reading
						list, my reading binge never has to end!"</em
					>
					- Katie
				</p>
				<p>
					<em
						>"The forums are a great place to discuss upcoming
						books, my favorite authors, and get into heated
						discussions about Tolkiens meaning behind
						Gandalf."</em
					>
					- Luke
				</p>
			</div>

			<div class="col col-4">
				<img id="forum" src="~@/assets/img/forum.svg" />
				<p>
					The bkwrm forums are a great place for open minded book
					lovers to share their thoughts! Discuss your favorite
					authors, books, upcoming releases, and more! We'd love
					to have you be a part of our community, so what are you
					waiting for? <a href=register>Join today!</a>
				</p>
			</div>
		</div>
	</div>
</template>

<script>
import RegisterBox from "@/components/RegisterBox.vue";
import auth from "../auth";

export default {
	data() {
		return {
			isLoggedIn: auth.getUser
		};
	},
	components: {
		RegisterBox
	}
};
</script>
<style scoped>
.hero {
	background-image: url("~@/assets/img/homepage-2.jpg");
	background-repeat: no-repeat;
	background-size: 110%;
	/* border: solid red 1px; */
	min-height: 70vh;
	background-position: 0% 55%;
}

.container-fluid {
	/* border: solid green 1px; */
	
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
	/* border: solid coral 5px; */
	text-align: center;
	
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
</style>