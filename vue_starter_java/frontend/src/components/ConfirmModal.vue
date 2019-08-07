<template>
	<div class="modal">
		<button
			type="button"
			class="btn btn-primary"
			data-toggle="modal"
			data-target="#confirmModal"
		>
			Submit
		</button>
		<div
			class="modal fade"
			id="confirmModal"
			tabindex="-1"
			role="dialog"
			aria-labelledby="confirm-modal-label"
			aria-hidden="true"
		>
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="confirm-modal-label">
							Modal title
						</h5>
						<button
							type="button"
							class="close"
							data-dismiss="modal"
							aria-label="Close"
						>
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						...
					</div>
					<div class="modal-footer">
						<button
							type="button"
							class="btn btn-secondary"
							data-dismiss="modal"
						>
							Close
						</button>
						<button type="button" class="btn btn-primary">
							Save changes
						</button>
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
</style>
