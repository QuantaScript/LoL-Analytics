

<main class="bg-slate-800 flex h-full flex-row overflow-auto">
	<Layout/>
	<div class="h-full scroll flex flex-col mx-10 my-10 w-5/6 scrollbar-hide">
		<div class="flex flex-col mb-4">
			<div class="text-3xl font-bold text-red-700 mb-3">
				Stats
			</div>
			<div class="flex w-fill h-auto">
				<div class="flex h-56 w-80 bg-slate-950 rounded-lg divide-solid divide-x-2 divide-slate-800">
					<div class="flex w-56 h-full text-8xl">
						<div class="h-fit m-auto">10th</div>
					</div>
					<div class="flex w-24 h-full divide-solid divide-y-2 divide-slate-800 flex-col">
						<div class="flex w-full h-1/2 bg-green-700 rounded-tr-lg text-6xl">
							<div class="h-fit m-auto">0</div>
						</div>
						<div class="flex w-full h-1/2 bg-red-700 rounded-br-lg text-6xl">
							<div class="h-fit m-auto">18</div>
						</div>
					</div>
				</div>
				<div class="flex w-auto h-56">

				</div>
			</div>
		</div>
		<div class="flex flex-col mb-4">
			<div class="text-3xl font-bold text-red-700 mb-3">
				Matches
			</div>
			<div class="flex w-full flex-col">
				<div class="flex w-full h-16 bg-slate-950 rounded-full">
					<div class="w-16 h-16 flex rounded-full">
						<button on:click={() => test("Match1")} class="rounded-full h-full w-full hover:bg-slate-700 flex justify-center items-center" id="Match1">
							<i class="fa fa-chevron-right" style="font-size:36px;color:rgb(185 28 28)"></i>
						</button>
					</div>
				</div>
				<div class="flex w-11/12 h-0 bg-slate-700 rounded-b-lg mx-auto duration-300 overflow-hidden" id="Match1-Scoreboard">
					test
				</div>
				<div class="flex w-full h-16 bg-slate-950 rounded-full mt-4">
					<div class="w-16 h-16 flex rounded-full">
						<button on:click={() => test("Match2")} class="rounded-full h-full w-full hover:bg-slate-700 flex justify-center items-center" id="Match2">
							<i class="fa fa-chevron-right" style="font-size:36px;color:rgb(185 28 28)"></i>
						</button>
					</div>
				</div>
				<div class="flex w-11/12 h-0 bg-slate-700 rounded-b-lg mx-auto duration-300 overflow-hidden" id="Match2-Scoreboard">
					test
				</div>
			</div>
		</div>
	</div>
</main>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
	.scrollbar-hide::-webkit-scrollbar {
    	display: none;
	}


	.scrollbar-hide {
    	-ms-overflow-style: none;
    	scrollbar-width: none;  
	}

</style>

<script>
	import { TestimonialPlaceholder } from 'flowbite-svelte';
	import Layout from '../Layout.svelte'
	import "../../app.css";

	// @ts-ignore
	function test(button){
		const chevron = document.getElementById(button)?.getElementsByClassName("fa")[0].classList;
		// @ts-ignore
		const scoreboard = document.getElementById(button+"-Scoreboard")?.classList;
		if (chevron?.contains("fa-chevron-right")) {
			
			// @ts-ignore
			document.getElementById(button).getElementsByClassName("fa")[0].classList.remove("fa-chevron-right");
			// @ts-ignore
			document.getElementById(button).getElementsByClassName("fa")[0].classList.add("fa-chevron-down");
		} else {
			// @ts-ignore
			document.getElementById(button).getElementsByClassName("fa")[0].classList.remove("fa-chevron-down");
			// @ts-ignore
			document.getElementById(button).getElementsByClassName("fa")[0].classList.add("fa-chevron-right");

		}

		if (scoreboard?.contains("h-0")) {
			document.getElementById(button+"-Scoreboard")?.classList.remove("h-0");
			document.getElementById(button+"-Scoreboard")?.classList.add("h-80");
		} else {
			document.getElementById(button+"-Scoreboard")?.classList.remove("h-80");
			document.getElementById(button+"-Scoreboard")?.classList.add("h-0");
		}

	}
	
</script>