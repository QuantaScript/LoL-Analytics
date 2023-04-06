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
					<div class="flex h-full">
						<div class="flex flex-col w-1/3">
							<div class="w-full h-4/5">
								<img src="./TeamIcons/diamant.webp" alt="" class="w-40 h-full object-none object-right">
							</div>
							<div class="w-full h-1/5 text-red-700 font-bold ml-2">
								Scrim
							</div>
						</div>
						<div class="w-2/3 h-full flex flex-col">
							<div class = "h-2/5 w-full text-red-700 font-bold text-right text-5xl pr-2">
								Loss
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								0:1
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								06/4/23
							</div>										
						</div>
					</div>
				</a>
				<a href="" class="bg-slate-950 w-1/5 h-30 m-3 hover:bg-gray-100 rounded-lg">
					<div class="flex h-full">
						<div class="flex flex-col w-1/3">
							<div class="w-full h-4/5">
								<img src="./TeamIcons/diamant.webp" alt="" class="w-40 h-full object-none object-right">
							</div>
							<div class="w-full h-1/5 text-red-700 font-bold mx-2">
								Scrim
							</div>
						</div>
						<div class="w-2/3 h-full flex flex-col">
							<div class = "h-2/5 w-full text-red-700 font-bold text-right text-5xl pr-2">
								Loss
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								0:1
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								06/4/23
							</div>											
						</div>
					</div>
				</a>
				<a href="" class="bg-slate-950 w-1/5 h-30 m-3 hover:bg-gray-100 rounded-lg">
					<div class="flex h-full">
						<div class="flex flex-col w-1/3">
							<div class="w-full h-4/5">
								<img src="./TeamIcons/diamant.webp" alt="" class="w-40 h-full object-none object-right">
							</div>
							<div class="w-full h-1/5 text-red-700 font-bold ml-2">
								Scrim
							</div>
						</div>
						<div class="w-2/3 h-full flex flex-col">
							<div class = "h-2/5 w-full text-red-700 font-bold text-right text-5xl pr-2">
								Loss
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								0:1
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								06/4/23
							</div>											
						</div>
					</div>
				</a>
				<a href="" class="bg-slate-950 w-1/5 h-30 m-3 hover:bg-gray-100 rounded-lg">
					<div class="flex h-full">
						<div class="flex flex-col w-1/3">
							<div class="w-full h-4/5">
								<img src="./TeamIcons/diamant.webp" alt="" class="w-40 h-full object-none object-right">
							</div>
							<div class="w-full h-1/5 text-red-700 font-bold ml-2">
								Official
							</div>
						</div>
						<div class="w-2/3 h-full flex flex-col">
							<div class = "h-2/5 w-full text-red-700 font-bold text-right text-5xl pr-2">
								Loss
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								0:1
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								06/4/23
							</div>											
						</div>
					</div>
				</a>
				<a href="" class="bg-slate-950 w-1/5 h-30 m-3 hover:bg-gray-100 rounded-lg">
					<div class="flex h-full">
						<div class="flex flex-col w-1/3">
							<div class="w-full h-4/5">
								<img src="./TeamIcons/diamant.webp" alt="" class="w-40 h-full object-none object-right">
							</div>
							<div class="w-full h-1/5 text-red-700 font-bold ml-2">
								Scrim
							</div>
						</div>
						<div class="w-2/3 h-full flex flex-col">
							<div class = "h-2/5 w-full text-red-700 font-bold text-right text-5xl pr-2">
								Loss
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								0:1
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								06/4/23
							</div>										
						</div>
					</div>
				</a>
			</div>

		</div>
		<div class="text-3xl font-bold text-red-700">
			Stats
			<div class = "flex flex-col">
				

			</div>
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
