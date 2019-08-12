<template>
	<div class="home">
		
		<h1>Home</h1>
		<p>You must be authenticated to see this</p>
	</div>
</template>

<script>
export default {
	name: "home"
};
</script>
<style scoped>
.home {
background-image: url("~@/assets/img/homepage-image.jpeg");
background-repeat: no-repeat;
background-size: cover;
min-height: 100vh
}
</style>