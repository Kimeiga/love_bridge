// In oGoal Draw Event (if you want visual feedback):
draw_self();
// Maybe add a glow effect when character is on their goal:
if (place_meeting(x, y, object_index == oBoyGoal ? oBoy : oGirl)) {
    draw_sprite_ext(sprite_index, image_index, x, y, 
        image_xscale * 1.2, image_yscale * 1.2, 
        image_angle, image_blend, 0.3);
}