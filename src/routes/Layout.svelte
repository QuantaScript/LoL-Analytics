<script>
	import { page } from '$app/stores';
	import { Sidebar, SidebarGroup, SidebarItem, SidebarWrapper, SidebarDropdownWrapper, SidebarDropdownItem } from 'flowbite-svelte';
	$: activeUrl = $page.url.pathname
	import "../app.css";
</script>

<div class="flex flex-column w-1/6 h-full overflow-hidden">
	<aside class="absolute w-1/6 h-full">
		<div class="w-full h-full bg-slate-950 flex flex-col">	
			<div class="sidebar-header outline-slate-800 flex">
				<img src="/TeamIcons/diamant.webp" alt="Diamant Logo" class="max-w-full max-h-full">
			</div>
			<div class="sidebar-main text outline-slate-800 overflow-auto">
				<Sidebar asideClass = "w-full">
					<SidebarWrapper>
					  <SidebarGroup>
						<SidebarItem label="Dashboard" href="/" aClass = "flex items-center p-2 text-base  text-2xl font-bold text-red-700 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700"/>
						<SidebarDropdownWrapper label="Scrims" btnClass = "flex items-center p-2 w-full text-base font-bold text-2xl text-red-700 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700">
						  	<SidebarItem label="Overview" href='/scrims/overview' aClass = "flex items-center p-2 text-xl text-base font-bold  text-red-700 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700"/>
						  	<SidebarItem label="Vods" href='/scrims/vods' aClass = "flex items-center p-2 text-xl text-base font-bold  text-red-700 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700"/>
						</SidebarDropdownWrapper>
						<SidebarDropdownWrapper label="Officials" btnClass = "flex items-center p-2 w-full text-base font-bold text-2xl text-red-700 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700">
							<SidebarItem label="Overview" href='/officials/overview' aClass = "flex items-center p-2 text-xl text-base font-bold  text-red-700 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700"/>
							<SidebarItem label="Vods" href='/officials/vods' aClass = "flex items-center p-2 text-xl text-base font-bold  text-red-700 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700"/>
						</SidebarDropdownWrapper>
						<SidebarDropdownWrapper label="Scouting" btnClass = "flex items-center p-2 w-full text-base font-bold text-2xl text-red-700 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700">
							<SidebarDropdownWrapper label="EBL" btnClass = "flex items-center p-2 w-full text-base font-bold text-xl text-red-700 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700">
								<SidebarItem label="Partizan Esports" href='' aClass = "flex items-center p-2 text-base text-lg font-bold  text-red-700 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700"/>
								<SidebarItem label="Crvena Zvezda" href='' aClass = "flex items-center p-2 text-base text-lg font-bold  text-red-700 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700"/>
								<SidebarItem label="Cyber Wolves" href='' aClass = "flex items-center p-2 text-base text-lg font-bold  text-red-700 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700"/>
								<SidebarItem label="Valiance" href='' aClass = "flex items-center p-2 text-base text-lg font-bold  text-red-700 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700"/>
								<SidebarItem label="MAGAZA" href='' aClass = "flex items-center p-2 text-base text-lg font-bold  text-red-700 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700"/>
								<SidebarItem label="ANKORA" href='' aClass = "flex items-center p-2 text-base text-lg font-bold  text-red-700 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700"/>
								<SidebarItem label="XtremeDominators" href='' aClass = "flex items-center p-2 text-base text-lg font-bold  text-red-700 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700"/>
							</SidebarDropdownWrapper>
						</SidebarDropdownWrapper>
					  </SidebarGroup>
					</SidebarWrapper>
				  </Sidebar>
			</div>
			<div class="sidebar-footer outline-slate-800">
				<a href="https://twitter.com/ThatStatGuyZero" class="text-red-700">Created By Zero</a>
			</div>
		</div>
	</aside>
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
