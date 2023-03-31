<script>
	import Logo from './logo.svelte'
	import Hamburger from './hamburger.svelte'
	// @ts-ignore
	import Menu from './menu.svelte'
	
	export let sidebar = false
</script>

<header class="flex bg-gray-900 p-1 text-red-700">
	<nav class="flex">
		<Hamburger bind:open={sidebar}/>
		<Logo/>	
	</nav>
	<Menu/>
</header>