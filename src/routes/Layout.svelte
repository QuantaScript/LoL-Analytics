<script>
	import { page } from '$app/stores';
	import { Sidebar, SidebarGroup, SidebarItem, SidebarWrapper, SidebarDropdownWrapper, SidebarDropdownItem } from 'flowbite-svelte';
	$: activeUrl = $page.url.pathname
	let spanClass = 'flex-1 ml-3 whitespace-nowrap';
	import "../app.css";
</script>

<div class="flex flex-column w-1/5 h-full">
	<div class="w-full h-full bg-slate-950 flex flex-col">	
		<div class="sidebar-header outline-slate-800 flex">
			<img src="./TeamIcons/diamant.webp" alt="Diamant Logo" class="max-w-full max-h-full">
		</div>
		<div class="sidebar-main text outline-slate-800">
			<Sidebar>
				<SidebarWrapper>
				  <SidebarGroup>
					<SidebarItem label="Dashboard" class="text" aClass = "flex items-center p-2 text-base  text-2xl font-bold text-red-700 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700"/>
					<SidebarDropdownWrapper label="Scrims" class="text" btnClass = "flex items-center p-2 text-base text-2xl font-bold  text-red-700 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
					  <SidebarItem label="Products" href='/components/products' aClass = "flex items-center p-2 text-xl text-base font-bold  text-red-700 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700"/>
					  <SidebarItem label="Sidebar" href='/components/sidebar' aClass = "flex items-center p-2 text-xl text-base font-bold text-red-700 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700"/>
					</SidebarDropdownWrapper>
					<SidebarDropdownWrapper label="Scouting" btnClass = "flex items-center p-2 text-base  text-red-700 text-2xl font-bold rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
					  <SidebarItem label="Item 1" href='/components/item1' aClass = "flex items-center p-2 text-base text-xl font-bold  text-red-700 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700"/>
					  <SidebarItem label="Item 2" href='/components/item2' aClass = "flex items-center p-2 text-base text-xl font-bold  text-red-700 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700"/>
					</SidebarDropdownWrapper>
				  </SidebarGroup>
				</SidebarWrapper>
			  </Sidebar>
		</div>
		<div class="sidebar-footer outline-slate-800">
			<a href="https://twitter.com/ThatStatGuyZero" class="text-red-700">Created By Zero</a>
		</div>
	</div>
</div>

<svelte:head>
	<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet"/>
</svelte:head>
	
<style>
	:global(body) {
		padding: 0;
		height: 100vh;
	}	

	.sidebar-header{
		width: 100%;
		height: 15%;
		outline-width: 2px;
		outline-style: solid;
		display: flex;
		align-items: center;
	}

	.sidebar-main{
		width: 100%;
		height: 80%;
		outline-width: 2px;
		outline-style: solid;
	}

	.text {
		color: rgb(218, 0, 55);
	}

	.sidebar-footer{
		width: 100%;
		height: 5%;
		outline-width: 2px;
		outline-style: solid;
		display: flex;
		align-items: center;
	}

	img{
		margin: auto;
	}

	a{
		margin: auto;
		font-size: large;
		font-weight: bold;
	}
</style>
