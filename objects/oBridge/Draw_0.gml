// Draw Event of oBridge
if (instance_exists(boy) && instance_exists(girl)) {
    if (flash_visible) {
        draw_set_color(line_colors[health_state]);
        draw_line_width(boy.x, boy.y, girl.x, girl.y, 2);
    }
    draw_set_color(c_white);
}