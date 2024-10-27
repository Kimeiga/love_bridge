// Step Event of oBridge
boy = instance_find(oBoy, 0);
girl = instance_find(oGirl, 0);
if (instance_exists(boy) && instance_exists(girl)) {
    // Check for enemy crossing the line
    var _enemy = collision_line(boy.x, boy.y, girl.x, girl.y, oEnemy, false, true);
   
    // If enemy crosses and we're not in cooldown
    if (_enemy != noone && damage_cooldown <= 0) {
        health_state = max(0, health_state - 1);
        damage_cooldown = 60; // 1 second cooldown
        flash_visible = false; // Immediately turn off the line
    }
    
    // Decrease damage cooldown
    if (damage_cooldown > 0) {
        damage_cooldown -= 1;
        // Toggle visibility every 5 frames during cooldown
        if (damage_cooldown mod 5 == 0) {
            flash_visible = !flash_visible;
        }
    } else {
        flash_visible = true; // Always visible when not in cooldown
    }
}