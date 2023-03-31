<script>
	export let open = false
	import {SidebarGroup, SidebarItem, SidebarWrapper, SidebarDropdownItem, SidebarDropdownWrapper } from 'flowbite-svelte';
</script>

<aside class="absolute bg-gray-900 shadow-lg" class:open>
	<SidebarWrapper>
		<SidebarGroup>
			<SidebarItem label="Scrims" class= "bg-gray-800 text-red-800 text-xl font-bold">
			</SidebarItem>
			<SidebarDropdownWrapper label="Scouting" class = "bg-gray-800 text-red-800 text-xl font-bold" btnClass = "flex items-center p-2 w-full text-base font-normal text-gray-900 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700">
				<SidebarDropdownWrapper label="EBL" class = "bg-gray-800 text-red-800 text-xl font-bold" btnClass = "flex items-center p-2 w-11/12 text-base font-normal text-gray-900 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700">
					<SidebarItem label="Overview" class= "bg-gray-800 text-red-800 text-xl font-bold" aClass = "flex items-center p-2 pl-11 w-10/12 text-base font-normal text-gray-900 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700"/>
					<SidebarDropdownWrapper label="Teams" class = "bg-gray-800 text-red-800 text-xl font-bold" btnClass = "flex items-center p-2 w-10/12 text-base font-normal text-gray-900 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700">
						<SidebarDropdownItem label="Diamant" class= "bg-gray-800 text-red-800 text-xl font-bold" aClass = "flex items-center p-2 pl-11 w-9/12 text-base font-normal text-gray-900 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700"/>
					</SidebarDropdownWrapper>
				</SidebarDropdownWrapper>
				<SidebarDropdownWrapper label="EMEA Masters" class = "bg-gray-800 text-red-800 text-xl font-bold" btnClass = "flex items-center p-2 w-11/12 text-base font-normal text-gray-900 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700">
					<SidebarItem label="Overview" class= "bg-gray-800 text-red-800 text-xl font-bold" aClass = "flex items-center p-2 pl-11 w-10/12 text-base font-normal text-gray-900 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700"/>
					<SidebarDropdownWrapper label="Teams" class = "bg-gray-800 text-red-800 text-xl font-bold" btnClass = "flex items-center p-2 w-10/12 text-base font-normal text-gray-900 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700">
						<SidebarDropdownItem label="Diamant" class= "bg-gray-800 text-red-800 text-xl font-bold" aClass = "flex items-center p-2 pl-11 w-9/12 text-base font-normal text-gray-900 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700"/>
					</SidebarDropdownWrapper>
				</SidebarDropdownWrapper>
			</SidebarDropdownWrapper>
		</SidebarGroup>
	</SidebarWrapper>
</aside>

<style>
	aside {
		left: -350px;
		transition: left 0.3s ease-in-out;
        width: 350px;
        height: 91.5%;
        top: 8.5%
	}
	.open {
		left: 0
	}

</style>