<template>
	<div class="admin">
		<div class="row justify-content-center mt-5">
			<div class="col col-11">
				<div
					class="tab-content d-flex justify-content-center align-items-center p-3"
				>
					<div
						class="tab-pane active"
						id="add"
						role="tabpanel"
						aria-labelledby="add-tab"
					>
						<add-book />
					</div>
					<div
						class="tab-pane"
						id="remove"
						role="tabpanel"
						aria-labelledby="remove-tab"
					>
						<remove-book />
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
import AddBook from "@/components/AddBook.vue";
import RemoveBook from "@/components/RemoveBook.vue";
export default {
	components: {
		AddBook,
		RemoveBook
	}
};
</script>

<style>
</style>
