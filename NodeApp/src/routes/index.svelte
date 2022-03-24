<script>
	import RowElement from '$lib/RowElement.svelte';

	export let rows;
</script>

<form method="post">
	<fieldset>
		<legend>Create a new row</legend>
		<label
			>Product
			<input type="text" name="product" required /></label
		>
		<label
			>Count
			<input type="number" name="count" required /></label
		>
		<label
			>Price
			<input type="number" name="price" required step="0.01" /></label
		>

		<button type="submit">Create Row</button>
	</fieldset>
</form>

<h2>Database rows</h2>
<ul>
	{#each rows as row}
		<li><RowElement {row} /></li>
	{/each}
</ul>

<style>
	:global(body) {
		font-family: Arial, Helvetica, sans-serif;
	}
	fieldset {
		padding: 1.5rem;
	}
	label,
	button {
		margin: 0 1rem;
	}
</style>
