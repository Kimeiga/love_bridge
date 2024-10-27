// Step Event of oGameMaster
if (!game_won) {
    var boy_goal = instance_find(oBoyGoal, 0);
    var girl_goal = instance_find(oGirlGoal, 0);
    
    if (boy_goal && girl_goal) {
        boy_goal_touched = boy_goal.touching;
        girl_goal_touched = girl_goal.touching;
        
        if (boy_goal_touched && girl_goal_touched) {
            game_won = true;
            with(oPlayer) {
                can_move = false;
            }
            can_continue = true;
            show_continue_text = true;
            alarm[1] = 30;
            
            with(oBridge) {
                start_victory_sequence();
            }
        }
    }
}

if (game_won && can_continue) {
    if (keyboard_check_pressed(vk_space)) {
        next_level();
    }
}

if (keyboard_check_pressed(ord("N"))) {
    next_level();
}

function next_level() {
    current_level = (current_level + 1) % array_length(level_rooms);
    show_debug_message("Transitioning to level: " + string(current_level));
    
    // Reset states
    game_won = false;
    can_continue = false;
    show_continue_text = false;
    boy_goal_touched = false;
    girl_goal_touched = false;
    alarm[1] = -1;
    
    room_goto(level_rooms[current_level]);
}