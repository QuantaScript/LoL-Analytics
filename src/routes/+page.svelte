<script>
	import Layout from './Layout.svelte'
	import "../app.css";
	import {GetRecentGames} from './Homepage';
	import { onMount } from 'svelte';

	let RecentGames = [];

	onMount(async () => {
		RecentGames = await GetRecentGames();
	});
</script>

<main class="bg-slate-800 flex h-full flex-row overflow-auto w-auto">
	<Layout/>
	<div class="h-full scroll flex flex-col px-4 my-10 w-5/6 scrollbar-hide">
		<div class="flex flex-col mb-4">
			<div class="text-3xl font-bold text-red-700">
				Recent Results
			</div>
			<div class = "flex flex-row h-40">
				{#each RecentGames as Game}
					<a href="/Series?id={Game["id"]}&game=1" class="bg-slate-950 w-1/6 h-30 mr-3 mt-3 mb-3 hover:bg-gray-100 rounded-lg flex">
						<div class="flex h-full w-full" id="recent-results">
							<div class="flex flex-col w-1/3" id="image">
								<div class="w-full h-4/5">
									{#if (Game["team"] != "")}
										<img src="./TeamIcons/{Game["team"]}.webp" alt="" class="w-40 rounded-lg h-full object-none object-right-bottom">
									{:else}
										<p></p>
									{/if}
								</div>
								<div class="w-full h-1/5 text-red-700 font-bold ml-2">
									{Game["type"]}
								</div>
							</div>
							<div class="w-2/3 h-full flex flex-col" id="text">
								<div class = "h-2/5 w-full text-red-700 font-bold text-right text-5xl pr-1">
									{#if (Game["wins"] > Game["losses"])} Win
									{:else if (Game["wins"] < Game["losses"])} Loss
									{:else} Draw
									{/if}
								</div>
								<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
									{Game["wins"]}:{Game["losses"]}
								</div>
								<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
									{Game["date"]}
								</div>										
							</div>
						</div>
					</a>
				{/each}
			</div>			
		</div>
		<div class="text-3xl font-bold text-red-700 mb-8">
			Scrims
			<div class = "flex flex-col w-full">
				<div class="flex flex-row w-full h-20 mt-2">
					<div class="flex flex-row bg-slate-950 h-full w-1/6 rounded-lg mr-4 mb-4 text-xl align-middle divide-solid divide-x-2 divide-slate-800">
						<div class="w-1/3 h-full flex">
							<div class="h-fit m-auto text-center">
								100%
							</div>
						</div>
						<div class="w-2/3 h-full flex">
							<div class="h-fit m-auto text-center text-lg">
								Winrate
							</div>
						</div>
					</div>
					<div class="flex flex-row bg-slate-950 h-full w-1/6 rounded-lg mx-4 mb-4 text-xl divide-solid divide-x-2 divide-slate-800">
						<div class="w-1/3 h-full flex">
							<div class="h-fit m-auto text-center">
								100%
							</div>
						</div>
						<div class="w-2/3 h-full flex">
							<div class="h-fit m-auto text-center text-lg">
								First Dragon Rate
							</div>
						</div>
					</div>
					<div class="flex flex-row bg-slate-950 h-full w-1/6 rounded-lg mx-4 mb-4 text-xl divide-solid divide-x-2 divide-slate-800">
						<div class="w-1/3 h-full flex">
							<div class="h-fit m-auto text-center">
								1.5
							</div>
						</div>
						<div class="w-2/3 h-full flex">
							<div class="h-fit m-auto text-center text-lg">
								Dragons Per Game
							</div>
						</div>
					</div>
					<div class="flex flex-row bg-slate-950 h-full w-1/6 rounded-lg mx-4 mb-4 text-xl divide-solid divide-x-2 divide-slate-800">
						<div class="w-1/3 h-full flex">
							<div class="h-fit m-auto text-center">
								100%
							</div>
						</div>
						<div class="w-2/3 h-full flex">
							<div class="h-fit m-auto text-center text-lg">
								First Herald Rate
							</div>
						</div>
					</div>
					<div class="flex flex-row bg-slate-950 h-full w-1/6 rounded-lg mx-4 mb-4 text-xl divide-solid divide-x-2 divide-slate-800">
						<div class="w-1/3 h-full flex">
							<div class="h-fit m-auto text-center">
								1.5
							</div>
						</div>
						<div class="w-2/3 h-full flex">
							<div class="h-fit m-auto text-center text-lg">
								Heralds Per Game
							</div>
						</div>
					</div>
					<div class="flex bg-slate-950 h-full w-1/6 rounded-lg mx-4 mb-4 text-xl flex-row divide-solid divide-x-2 divide-slate-800">
						<div class="w-2/5 h-full flex">
							<div class="h-fit m-auto text-center">
								-1533
							</div>
						</div>
						<div class="w-3/5 h-full flex">
							<div class="h-fit m-auto text-center text-lg">
								GD @15
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="text-3xl font-bold text-red-700 mb-4">
			Officials
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
	#recent-results:hover > div#image {
		width: 40%;
		transition-duration: 0.5s;
		transition-timing-function: cubic-bezier(.1,.67,.31,.97);
	}
	#recent-results:hover > div#text {
		width: 60%;
		transition-duration: 0.5s;
		transition-timing-function: cubic-bezier(.1,.67,.31,.97);
	}

.scrollbar-hide::-webkit-scrollbar {
    display: none;
}


.scrollbar-hide {
    -ms-overflow-style: none;
    scrollbar-width: none;  
}

</style>
