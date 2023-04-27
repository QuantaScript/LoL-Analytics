<script>
	import Layout from '../Layout.svelte'
	import "../../app.css";
	import { onMount } from 'svelte';
	import {load} from "./Series";

	let teams = [{"name": "", "wins": "0"}, {"name": "", "wins": "0"}]
	var tournamentName = ""
	var leagueName = ""
	var matchDateTime = ""
	let resultInfo = []
	var id = ""
	var page = ""
	var game = ""

	onMount(async () => {
		let seriesData = await load()
		teams = seriesData[1]
		tournamentName = seriesData[3]
		leagueName = seriesData[4]
		matchDateTime = seriesData[2]
		resultInfo = seriesData[0]
		id = seriesData[5]
	});

</script>

<main class="bg-slate-800 flex h-full flex-row overflow-auto">
	<Layout/>
	<div class="flex w-5/6 h-full flex-col">
		<div class="flex w-full h-72 bg-slate-950">
			{#if (teams[0]["name"] != "")}
				<div class="w-1/2 flex h-full relative">		
					<img src="./TeamIconsLarge/{teams[0]["name"]}.webp" alt="" class="w-full rounded-lg h-full object-none opacity-60 object-right">		
				</div>
				<div class="w-1/2 flex h-full relative">			
					<img src="./TeamIconsLarge/{teams[1]["name"]}.webp" alt="" class="w-full rounded-lg h-full object-none opacity-60 object-left">			
				</div>
				<div class="h-64 w-5/6 flex absolute flex-col">
					<div class="flex w-full h-1/6 items-center justify-center text-slate-300 font-bold text-lg">
						<div>
							<p>{leagueName} {tournamentName}, {matchDateTime}</p>
						</div>
					</div>
					<div class="flex w-full h-1/3 items-center justify-center text-slate-300 font-bold text-5xl">
						<p>{teams[0]["name"].replace("_", " ")} {teams[0]["wins"]} - {teams[1]["wins"]} {teams[1]["name"].replace("_", " ")}</p>
					</div>
					<div class="flex w-full h-36 items-center justify-center text-slate-300 font-bold">	
						<div class="flex flex-col w-fit h-full  pr-2">
							<div class="flex flex-col w-fit h-1/3 justify-center items-center text-2xl">
							</div>
							<div class="flex flex-col w-full h-1/3 justify-center items-end text-2xl">
								<p>{teams[0]["shortName"]}</p>
							</div>
							<div class="flex flex-col w-full h-1/3 justify-center items-end text-2xl">
								<p>{teams[1]["shortName"]}</p>
							</div>
						</div>
						{#each resultInfo as result}
							{#if result["match"] != 0}
								<div class="flex flex-col w-12 h-full">
									<div class="flex flex-col w-12 h-1/3 justify-center items-center text-2xl border-b-slate-300 border-b-4">
										<p>{result["match"]}</p>
									</div>
									<div class="flex flex-col w-12 h-1/3 justify-center items-center">
										{#if result["winner"] == 0}
											{#if result["side"] == 100}
												<div class="rounded-full h-2/3 w-2/3 bg-blue-700 "></div>
											{:else}
												<div class="rounded-full h-2/3 w-2/3 bg-red-700 "></div>
											{/if}			
										{/if}
									</div>
									<div class="flex flex-col w-12 h-1/3 justify-center items-center">
										{#if result["winner"] == 1}
											{#if result["side"] == 100}
												<div class="rounded-full h-2/3 w-2/3 bg-blue-700 "></div>
											{:else}
												<div class="rounded-full h-2/3 w-2/3 bg-red-700 "></div>
											{/if}			
										{/if}
									</div>	
								</div>
							{/if}
						{/each}									
					</div>
				</div>
			{:else}
				<p></p>
			{/if}
			
		</div>
		<div class="w-full h-fit flex flex-col">
			<div class="flex w-full h-10 justify-center text-xl">
				{#each resultInfo as result}
					{#if result["match"] != 0}
						<a href = "http://localhost:5173/Series?id={id}&game={result["match"]}" onClick="location.href = location.origin + location.pathname + '?id={id}&game={result["match"]}';" class="flex justify-center items-center h-full w-24 bg-slate-950 text-slate-300 font-bold first-of-type:rounded-bl-lg last-of-type:rounded-br-lg hover:text-slate-600">
							<div>
								Game {result["match"]}
							</div>
						</a>
					{/if}
				{/each}
			</div>
		</div>
	</div>
</main>