<template>
	<div class="register-box d-flex align-items-center px-5">
		<div class="row justify-content-between align-items-center">
			<div class="col">
				<div class="box-content">
					<h2>
						Find your next great read with
						<strong>bkwrm.</strong>
					</h2>
					<h3 class="mt-5">
						See what others are raving about, even curate your
						own personal reading list!
					</h3>

					<div class="register-now-button mt-5">
						<h2>
							<a href="/register">
								Register now for free!
							</a>
						</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
export default {};
</script>

<style>
.register-box {
	width: 500px;
	height: 500px;
	margin: 10px;
	padding: 10px;

	background: #eff0f3;

	border-radius: 25px;
}

.register-now-button {
	width: 90%;
	height: 60px;
	margin: auto;
	padding: 10px;

	background: cornflowerblue;

	border-radius: 10px;

	text-align: center;
	vertical-align: center;
	color: white;
	/* box-shadow: -1px 5px 5px black; */
}

.register-box a {
	color: white;
	text-emphasis: none;
	text-decoration: none;
}
</style>
