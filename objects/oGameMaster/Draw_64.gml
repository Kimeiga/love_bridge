

// Draw Event of oGameMaster
// Always check if this is the active instance before drawing
if (instance_exists(oGameMaster) && id == instance_find(oGameMaster, 0)) {
    if (show_continue_text && can_continue) {
        // Your drawing code here
		    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    draw_set_color(c_yellow);
    draw_text(room_width/2, room_height/2, "LEVEL CLEAR");
    
    if (can_continue && show_continue_text) {
        draw_set_color(c_white);
        draw_text(room_width/2, room_height - 50, "Press SPACE to continue");
    }
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    }
}