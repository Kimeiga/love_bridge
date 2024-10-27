// Step Event of oBridge
boy = instance_find(oBoy, 0);
girl = instance_find(oGirl, 0);
if (instance_exists(boy) && instance_exists(girl)) {
    if (victory_sequence) {
        if (bridge_solid) {
            if (!characters_moving) {
                // Calculate center meeting point
                meet_point_x = (boy.x + girl.x) / 2;
                meet_point_y = (boy.y + girl.y) / 2;
                
                // Calculate points 90% of the way to center for each character
                var lerp_amount = 0.98; // Adjust this to change how close they get
                boy_target_x = lerp(boy.x, meet_point_x, lerp_amount);
                boy_target_y = lerp(boy.y, meet_point_y, lerp_amount);
                girl_target_x = lerp(girl.x, meet_point_x, lerp_amount);
                girl_target_y = lerp(girl.y, meet_point_y, lerp_amount);
                
                characters_moving = true;
            }
            
            // Move characters towards their target points
            var move_speed = 2;
            var boy_dist = point_distance(boy.x, boy.y, boy_target_x, boy_target_y);
            var girl_dist = point_distance(girl.x, girl.y, girl_target_x, girl_target_y);
            
            if (boy_dist > 2) {
                boy.x += lengthdir_x(move_speed, point_direction(boy.x, boy.y, boy_target_x, boy_target_y));
                boy.y += lengthdir_y(move_speed, point_direction(boy.x, boy.y, boy_target_x, boy_target_y));
            }
            
            if (girl_dist > 2) {
                girl.x += lengthdir_x(move_speed, point_direction(girl.x, girl.y, girl_target_x, girl_target_y));
                girl.y += lengthdir_y(move_speed, point_direction(girl.x, girl.y, girl_target_x, girl_target_y));
            }
            
            // When both reach their targets, show heart
            if (boy_dist <= 2 && girl_dist <= 2) {
                heart_visible = true;
            }
        }
    } else {
        // Normal bridge logic
        if (damage_cooldown > 0) {
            damage_cooldown -= 1;
            if (damage_cooldown mod 5 == 0) {
                flash_visible = !flash_visible;
            }
        } else {
            flash_visible = true;
        }
        
        // Check for enemy crossing the line
        var _enemy = collision_line(boy.x, boy.y, girl.x, girl.y, oEnemy, false, true);
        
        if (_enemy != noone && damage_cooldown <= 0) {
            health_state = max(0, health_state - 1);
            damage_cooldown = 60;
            flash_visible = false;
        }
    }
}