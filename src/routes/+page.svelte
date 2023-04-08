<main class="bg-slate-800 flex h-full flex-row overflow-auto w-auto">
	<Layout/>
	<div class="h-full scroll flex flex-col mx-auto my-10 overflow-y-auto">
		<div class="flex flex-col mb-4">
			<div class="text-3xl font-bold text-red-700">
				Recent Results
			</div>
			<div class = "flex flex-row h-40">
				<a href="" class="bg-slate-950 w-1/5 h-30 mr-3 mt-3 mb-3 hover:bg-gray-100 rounded-lg">
					<div class="flex h-full" id="recent-results">
						<div class="flex flex-col w-1/3" id="image">
							<div class="w-full h-4/5">
								<img src="./TeamIcons/{RecentGames[0]["team"]}.webp" alt="" class="w-40 h-full object-none object-right-bottom">
							</div>
							<div class="w-full h-1/5 text-red-700 font-bold ml-2">
								{RecentGames[0]["type"]}
							</div>
						</div>
						<div class="w-2/3 h-full flex flex-col" id="text">
							<div class = "h-2/5 w-full text-red-700 font-bold text-right text-5xl pr-2">
								{#if (RecentGames[0]["wins"] > RecentGames[0]["losses"])} Win
								{:else} Loss
								{/if}
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								{RecentGames[0]["wins"]}:{RecentGames[0]["losses"]}
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								{RecentGames[0]["date"]}
							</div>										
						</div>
					</div>
				</a>
				<a href="" class="bg-slate-950 w-1/5 h-30 m-3 hover:bg-gray-100 rounded-lg">
					<div class="flex h-full" id="recent-results">
						<div class="flex flex-col w-1/3" id="image">
							<div class="w-full h-4/5">
								<img src="./TeamIcons/{RecentGames[1]["team"]}.webp" alt="" class="w-40 h-full object-none object-right-bottom">
							</div>
							<div class="w-full h-1/5 text-red-700 font-bold ml-2">
								{RecentGames[1]["type"]}
							</div>
						</div>
						<div class="w-2/3 h-full flex flex-col" id="text">
							<div class = "h-2/5 w-full text-red-700 font-bold text-right text-5xl pr-2">
								{#if (RecentGames[1]["wins"] > RecentGames[1]["losses"])} Win
								{:else} Loss
								{/if}
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								{RecentGames[1]["wins"]}:{RecentGames[1]["losses"]}
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								{RecentGames[1]["date"]}
							</div>										
						</div>
					</div>
				</a>
				<a href="" class="bg-slate-950 w-1/5 h-30 m-3 hover:bg-gray-100 rounded-lg">
					<div class="flex h-full" id="recent-results">
						<div class="flex flex-col w-1/3" id="image">
							<div class="w-full h-4/5">
								<img src="./TeamIcons/{RecentGames[2]["team"]}.webp" alt="" class="w-40 h-full object-none object-right-bottom">
							</div>
							<div class="w-full h-1/5 text-red-700 font-bold ml-2">
								{RecentGames[2]["type"]}
							</div>
						</div>
						<div class="w-2/3 h-full flex flex-col" id="text">
							<div class = "h-2/5 w-full text-red-700 font-bold text-right text-5xl pr-2">
								{#if (RecentGames[2]["wins"] > RecentGames[2]["losses"])} Win
								{:else} Loss
								{/if}
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								{RecentGames[2]["wins"]}:{RecentGames[2]["losses"]}
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								{RecentGames[2]["date"]}
							</div>										
						</div>
					</div>
				</a>
				<a href="" class="bg-slate-950 w-1/5 h-30 m-3 hover:bg-gray-100 rounded-lg">
					<div class="flex h-full" id="recent-results">
						<div class="flex flex-col w-1/3" id="image">
							<div class="w-full h-4/5">
								<img src="./TeamIcons/{RecentGames[3]["team"]}.webp" alt="" class="w-40 h-full object-none object-right-bottom">
							</div>
							<div class="w-full h-1/5 text-red-700 font-bold ml-2">
								{RecentGames[3]["type"]}
							</div>
						</div>
						<div class="w-2/3 h-full flex flex-col" id="text">
							<div class = "h-2/5 w-full text-red-700 font-bold text-right text-5xl pr-2">
								{#if (RecentGames[3]["wins"] > RecentGames[3]["losses"])} Win
								{:else} Loss
								{/if}
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								{RecentGames[3]["wins"]}:{RecentGames[3]["losses"]}
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								{RecentGames[3]["date"]}
							</div>										
						</div>
					</div>
				</a>
				<a href="" class="bg-slate-950 w-1/5 h-30 m-3 hover:bg-gray-100 rounded-lg">
					<div class="flex h-full" id="recent-results">
						<div class="flex flex-col w-1/3" id="image">
							<div class="w-full h-4/5">
								<img src="./TeamIcons/{RecentGames[4]["team"]}.webp" alt="" class="w-40 h-full object-none object-right-bottom">
							</div>
							<div class="w-full h-1/5 text-red-700 font-bold ml-2">
								{RecentGames[4]["type"]}
							</div>
						</div>
						<div class="w-2/3 h-full flex flex-col" id="text">
							<div class = "h-2/5 w-full text-red-700 font-bold text-right text-5xl pr-2">
								{#if (RecentGames[4]["wins"] > RecentGames[4]["losses"])} Win
								{:else} Loss
								{/if}
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								{RecentGames[4]["wins"]}:{RecentGames[4]["losses"]}
							</div>
							<div class = "h-1/5 w-full text-red-700 font-bold text-right pr-2">
								{RecentGames[4]["date"]}
							</div>										
						</div>
					</div>
				</a>
			</div>

		</div>
		<div class="text-3xl font-bold text-red-700 mb-8">
			Scrims
			<div class = "flex flex-col w-full">
				<div class="flex flex-row w-full h-20 mt-2">
					<div class="flex flex-row bg-slate-950 h-full w-1/6 rounded-lg mr-4 mb-4 text-xl flex-row align-middle divide-solid divide-x-2 divide-slate-800">
						<div class="w-1/3 h-full flex">
							<div class="h-fit m-auto text-center">
								100%
							</div>
						</div>
						<div class="w-2/3 h-full flex">
							<div class="h-fit m-auto text-center">
								Winrate
							</div>
						</div>
					</div>
					<div class="flex flex-row bg-slate-950 h-full w-1/6 rounded-lg mx-4 mb-4 text-xl flex-row divide-solid divide-x-2 divide-slate-800">
						<div class="w-1/3 h-full flex">
							<div class="h-fit m-auto text-center">
								100%
							</div>
						</div>
						<div class="w-2/3 h-full flex">
							<div class="h-fit m-auto text-center">
								First Dragon Rate
							</div>
						</div>
					</div>
					<div class="flex flex-row bg-slate-950 h-full w-1/6 rounded-lg mx-4 mb-4 text-xl flex-row divide-solid divide-x-2 divide-slate-800">
						<div class="w-1/3 h-full flex">
							<div class="h-fit m-auto text-center">
								1.5
							</div>
						</div>
						<div class="w-2/3 h-full flex">
							<div class="h-fit m-auto text-center">
								Dragons Per Game
							</div>
						</div>
					</div>
					<div class="flex flex-row bg-slate-950 h-full w-1/6 rounded-lg mx-4 mb-4 text-xl flex-row divide-solid divide-x-2 divide-slate-800">
						<div class="w-1/3 h-full flex">
							<div class="h-fit m-auto text-center">
								100%
							</div>
						</div>
						<div class="w-2/3 h-full flex">
							<div class="h-fit m-auto text-center">
								First Herald Rate
							</div>
						</div>
					</div>
					<div class="flex flex-row bg-slate-950 h-full w-1/6 rounded-lg mx-4 mb-4 text-xl flex-row divide-solid divide-x-2 divide-slate-800">
						<div class="w-1/3 h-full flex">
							<div class="h-fit m-auto text-center">
								1.5
							</div>
						</div>
						<div class="w-2/3 h-full flex">
							<div class="h-fit m-auto text-center">
								Heralds Per Game
							</div>
						</div>
					</div>
					<div class="flex flex-row bg-slate-950 h-full w-1/6 rounded-lg mx-4 mb-4 text-xl flex-row divide-solid divide-x-2 divide-slate-800">
						<div class="w-2/5 h-full flex">
							<div class="h-fit m-auto text-center">
								-1533
							</div>
						</div>
						<div class="w-3/5 h-full flex">
							<div class="h-fit m-auto text-center">
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

</style>

<script>
	import Layout from './Layout.svelte'
	import "../app.css";
	import {GetRecentGames} from './Homepage';

	var RecentGames = GetRecentGames();



</script>
