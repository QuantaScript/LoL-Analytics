<script>
	import { TestimonialPlaceholder } from 'flowbite-svelte';
	import Layout from './Layout.svelte'
	import "../app.css";
</script>


<main class="bg-slate-800 flex h-full flex-row">
	<Layout/>
	<div class="h-full w-full scroll flex flex-col mx-8 my-12">
		<div class="flex flex-col">
			<div class="text-3xl font-bold text-red-700">
				Recent Results
			</div>
			<div class = "flex flex-row h-40">
				<a href="" class="bg-slate-950 w-1/5 h-30 mr-3 mt-3 mb-3 hover:bg-gray-100 rounded-lg">
					<div class="">

					</div>
				</a>
				<a href="" class="bg-slate-950 w-1/5 h-30 m-3 hover:bg-gray-100 rounded-lg">
					<div class="">

					</div>
				</a>
				<a href="" class="bg-slate-950 w-1/5 h-30 m-3 hover:bg-gray-100 rounded-lg">
					<div class="">

					</div>
				</a>
				<a href="" class="bg-slate-950 w-1/5 h-30 m-3 hover:bg-gray-100 rounded-lg">
					<div class="">

					</div>
				</a>
				<a href="" class="bg-slate-950 w-1/5 h-30 m-3 hover:bg-gray-100 rounded-lg">
					<div class="">

					</div>
				</a>
			</div>

		</div>
		<div class="text-3xl font-bold text-red-700">
			Stats
		</div>
		<div class="text-3xl font-bold text-red-700">
			Solo Queue
		</div>
		
	</div>
</main>

	


<svelte:head>
	<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet"/>
</svelte:head>

<style>
	.scroll {
		overflow-y: scroll;
	}
</style>
