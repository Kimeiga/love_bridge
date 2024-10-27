// In start_victory_sequence function
function start_victory_sequence() {
    victory_sequence = true;
    bridge_solid = true;
    flash_visible = true;
    // Store the final positions when victory is achieved
    if (instance_exists(boy) && instance_exists(girl)) {
        final_boy_x = boy.x;
        final_boy_y = boy.y;
        final_girl_x = girl.x;
        final_girl_y = girl.y;
    }
}

// Draw Event of oBridge
if (instance_exists(boy) && instance_exists(girl)) {
    if (flash_visible || bridge_solid) {
        // Use stored positions if bridge is solid, otherwise use current positions
        var start_x = bridge_solid ? final_boy_x : boy.x;
        var start_y = bridge_solid ? final_boy_y : boy.y;
        var end_x = bridge_solid ? final_girl_x : girl.x;
        var end_y = bridge_solid ? final_girl_y : girl.y;
        
        var line_length = point_distance(start_x, start_y, end_x, end_y);
        var line_angle = point_direction(start_x, start_y, end_x, end_y);
        var sprite_size = sprite_get_width(sBridgeTile);
        var num_tiles = ceil(line_length / sprite_size);
        
        // Draw tiling bridge sprites
        for (var i = 0; i < num_tiles; i++) {
            var pos_x = start_x + lengthdir_x(i * sprite_size, line_angle);
            var pos_y = start_y + lengthdir_y(i * sprite_size, line_angle);
            
            draw_sprite_ext(sBridgeTile, 0, 
                pos_x, pos_y, 
                1, 1, 
                line_angle,
                c_white,  // Don't color-blend the sprite
                bridge_solid ? 1 : 0.8
            );
        }
    }
    
    // Draw heart when characters meet
    if (heart_visible) {
        draw_sprite(sHeart, 0, meet_point_x, meet_point_y - 32);
    }
}