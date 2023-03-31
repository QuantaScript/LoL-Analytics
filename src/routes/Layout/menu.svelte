<script>
    var teams = [{team: "diamant", time: "1d:1h"}, {team: "diamant", time: "2d:2h"}, {team: "diamant", time: "3d:3h"}]
</script>

<div class="scrollmenu bg-gray-900">
    {#each teams as team}
        <div class="item">
            <img src="./TeamIcons/{team.team}.webp" alt="{team.team}"/>
            <span class="caption">{team.time}</span>
        </div>
    {/each}
</div> 

<style>
div.scrollmenu {
  overflow: auto;
  white-space: nowrap;
}

div.scrollmenu img {
  display: inline-block;
  color: white;
  text-align: center;
  text-decoration: none;
  width: 50px;
  height: 50px;
}

div.scrollmenu div:hover {
  background-color: #777;
}

.item {
    vertical-align: top;
    display: inline-block;
    text-align: center;
    width: 70px;
}
.caption {
    display: block;
    text-transform: uppercase;
    font-weight: bold;
}
</style>