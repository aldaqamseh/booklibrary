<template>
	<div class="admin">
		<div class="row justify-content-center mt-5">
			<div class="col col-11">
				<ul
					class="nav justify-content-center"
					id="button-tabs"
					role="tablist"
				>
					<li class="nav-item text-center mr-4">
						<a
							class="nav-link active pl-0 pr-1 pb-1"
							id="add-tab"
							data-toggle="tab"
							href="#add"
							role="tab"
							aria-controls="home"
							aria-selected="true"
							>Add A Book</a
						>
					</li>
					<li class="nav-item text-center">
						<a
							class="nav-link pl-0 pr-1 pb-1"
							id="remove-tab"
							data-toggle="tab"
							href="#remove"
							role="tab"
							aria-controls="home"
							aria-selected="true"
							>Remove A Book</a
						>
					</li>
				</ul>
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
