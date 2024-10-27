// Draw Event of oGoal
draw_self();
// Glow effect when touching
if (touching) {
    draw_sprite_ext(sprite_index, image_index, x, y, 
        image_xscale * 1.2, image_yscale * 1.2, 
        image_angle, image_blend, 0.3);
}
