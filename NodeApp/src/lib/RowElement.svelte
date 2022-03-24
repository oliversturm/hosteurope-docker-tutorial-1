<script>
	import { readable } from 'svelte/store';
	import { browser } from '$app/env';

	export let row;

	// Let's assume that there is a good reason why this component
	// wants to execute an external API call. Handled via a
	// Svelte Kit endpoint so that the server can decide where
	// exactly to run the query.
	$: total = readable(null, (set) => {
		if (row && browser) {
			fetch(`/calculator_mult_${row.count}_${row.price}.json`)
				.then((res) => res.json())
				.then((res) => {
					set(res);
				});
		}
	});
</script>

<span>{row.count} x {row.product} @ {row.price} - total: {$total || 'not calculated yet'}</span>
