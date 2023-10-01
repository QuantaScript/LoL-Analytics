/** @type {import('./$types').PageLoad} */
import { PrismaClient } from '@prisma/client'


export async function load(){
    var Games = []
    try {
        let response = await fetch("http://localhost:8080/Matches?filter={%22teams.name%22:%22DSYRE%22}&sort={startTime:-1}&pagesize=6", 
            { 
            method: 'get', 
            headers: new Headers({
                'Authorization': 'Basic '+btoa("admin:secret")
            })}).then((x) => x.json());
        console.log(response)
        for (let i = 0; i < response.length; i++) {
            var Game = {"team": "", "wins": 0, "losses": 0, "date": "", "type": "", "id": ""}
            var OppId = "";    
            for (let j = 0; j < response[i]["teams"].length; j++) {
                if (response[i]["teams"][j]["name"] != "DSYRE") {
                    Game["team"] = response[i]["teams"][j]["name"].replace(" ", "_");
                    OppId = response[i]["teams"][j]["id"];
                }
            }
            for (let j = 0; j < response[i]["games"].length; j++) {
                if (response[i]["games"][j]["winnerTeamId"] == OppId) {
                    Game["losses"] = Game["losses"] + 1;
                }
                else{
                    Game["wins"] = Game["wins"] + 1;
                }
            }
            Game["type"] = response[i]["matchType"];
            let date = new Date(response[i]["startTime"]);
            Game["date"] = date.toLocaleDateString();
            Game["id"] = response[i]["id"];
            Games.push(Game);
        }
        //if (!response.ok) {
        
        //throw new Error(`Error! status: ${response.status}`);
        
        //}
    }
    catch (e){
        console.log("Error", e.stack);
        console.log("Error", e.name);
        console.log("Error", e.message);
    }    
    //console.log(Games)
    return Games;
};