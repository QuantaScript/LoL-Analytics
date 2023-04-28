<script>
	import Layout from '../Layout.svelte'
	import "../../app.css";
	import { onMount } from 'svelte';
	import {headerLoad, overviewLoad} from "./Series";
    import { intros } from 'svelte/internal';

	let teams = [{"name": "", "wins": "0"}, {"name": "", "wins": "0"}]
	var tournamentName = ""
	var leagueName = ""
	var matchDateTime = ""
	let resultInfo = []
	var id = ""
	var page = ""
	var gameId = ""
	let scoreboard = [{}]
	let scoreboardTeams = [{"objectives": {"champion": {}, "tower":{}}}, 
						{"objectives": {"champion": {}, "tower":{}}}]
	var game = 0
	let currentResult = [{}]

	onMount(async () => {
		let seriesData = await headerLoad()
		teams = seriesData[1]
		tournamentName = seriesData[3]
		leagueName = seriesData[4]
		matchDateTime = seriesData[2]
		resultInfo = seriesData[0]
		id = seriesData[5]
		gameId = seriesData[6]
		currentResult = resultInfo[seriesData[7] - 1]
		console.log(game)
		console.log(resultInfo[game])
		scoreboard = await overviewLoad(gameId)
		scoreboardTeams = scoreboard[0]["teams"]
	});

</script>

<main class="bg-slate-800 flex h-full flex-row overflow-auto">
	<Layout/>
	<div class="flex w-5/6 h-full flex-col">
		<div class="flex w-full h-64 bg-slate-950">
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
					<div class="flex w-full h-1/4 items-center justify-center text-slate-300 font-bold text-5xl">
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
		{#if scoreboard == [{}]}
		 <div></div>
		{:else}
			<div class = "flex w-full h-fit p-2 flex-col">
				<div class = "flex h-fit w-full flex-row">
					<div class="h-fit w-1/3 flex">

					</div>
					<div class="h-fit w-1/3 flex items-center flex-col">
						<div class = "text-lg text-slate-300 font-bold border-b-slate-300 border-b-2">
							Game Time
						</div>
						<div class = "text-2xl text-slate-300 font-bold">
							{Math.floor(scoreboard[0]["gameDuration"]/60)}:{('0'+(scoreboard[0]["gameDuration"] - (Math.floor(scoreboard[0]["gameDuration"]/60)*60))).slice(-2)}
						</div>
					</div>
					<div class="h-fit w-1/3 flex justify-end text-lg text-slate-300 font-bold">
						Patch {scoreboard[0]["gameVersion"]}
					</div>
				</div>
				<div class = "flex h-fit w-full pt-4 flex-row text-slate-300 font-semibold">
					<div class = "flex w-1/2 h-fit flex-col">
						<div class = "text-2xl text-blue-700 font-bold border-b-blue-700 border-b-2 w-full h-fit">
							<div>
								{currentResult["blue"]} - {#if currentResult["side"] == 100}
								Win
								{:else}
								Loss
							{/if}
							</div>						
						</div>
						<div class = "flex flex-row h-fit w-full pt-1">
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 py-1 flex flex-row">
										<img src="./Icons/kills.png" alt="">
										<p class = "text-xl font-semibold pl-1">{scoreboardTeams[0]["objectives"]["champion"]["kills"]}</p>
									</div> 
								</div>
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 flex flex-row py-1">
										<img src="./Icons/tower.png" alt="">
										<p class = "text-xl font-semibold pl-1">{scoreboardTeams[0]["objectives"]["tower"]["kills"]}</p>
									</div>								 
								</div>
								
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 flex flex-row py-1">
										<img src="./Icons/inhib.png" alt="">
										<p class = "text-xl font-semibold pl-1">10</p>
									</div>								 
								</div>
								
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 flex flex-row py-1">
										<img src="./Icons/dragon.png" alt="">
										<p class = "text-xl font-semibold pl-1">10</p>
									</div>
								</div>
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 flex flex-row py-1">
										<img src="./Icons/rift_herald.png" alt="">
										<p class = "text-xl font-semibold pl-1">10</p>
									</div>							 
								</div>
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 flex flex-row py-1">
										<img src="./Icons/baron.png" alt="">
										<p class = "text-xl font-semibold pl-1">10</p>
									</div> 
								</div>
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 flex flex-row py-1">
										<img src="./Icons/gold.png" alt="">
										<p class = "text-xl font-semibold pl-1">53.6K</p>
									</div>  
								</div>
							</div>
						</div>
						<div class = "flex flex-row h-fit w-full">
							<div class = "flex h-fit w-1/6"></div>
							<div class = "flex h-fit w-1/6"></div>
							<div class = "flex h-fit w-1/6"></div>
							<div class = "flex h-fit w-1/6">
								<div class="h-4 w-4">
									<img src="./Icons/air.png" alt="">
								</div>
								<div class="h-4 w-4">
									<img src="./Icons/water.png" alt="">
								</div>
								<div class="h-4 w-4">
									<img src="./Icons/earth.png" alt="">
								</div>
								<div class="h-4 w-4">
									<img src="./Icons/fire.png" alt="">
								</div>
								<div class="h-4 w-4">
									<img src="./Icons/chemtech.png" alt="">
								</div>
								<div class="h-4 w-4">
									<img src="./Icons/hextech.png" alt="">
								</div>
							</div>
							<div class = "flex h-fit w-1/6"></div>
							<div class = "flex h-fit w-1/6"></div>
							<div class = "flex h-fit w-1/6"></div>
						</div>
					</div>
					<div class = "flex w-1/2 h-fit flex-col">
						<div class = "text-2xl text-red-700 font-bold border-b-red-700 border-b-2 w-full h-fit">
							<div>
								{currentResult["red"]} - {#if currentResult["side"] == 200}
									Win
									{:else}
									Loss
								{/if}
							</div>
						</div>
						<div class = "flex flex-row h-fit w-full pt-1">
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 py-1 flex flex-row">
										<img src="./Icons/kills.png" alt="">
										<p class = "text-xl font-semibold pl-1">{scoreboardTeams[1]["objectives"]["champion"]["kills"]}</p>
									</div> 
								</div>
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-1">
										Towers:
									</div>								 
								</div>
								
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-1">
										Inhibs:
									</div>								 
								</div>
								
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-1">
										Dragon:
									</div>
								</div>
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-1">
										Herald:
									</div>							 
								</div>
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-1">
										Baron:
									</div> 
								</div>
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-1">
										Gold:
									</div>  
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		{/if}
	</div>
</main>