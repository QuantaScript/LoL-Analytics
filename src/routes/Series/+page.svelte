<script>
	import Layout from '../Layout.svelte'
	import "../../app.css";
	import {headerLoad, overviewLoad, buildLoad} from "./Series";
    import { each, intros } from 'svelte/internal';
    import { fly } from 'svelte/transition';

	let teams = [{"name": "", "wins": "0"}, {"name": "", "wins": "0"}]
	var tournamentName = ""
	var leagueName = ""
	var matchDateTime = ""
	let resultInfo = []
	var id = ""
	var gameId = ""
	let scoreboard = []
	let currentResult = [{}]
	let blueSide = []
	let redSide = []
	let builds = {};
	let buildLoaded = {}
	var gameType = ""

	async function loadheader(){
		let seriesData = await headerLoad()
		teams = seriesData[1]
		tournamentName = seriesData[3]
		leagueName = seriesData[4]
		matchDateTime = seriesData[2]
		resultInfo = seriesData[0]
		id = seriesData[5]
		gameId = seriesData[6]
		currentResult = resultInfo[seriesData[7] - 1]
		gameType = seriesData[8]
	}

	async function loadScoreboard(gameId){
		scoreboard = await overviewLoad(gameId)
		blueSide = scoreboard["participants"].slice(0,5)
		redSide = scoreboard["participants"].slice(-5)
	}

	function nFormatter(num, digits) {
		const lookup = [
			{ value: 1, symbol: "" },
			{ value: 1e3, symbol: "k" },
			{ value: 1e6, symbol: "M" },
			{ value: 1e9, symbol: "G" },
			{ value: 1e12, symbol: "T" },
			{ value: 1e15, symbol: "P" },
			{ value: 1e18, symbol: "E" }
		];
		const rx = /\.0+$|(\.[0-9]*[1-9])0+$/;
		var item = lookup.slice().reverse().find(function(item) {
			return num >= item.value;
		});
		return item ? (num / item.value).toFixed(digits).replace(rx, "$1") + item.symbol : "0";
	}

	async function blueBuildLoad(button){
		const chevron = document.getElementById(button)?.getElementsByClassName("fa")[0].classList;
		// @ts-ignore
		const scoreboard = document.getElementById(button+"-indepth")?.classList;
		if (chevron?.contains("rotate-0")) {
			
			// @ts-ignore
			document.getElementById(button).getElementsByClassName("fa")[0].classList.remove("rotate-0");
			// @ts-ignore
			document.getElementById(button).getElementsByClassName("fa")[0].classList.add("rotate-90");
		} else {
			// @ts-ignore
			document.getElementById(button).getElementsByClassName("fa")[0].classList.remove("rotate-90");
			// @ts-ignore
			document.getElementById(button).getElementsByClassName("fa")[0].classList.add("rotate-0");

		}

		if (scoreboard?.contains("max-h-0")) {
			document.getElementById(button+"-indepth")?.classList.remove("max-h-0");
			document.getElementById(button+"-indepth")?.classList.add("max-h-[1000px]");
			document.getElementById(button+"-indepth")?.classList.add("mb-2");
		} else {
			document.getElementById(button+"-indepth")?.classList.remove("mb-2");
			document.getElementById(button+"-indepth")?.classList.remove("max-h-[1000px]");
			document.getElementById(button+"-indepth")?.classList.add("max-h-0");
		}
		if (button in builds){
		}
		else{
			let build = await buildLoad(gameId, button, builds)
			builds[button] = build
			builds = builds;
		}

		if (button in builds){
			console.log(button)
		}
		buildLoaded[button] = true
		console.log(builds[button])
		console.log(builds)
	}

	async function redBuildLoad(button){
		const chevron = document.getElementById(button)?.getElementsByClassName("fa")[0].classList;
		// @ts-ignore
		const scoreboard = document.getElementById(button+"-indepth")?.classList;
		if (chevron?.contains("rotate-0")) {
			
			// @ts-ignore
			document.getElementById(button).getElementsByClassName("fa")[0].classList.remove("rotate-0");
			// @ts-ignore
			document.getElementById(button).getElementsByClassName("fa")[0].classList.add("-rotate-90");
		} else {
			// @ts-ignore
			document.getElementById(button).getElementsByClassName("fa")[0].classList.remove("-rotate-90");
			// @ts-ignore
			document.getElementById(button).getElementsByClassName("fa")[0].classList.add("rotate-0");

		}

		if (scoreboard?.contains("max-h-0")) {
			document.getElementById(button+"-indepth")?.classList.remove("max-h-0");
			document.getElementById(button+"-indepth")?.classList.add("max-h-[1000px]");
			document.getElementById(button+"-indepth")?.classList.add("mb-2");
		} else {
			document.getElementById(button+"-indepth")?.classList.remove("mb-2");
			document.getElementById(button+"-indepth")?.classList.remove("max-h-[1000px]");
			document.getElementById(button+"-indepth")?.classList.add("max-h-0");
		}

		if (button in builds){
		}
		else{
			let build = await buildLoad(gameId, button, builds)
			builds[button] = build
			builds = builds;
		}

		if (button in builds){
			console.log(button)
		}
		buildLoaded[button] = true
		console.log(builds[button])
		console.log(builds)
	}
	

</script>

<main class="bg-slate-800 flex h-full flex-row overflow-auto">
	<Layout/>
	<div class="flex w-5/6 h-full flex-col">
		<div class="flex w-full h-48 bg-slate-950 relative">
			{#await loadheader() then data}
				<div class="w-1/2 flex h-full relative">		
					<img src="./TeamIconsLarge/{teams[0]["name"]}.webp" alt="" class="w-full rounded-lg h-full object-none opacity-60 object-right">		
				</div>
				<div class="w-1/2 flex h-full relative">			
					<img src="./TeamIconsLarge/{teams[1]["name"]}.webp" alt="" class="w-full rounded-lg h-full object-none opacity-60 object-left">			
				</div>
				<div class="h-48 w-full flex absolute flex-col">
					<div class="flex w-full h-1/6 items-center justify-center text-slate-300 font-bold">
						<div>
							<p>{leagueName} {tournamentName}, {matchDateTime}</p>
						</div>
					</div>
					<div class="flex w-full h-1/6 items-center justify-center text-slate-300 font-bold text-5xl">
						<p>{teams[0]["name"].replace("_", " ")} {teams[0]["wins"]} - {teams[1]["wins"]} {teams[1]["name"].replace("_", " ")}</p>
					</div>
					<div class="flex w-full h-24 items-center justify-center text-slate-300 font-bold pt-2">	
						<div class="flex flex-col w-fit h-full  pr-2">
							<div class="flex flex-col w-fit h-1/3 justify-center items-center text-2xl">
							</div>
							<div class="flex flex-col w-full h-1/3 justify-center items-end text-lg">
								<p>{teams[0]["shortName"]}</p>
							</div>
							<div class="flex flex-col w-full h-1/3 justify-center items-end text-lg">
								<p>{teams[1]["shortName"]}</p>
							</div>
						</div>
						{#each resultInfo as result}
							{#if result["match"] != 0}
								<div class="flex flex-col w-8 h-full">
									<div class="flex flex-col w-8 h-1/3 justify-center items-center text-2lg border-b-slate-300 border-b-4">
										<p>{result["match"]}</p>
									</div>
									<div class="flex flex-col w-8 h-1/3 justify-center items-center">
										{#if result["winner"] == 0}
											{#if result["side"] == 100}
												<div class="rounded-full h-2/3 w-2/3 bg-blue-700 "></div>
											{:else}
												<div class="rounded-full h-2/3 w-2/3 bg-red-700 "></div>
											{/if}			
										{/if}
									</div>
									<div class="flex flex-col w-8 h-1/3 justify-center items-center">
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
			{/await}
			
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
		{#await loadScoreboard(gameId) then data}
			<div class = "flex w-full h-fit p-2 flex-col">
				<div class = "flex h-fit w-full flex-row">
					<div class="h-fit w-1/3 flex">

					</div>
					<div class="h-fit w-1/3 flex items-center flex-col">
						<div class = "text-2xl text-slate-300 font-bold">
							{Math.floor(scoreboard["gameDuration"]/60)}:{('0'+(scoreboard["gameDuration"] - (Math.floor(scoreboard["gameDuration"]/60)*60))).slice(-2)}
						</div>
					</div>
					<div class="h-fit w-1/3 flex justify-end text-lg text-slate-300 font-bold">
						Patch {scoreboard["gameVersion"]}
					</div>
				</div>
				<div class = "flex h-fit w-full pt-2 flex-row text-slate-300 font-semibold">
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
										<img src="./Icons/kills.webp
										" alt="" in:fly>
										<p class = "text-xl font-semibold pl-1">{scoreboard["teams"][0]["objectives"]["champion"]["kills"]}</p>
									</div> 
								</div>
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 flex flex-row py-1">
										<img src="./Icons/tower.webp
										" alt="" in:fly>
										<p class = "text-xl font-semibold pl-1">{scoreboard["teams"][0]["objectives"]["tower"]["kills"]}</p>
									</div>								 
								</div>
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 flex flex-row py-1">
										<img src="./Icons/inhib.webp
										" alt="" in:fly>
										<p class = "text-xl font-semibold pl-1">{scoreboard["teams"][0]["objectives"]["inhibitor"]["kills"]}</p>
									</div>								 
								</div>
								
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 flex flex-row py-1">
										<img src="./Icons/dragon.webp
										" alt="" in:fly>
										<p class = "text-xl font-semibold pl-1">{scoreboard["teams"][0]["objectives"]["dragon"]["kills"]}</p>
									</div>
								</div>
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 flex flex-row py-1">
										<img src="./Icons/rift_herald.webp
										" alt="" in:fly>
										<p class = "text-xl font-semibold pl-1">{scoreboard["teams"][0]["objectives"]["riftHerald"]["kills"]}</p>
									</div>							 
								</div>
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 flex flex-row py-1">
										<img src="./Icons/baron.webp
										" alt="" in:fly>
										<p class = "text-xl font-semibold pl-1">{scoreboard["teams"][0]["objectives"]["baron"]["kills"]}</p>
									</div> 
								</div>
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 flex flex-row py-1">
										<img src="./Icons/gold.webp
										" alt="" in:fly>
										<p class = "text-xl font-semibold pl-1">{nFormatter(scoreboard["teams"][0]["objectives"]["gold"], 1)}</p>
									</div>  
								</div>
							</div>
						</div>
						<div class = "flex flex-row h-4 w-full mb-1">
							<div class = "flex h-fit w-1/6"></div>
							<div class = "flex h-fit w-1/6"></div>
							<div class = "flex h-fit w-1/6"></div>
							<div class = "flex h-fit w-1/6">
								{#each scoreboard["teams"][0]["objectives"]["dragon"]["types"] as type}
									<div class="h-4 w-4">
										<img src="./Icons/{type}.webp
										" alt="" in:fly>
									</div>
								{/each}
							</div>
							<div class = "flex h-fit w-1/6"></div>
							<div class = "flex h-fit w-1/6"></div>
							<div class = "flex h-fit w-1/6"></div>
						</div>
						{#each blueSide as blue}
							<div class = "flex w-full h-28 flex-row justify-end">
								<div class = "h-full w-14 bg-slate-950 rounded-l-lg hover:bg-slate-600 justify-center items-center">
									<button on:click={blueBuildLoad(blue["summonerName"])} class="rounded-l-lg h-full w-full hover:bg-slate-600 flex justify-center items-center" id = "{blue["summonerName"]}">
										<i class="fa fa-chevron-right h-fit w-fit rotate-0 duration-200 transition-transform ease-in-out" style="font-size:36px;color:rgb(185 28 28)"></i>
									</button>
								</div>
								<div class = "flex h-full w-fit flex-col">
									<div class = "flex h-1/2 w-full flex-row justify-end">
										<div class = "w-[52px] h-full border-t-[4px] border-slate-950 overflow-hidden">
											<img src="./itemIcons/{String(blue["items0"])}.webp
											" alt="" in:fly>
										</div>
										<div class = "w-[52px] h-full border-t-[4px] border-slate-950 overflow-hidden">
											<img src="./itemIcons/{String(blue["items1"])}.webp
											" alt="" in:fly>
										</div>
										<div class = "w-[52px] h-full border-t-[4px] border-slate-950 overflow-hidden">
											<img src="./itemIcons/{String(blue["items2"])}.webp
											" alt="" in:fly>
										</div>
										<div class = "flex w-80 h-full flex-row justify-between border-t-[4px] border-slate-950">
											<div class = "w-[52px] h-full overflow-hidden">
												<img class = "object-contain" src="./itemIcons/{String(blue["items6"])}.webp
												" alt="" in:fly>
											</div>
											<div class = "flex w-fit items-center pr-2 text-3xl font-semibold">
												{blue["summonerName"]}
											</div>
										</div>
										<div class = "w-[52px] h-full border-t-[4px] border-slate-950 overflow-hidden">
											<img src="./summonerIcons/{String(blue["summoners"]["sum1"])}.webp
											" alt="" in:fly>
										</div>
										<div class = "w-[52px] h-full border-t-[4px] border-slate-950 overflow-hidden">
											<img src="./runeIcons/{String(blue["perks"]["styles"][0]["selections"][0]["perk"])}.webp
											" alt="" in:fly>
										</div>
									</div>
									<div class = "flex h-1/2 w-full flex-row justify-end">
										<div class = "w-[52px] h-full border-b-[4px] border-slate-950 overflow-hidden">
											<img src="./itemIcons/{String(blue["items3"])}.webp
											" alt="" in:fly>
										</div>
										<div class = "w-[52px] h-full border-b-[4px] border-slate-950 overflow-hidden">
											<img src="./itemIcons/{String(blue["items4"])}.webp
											" alt="" in:fly>
										</div>
										<div class = "w-[52px] h-full border-b-[4px] border-slate-950 overflow-hidden">
											<img src="./itemIcons/{String(blue["items5"])}.webp
											" alt="" in:fly>
										</div>
										<div class = "w-80 h-full flex flex-row border-b-[4px] divide-x-2 border-slate-950 divide-slate-950">
											<div class = "w-4/12 h-full text-3xl font-semibold flex items-center justify-center ">{nFormatter(blue["goldEarned"], 1)}</div>
											<div class = "w-3/12 h-full text-3xl font-semibold flex items-center justify-center ">{blue["cs"]}</div>
											<div class = "w-5/12 h-full text-3xl font-semibold flex items-center justify-center">{blue["kills"]}/{blue["deaths"]}/{blue["assists"]}</div>
										</div>
										<div class = "w-[52px] h-full border-b-[4px] border-slate-950 justify-center overflow-hidden">
											<img class = ""src="./summonerIcons/{String(blue["summoners"]["sum2"])}.webp
											" alt="" in:fly>
										</div>
										<div class = "w-[52px] h-full border-b-[4px] border-slate-950 flex justify-center items-center">
											<div class = "overflow-hidden">
												<img class = "" src="./runeIcons/{String(blue["perks"]["styles"][1]["style"]["id"])}.webp
												" alt="" in:fly>
											</div>
										</div>
									</div>
								</div>
								<div class="w-28 h-full border-[4px] border-r-4 border-slate-950">
									<img src="./champIcons/{String(blue["champId"])}.webp
									" alt="" in:fly>
								</div>
							</div>
							<div class = "flex flex-col h-fit max-h-0 w-11/12 self-end mr-4 bg-slate-950 duration-300 rounded-b-lg overflow-hidden" id = "{blue["summonerName"]}-indepth">
								{#key buildLoaded[blue["summonerName"]]}
									{#if (blue["summonerName"] in builds)}
										<div class = "w-full h-fit flex flex-row my-2 ml-4 pr-4">
											<div class = "flex flex-row space-x-1 w-full justify-center">
												<div class = "w-fit h-fit flex space-x-2">
													<div class = "w-max h-full flex flex-col object-center self-center space-y-4 justify-between">
														<div class = "flex justify-center">
															<img src="./runeIcons/{builds[blue["summonerName"]]["runes"]["styles"][0]["style"]["id"]}.webp" alt="" class = "w-8 h-8">
														</div>
														{#each builds[blue["summonerName"]]["runes"]["styles"][0]["selections"] as rune}
															<div class = "flex flex-row space-x-1">
																<div class = "self-center">
																	<img src="./runeIcons/{rune["perk"]}.webp" alt="" class = "w-8 h-8">
																</div>
																<div>
																	{#each Object.entries(rune["stats"]) as [name, value]}
																		{name}: {value} <br>
																	{/each}
																</div>
															</div>
														{/each}																												
													</div>
													<div class = "w-fit h-full space-y-2">
														<div class = "flex flex-col space-y-2">
															<div class = "flex flex-row justify-center object-center">
																<div><img src="./runeIcons/{builds[blue["summonerName"]]["runes"]["styles"][1]["style"]["id"]}.webp" alt="" class = "w-8 h-8"></div>
															</div>
															{#each builds[blue["summonerName"]]["runes"]["styles"][1]["selections"] as rune}
																<div class = "flex flex-row space-x-1">
																	<div class = "self-center">
																		<img src="./runeIcons/{rune["perk"]}.webp" alt="" class = "w-8 h-8">
																	</div>
																	<div>
																		{#each Object.entries(rune["stats"]) as [name, value]}
																			{name}: {value} <br>
																		{/each}
																	</div>
																</div>
															{/each}													
														</div>
														<div class = "flex flex-col my-auto">
															<div class = "flex flex-row ">
																<div><img src="./runeIcons/{builds[blue["summonerName"]]["runes"]["statPerks"]["offense"]["id"]}.webp" alt="" class = "w-8 h-8"></div>
																
															</div>
															<div class = "flex flex-row ">
																<div><img src="./runeIcons/{builds[blue["summonerName"]]["runes"]["statPerks"]["flex"]["id"]}.webp" alt="" class = "w-8 h-8"></div>
																
															</div>
															<div class = "flex flex-row ">
																<div><img src="./runeIcons/{builds[blue["summonerName"]]["runes"]["statPerks"]["defense"]["id"]}.webp" alt="" class = "w-8 h-8"></div>
																
															</div>
														</div>								
													</div>
												</div>
											</div>																		
										</div>
										<div class = "flex w-full h-fit my-2 mx-4">
											<div class = "flex w-full h-fit mr-2">
												<div class = "flex flex-wrap m-2 mr-4"> 
													{#each Object.entries(builds[blue["summonerName"]]["buildOrder"]) as [time, items]}
														<div class = "flex flex-row rounded-lg bg-slate-600 h-fit w-fit my-1">
															<div class = "mx-1 justify-center items-center font-semibold text-lg">
																{time}
															</div>
															{#each items["bought"] as item}
																<img src="./itemIcons/{item}.webp" alt="" class = "w-8 h-8">
															{/each}	
															{#each items["sold"] as item}
																<img src="./itemIcons/{item}.webp" alt="" class = "w-8 h-8" style= "filter:sepia(1)">
															{/each}																
														</div>	
														{#if time != Object.entries(builds[blue["summonerName"]]["buildOrder"])[Object.entries(builds[blue["summonerName"]]["buildOrder"]).length-1][0]}																	
															<div class = "flex w-fit h-8 items-center my-1">
																<div class = "flex flex-row rounded-lg bg-slate-600 h-6 w-6 mx-2 justify-center" >
																	<div class = "h-fit w-fit object-center">
																		<i class="fa fa-chevron-right h-fit w-fit" style="font-size:20px,color:rgb(185 28 28)"></i>
																	</div>														
																</div>
															</div>		
														{/if}												
													{/each}																																						
												</div>
											</div>		
										</div>
										<div class = "flex flex-row w-full h-fit my-2 mx-4 justify-center space-x-1">
											<div>
												<div class = "h-8 w-8 items-center justify-center flex font-semibold">

												</div>
												<div class = "h-8 w-8 items-center justify-center flex font-semibold">
													Q
												</div>
												<div class = "h-8 w-8 items-center justify-center flex font-semibold">
													W
												</div>
												<div class = "h-8 w-8 items-center justify-center flex font-semibold">
													E
												</div>
												<div class = "h-8 w-8 items-center justify-center flex font-semibold">
													R
												</div>
											</div>
											{#each builds[blue["summonerName"]]["skillOrder"] as ability, level}
												<div>
													<div class = "h-8 w-8">
														{level + 1}
													</div>
													<div class = "h-8 w-8">
														<div>
															{#if ability == "Q"}
																<div class = "bg-slate-700 h-8 w-8 rounded-lg items-center justify-center flex font-semibold text-blue-600">
																	Q
																</div>

															{/if}
														</div>
													</div>
													<div class = "h-8 w-8">
														<div>
															{#if ability == "W"}
																<div class = "bg-slate-700 h-8 w-8 rounded-lg items-center justify-center flex font-semibold text-green-600">
																	W
																</div>

															{/if}
														</div>
													</div>
													<div class = "h-8 w-8">
														<div>
															{#if ability == "E"}
																<div class = "bg-slate-700 h-8 w-8 rounded-lg items-center justify-center flex font-semibold text-orange-600">
																	E
																</div>

															{/if}
														</div>
													</div>
													<div class = "h-8 w-8">
														<div>
															{#if ability == "R"}
																<div class = "bg-slate-700 h-8 w-8 rounded-lg items-center justify-center flex font-semibold">
																	R
																</div>

															{/if}
														</div>
													</div>
												</div>												
											{/each}
										</div>
									{/if}										
								{/key}															
							</div>
						{/each}						
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
										<img src="./Icons/kills.webp
										" alt="" in:fly>
										<p class = "text-xl font-semibold pl-1">{scoreboard["teams"][1]["objectives"]["champion"]["kills"]}</p>
									</div> 
								</div>
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 flex flex-row py-1">
										<img src="./Icons/tower.webp
										" alt="" in:fly>
										<p class = "text-xl font-semibold pl-1">{scoreboard["teams"][1]["objectives"]["tower"]["kills"]}</p>
									</div>								 
								</div>	
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 flex flex-row py-1">
										<img src="./Icons/inhib.webp
										" alt="" in:fly>
										<p class = "text-xl font-semibold pl-1">{scoreboard["teams"][1]["objectives"]["inhibitor"]["kills"]}</p>
									</div>								 
								</div>
								
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 flex flex-row py-1">
										<img src="./Icons/dragon.webp
										" alt="" in:fly>
										<p class = "text-xl font-semibold pl-1">{scoreboard["teams"][1]["objectives"]["dragon"]["kills"]}</p>
									</div>
								</div>
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 flex flex-row py-1">
										<img src="./Icons/rift_herald.webp
										" alt="" in:fly>
										<p class = "text-xl font-semibold pl-1">{scoreboard["teams"][1]["objectives"]["riftHerald"]["kills"]}</p>
									</div>							 
								</div>
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 flex flex-row py-1">
										<img src="./Icons/baron.webp
										" alt="" in:fly>
										<p class = "text-xl font-semibold pl-1">{scoreboard["teams"][1]["objectives"]["baron"]["kills"]}</p>
									</div> 
								</div>
							</div>
							<div class = "flex h-fit w-1/6">
								<div class = "bg-slate-950 rounded">
									<div class = "px-2 flex flex-row py-1">
										<img src="./Icons/gold.webp
										" alt="" in:fly>
										<p class = "text-xl font-semibold pl-1">{nFormatter(scoreboard["teams"][1]["objectives"]["gold"], 1)}</p>
									</div>  
								</div>
							</div>
						</div>
						<div class = "flex flex-row h-4 w-full mb-1">
							<div class = "flex h-fit w-1/6"></div>
							<div class = "flex h-fit w-1/6"></div>
							<div class = "flex h-fit w-1/6"></div>
							<div class = "flex h-fit w-1/6">
								{#each scoreboard["teams"][1]["objectives"]["dragon"]["types"] as type}
									<div class="h-4 w-4">
										<img src="./Icons/{type}.webp
										" alt="" in:fly>
									</div>
								{/each}
							</div>
							<div class = "flex h-fit w-1/6"></div>
							<div class = "flex h-fit w-1/6"></div>
							<div class = "flex h-fit w-1/6"></div>
						</div>
						{#each redSide as red}
							<div class = "flex w-full h-28 flex-row-reverse justify-end">
								<div class = "h-full w-14 bg-slate-950 rounded-r-lg hover:bg-slate-600 justify-center items-center">
									<button on:click={redBuildLoad(red["summonerName"])} class="rounded-r-lg h-full w-full hover:bg-slate-600 flex justify-center items-center" id = "{red["summonerName"]}">
										<i class="fa fa-chevron-left h-fit w-fit rotate-0 duration-200 transition-transform ease-in-out" style="font-size:36px;color:rgb(185 28 28)"></i>
									</button>
								</div>
								<div class = "flex h-full w-fit flex-col justify-end">
									<div class = "flex h-1/2 w-full flex-row-reverse justify-end">
										<div class = "w-[52px] h-full border-t-[4px] border-slate-950">
											<img src="./itemIcons/{String(red["items0"])}.webp
											" alt="" in:fly>
										</div>
										<div class = "w-[52px] h-full border-t-[4px] border-slate-950">
											<img src="./itemIcons/{String(red["items1"])}.webp
											" alt="" in:fly>
										</div>
										<div class = "w-[52px] h-full border-t-[4px] border-slate-950">
											<img src="./itemIcons/{String(red["items2"])}.webp
											" alt="" in:fly>
										</div>
										<div class = "flex w-80 h-full flex-row justify-between border-t-[4px] border-slate-950">
											<div class = "w-[52px] h-full">
												<img class = "object-contain" src="./itemIcons/{String(red["items6"])}.webp
												" alt="" in:fly>
											</div>
											<div class = "flex w-fit items-center pr-2 text-3xl font-semibold">
												{red["summonerName"]}
											</div>
										</div>
										<div class = "w-[52px] h-full border-t-[4px] border-slate-950">
											<img src="./summonerIcons/{String(red["summoners"]["sum1"])}.webp
											" alt="" in:fly>
										</div>
										<div class = "w-[52px] h-full border-t-[4px] border-slate-950">
											<img src="./runeIcons/{String(red["perks"]["styles"][0]["selections"][0]["perk"])}.webp
											" alt="" in:fly>
										</div>
									</div>
									<div class = "flex h-1/2 w-full flex-row-reverse justify-end">
										<div class = "w-[52px] h-full border-b-[4px] border-slate-950">
											<img src="./itemIcons/{String(red["items3"])}.webp
											" alt="" in:fly>
										</div>
										<div class = "w-[52px] h-full border-b-[4px] border-slate-950">
											<img src="./itemIcons/{String(red["items4"])}.webp
											" alt="" in:fly>
										</div>
										<div class = "w-[52px] h-full border-b-[4px] border-slate-950">
											<img src="./itemIcons/{String(red["items5"])}.webp
											" alt="" in:fly>
										</div>
										<div class = "w-80 h-full flex flex-row border-b-[4px] divide-x-2 border-slate-950 divide-slate-950">
											<div class = "w-4/12 h-full text-3xl font-semibold flex items-center justify-center ">{nFormatter(red["goldEarned"], 1)}</div>
											<div class = "w-3/12 h-full text-3xl font-semibold flex items-center justify-center ">{red["cs"]}</div>
											<div class = "w-5/12 h-full text-3xl font-semibold flex items-center justify-center">{red["kills"]}/{red["deaths"]}/{red["assists"]}</div>
										</div>
										<div class = "w-[52px] h-full border-b-[4px] border-slate-950 justify-center">
											<img class = ""src="./summonerIcons/{String(red["summoners"]["sum2"])}.webp
											" alt="" in:fly>
										</div>
										<div class = "w-[52px] h-full border-b-[4px] border-slate-950 flex justify-center items-center">
											<div>
												<img class = "" src="./runeIcons/{String(red["perks"]["styles"][1]["style"]["id"])}.webp
												" alt="" in:fly>
											</div>
										</div>
									</div>
								</div>
								<div class="w-28 h-full border-[4px] border-l-4 border-slate-950">
									<img src="./champIcons/{String(red["champId"])}.webp
									" alt="" in:fly>
								</div>								
							</div>
							<div class = "flex w-11/12 ml-4 h-fit max-h-0 bg-slate-950 duration-300 rounded-b-lg overflow-hidden" id = "{red["summonerName"]}-indepth">
								{#key buildLoaded[red["summonerName"]]}
									{#if (red["summonerName"] in builds)}
										<div class = "w-full h-fit flex flex-col my-2 ml-4 pr-4">
											<div class = "flex flex-row space-x-1 w-full justify-center">
												<div class = "w-fit h-fit flex space-x-2">
													<div class = "w-max h-full flex flex-col object-center self-center space-y-4 justify-between">
														<div class = "flex justify-center">
															<img src="./runeIcons/{builds[red["summonerName"]]["runes"]["styles"][0]["style"]["id"]}.webp" alt="" class = "w-8 h-8">
														</div>
														{#each builds[red["summonerName"]]["runes"]["styles"][0]["selections"] as rune}
															<div class = "flex flex-row space-x-1">
																<div class = "self-center">
																	<img src="./runeIcons/{rune["perk"]}.webp" alt="" class = "w-8 h-8">
																</div>
																<div>
																	{#each Object.entries(rune["stats"]) as [name, value]}
																		{name}: {value} <br>
																	{/each}
																</div>
															</div>
														{/each}																												
													</div>
													<div class = "w-fit h-full space-y-2">
														<div class = "flex flex-col space-y-2">
															<div class = "flex flex-row justify-center object-center">
																<div><img src="./runeIcons/{builds[red["summonerName"]]["runes"]["styles"][1]["style"]["id"]}.webp" alt="" class = "w-8 h-8"></div>
															</div>
															{#each builds[red["summonerName"]]["runes"]["styles"][1]["selections"] as rune}
																<div class = "flex flex-row space-x-1">
																	<div class = "self-center">
																		<img src="./runeIcons/{rune["perk"]}.webp" alt="" class = "w-8 h-8">
																	</div>
																	<div>
																		{#each Object.entries(rune["stats"]) as [name, value]}
																			{name}: {value} <br>
																		{/each}
																	</div>
																</div>
															{/each}													
														</div>
														{#if gameType == "Official"}
															<div class = "flex flex-col my-auto">
																<div class = "flex flex-row ">
																	<div><img src="./runeIcons/{builds[red["summonerName"]]["runes"]["statPerks"]["offense"]["id"]}.webp" alt="" class = "w-8 h-8"></div>
																	
																</div>
																<div class = "flex flex-row ">
																	<div><img src="./runeIcons/{builds[red["summonerName"]]["runes"]["statPerks"]["flex"]["id"]}.webp" alt="" class = "w-8 h-8"></div>
																	
																</div>
																<div class = "flex flex-row ">
																	<div><img src="./runeIcons/{builds[red["summonerName"]]["runes"]["statPerks"]["defense"]["id"]}.webp" alt="" class = "w-8 h-8"></div>
																	
																</div>
															</div>		
														{/if}																				
													</div>
												</div>
											</div>
											<div class = "flex w-full h-fit my-2 mx-4">
												<div class = "flex w-full h-fit mr-2">
													<div class = "flex flex-wrap m-2 mr-4"> 
														{#each Object.entries(builds[red["summonerName"]]["buildOrder"]) as [time, items]}
															<div class = "flex flex-row rounded-lg bg-slate-600 h-fit w-fit my-1">
																<div class = "mx-1 justify-center items-center font-semibold text-lg">
																	{time}
																</div>
																{#each items["bought"] as item}
																	<img src="./itemIcons/{item}.webp" alt="" class = "w-8 h-8">
																{/each}	
																{#each items["sold"] as item}
																	<img src="./itemIcons/{item}.webp" alt="" class = "w-8 h-8" style= "filter:sepia(1)">
																{/each}																
															</div>	
															{#if time != Object.entries(builds[red["summonerName"]]["buildOrder"])[Object.entries(builds[red["summonerName"]]["buildOrder"]).length-1][0]}																	
																<div class = "flex w-fit h-8 items-center my-1">
																	<div class = "flex flex-row rounded-lg bg-slate-600 h-6 w-6 mx-2 justify-center" >
																		<div class = "h-fit w-fit object-center">
																			<i class="fa fa-chevron-right h-fit w-fit" style="font-size:20px,color:rgb(185 28 28)"></i>
																		</div>														
																	</div>
																</div>		
															{/if}												
														{/each}																																						
													</div>
												</div>		
											</div>
											<div class = "flex flex-row w-full h-fit my-2 mx-4 justify-center space-x-1">
												<div>
													<div class = "h-8 w-8 items-center justify-center flex font-semibold">
	
													</div>
													<div class = "h-8 w-8 items-center justify-center flex font-semibold">
														Q
													</div>
													<div class = "h-8 w-8 items-center justify-center flex font-semibold">
														W
													</div>
													<div class = "h-8 w-8 items-center justify-center flex font-semibold">
														E
													</div>
													<div class = "h-8 w-8 items-center justify-center flex font-semibold">
														R
													</div>
												</div>
												{#each builds[red["summonerName"]]["skillOrder"] as ability, level}
													<div>
														<div class = "h-8 w-8">
															{level + 1}
														</div>
														<div class = "h-8 w-8">
															<div>
																{#if ability == "Q"}
																	<div class = "bg-slate-700 h-8 w-8 rounded-lg items-center justify-center flex font-semibold text-blue-600">
																		Q
																	</div>
	
																{/if}
															</div>
														</div>
														<div class = "h-8 w-8">
															<div>
																{#if ability == "W"}
																	<div class = "bg-slate-700 h-8 w-8 rounded-lg items-center justify-center flex font-semibold text-green-600">
																		W
																	</div>
	
																{/if}
															</div>
														</div>
														<div class = "h-8 w-8">
															<div>
																{#if ability == "E"}
																	<div class = "bg-slate-700 h-8 w-8 rounded-lg items-center justify-center flex font-semibold text-orange-600">
																		E
																	</div>
	
																{/if}
															</div>
														</div>
														<div class = "h-8 w-8">
															<div>
																{#if ability == "R"}
																	<div class = "bg-slate-700 h-8 w-8 rounded-lg items-center justify-center flex font-semibold">
																		R
																	</div>
	
																{/if}
															</div>
														</div>
													</div>												
												{/each}
											</div>									
										</div>
									{/if}										
								{/key}
							</div>
						{/each}
					</div>
				</div>
			</div>
		{/await}
	</div>
</main>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

