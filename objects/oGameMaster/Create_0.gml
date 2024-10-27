// Create Event of oGameMaster
// Make sure there's only one game master
if (instance_number(oGameMaster) > 1) {
    instance_destroy();
    exit;
}

// Make the object persistent
persistent = true;

// Initialize all variables
game_won = false;
can_continue = false;
show_continue_text = false;
boy_goal_touched = false;
girl_goal_touched = false;
alarm[0] = -1;
alarm[1] = -1;

// Initialize room management
if (!variable_instance_exists(id, "current_level")) {
    current_level = 0;
    level_rooms = [room_first];
    var next_room = room_next(room_first);
    while (next_room != -1) {
        array_push(level_rooms, next_room);
        next_room = room_next(next_room);
    }
}

// Create a function to get the instance
function get_instance() {
    return instance_exists(oGameMaster) ? instance_find(oGameMaster, 0) : noone;
}