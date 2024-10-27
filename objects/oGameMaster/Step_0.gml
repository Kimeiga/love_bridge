// Step Event of oGameMaster
if (!game_won) {
    if (instance_exists(boy) && instance_exists(girl) && 
        instance_exists(boy_goal) && instance_exists(girl_goal)) {
        
        // Check if both characters are touching their respective goals
        if (place_meeting(boy.x, boy.y, boy_goal) && 
            place_meeting(girl.x, girl.y, girl_goal)) {
            game_won = true;
        }
    }
}