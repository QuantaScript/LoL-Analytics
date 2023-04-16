async function test(){
    try {
        let response = await fetch("http://localhost:5434/series").then((x) => x.json());
        console.log(response);
        
        //if (!response.ok) {
        
        //throw new Error(`Error! status: ${response.status}`);
        
        //}
    }
    catch{
        console.log("fuck")
    }    
};

export function GetRecentGames() {
    var Games = [{ "team": "diamant", "wins": 1, "losses": 0, "date": "06/4/23", "type": "Scrim" },
    { "team": "g2", "wins": 1, "losses": 0, "date": "06/4/23", "type": "Scrim" },
    { "team": "excel", "wins": 0, "losses": 1, "date": "06/4/23", "type": "Scrim" },
    { "team": "g2", "wins": 1, "losses": 0, "date": "06/4/23", "type": "Scrim" },
    { "team": "diamant", "wins": 1, "losses": 0, "date": "06/4/23", "type": "Official" }];
    //for (let i = 0; i < 5; i++){
    //    var image = document.getElementById("myImg").src
    //};
    //test();
    return Games;
};