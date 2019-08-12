<template>
	<div class="container-fluid">
		<div class ="hero">

			<div class="row justify-content-start">
				<div class="col col-6">

					
					<register-box />
				</div>

			</div>
			
		</div>


		<div class="row justify-content-start">
			
		<h1> HERE'S WHAT PEOPLE ARE SAYING ABOUT BKWRM. MORE TEXT TO BUMP DOWN </h1>
		

		<div class="col col-4">
		<img id="info" src = "~@/assets/img/info.svg">
		<p> <strong>bkwrm</strong> is an exclusive online community where book lovers come to discuss the hottest trends in literature, discuss new releases, upcoming authors, and anything else in the literary world.
		bkwrm also has a local lending library located in Columbus, OH where you can rent a book donated by one of our users, as long as you bring your own to add to the collection!</p>

		</div>

		<div class="col col-4">
		<img id="heart" src = "~@/assets/img/heart.svg">
		
		<p> <em>"Bkwrm has litterally changed my life, it's so refreshing to connect with other bkwrms like myself."</em> - Frank </p>
		<p> <em>"I love the ability to add books to my reading list, my reading binge never has to end!"</em> - Katie </p>
		<p> <em>"The forums are a great place to discuss upcoming books, my favorite authors, and get into heated discussions about Tolkiens meaning behind Gandalf."</em> - Luke </p>

		</div>


		<div class="col col-4">
		<img id="forum" src = "~@/assets/img/forum.svg">
		<p> The bkwrm forums are a great place for open minded book lovers to share their thoughts!
			Discuss your favorite authors, books, upcoming releases, and more!
			We'd love to have you be a part of our community, so what are you waiting for? 
			Join today! 
		</p>
		</div>

		</div>
		
	</div>

</template>

<script>

import RegisterBox from "@/components/RegisterBox.vue";

export default {
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

.justify-content-start{
	/* border: solid orange 3px; */
	justify-content: center;
	
}

.col-6{
	margin-left: 50px;
	/* border: solid yellow 5px; */
}

.col-4{
	/* border: solid coral 5px; */
}

#info {
	height: 50px; 
	width: 50px;
	color: cornflowerblue;
}

#heart {
	height: 50px; 
	width: 50px;
}

#forum {
	height: 50px; 
	width: 50px;
}
</style>