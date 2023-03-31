<script>
	export let open = false
</script>

<button class="text-red-700 hover:text-gray-700 cursor-pointer mr-4 border-none focus:outline-none" class:open on:click={() => open = !open}>
	<svg width=40 height=30>
		<line id="top" x1=10 y1=2  x2=42 y2=2/>
		<line id="middle" x1=10 y1=12 x2=34 y2=12/>
		<line id="bottom" x1=10 y1=22 x2=42 y2=22/>
	</svg>
</button>

<style>
	svg {
		transition: transform 0.3s ease-in-out;
	}
	
	svg line {
		stroke: currentColor;
		stroke-width: 5;
		transition: transform 0.3s ease-in-out
	}
	
	button {
		z-index: 20;
	}
	
	.open #top {
		transform: translate(7px, -7px) rotate(45deg)
	}
	
	.open #middle {
		opacity: 0;
	}
	
  .open #bottom {
		transform: translate(-9px, 15px) rotate(-45deg)
	}
</style>