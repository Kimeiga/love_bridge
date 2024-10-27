// Get arrow key inputs
rightKey = keyboard_check(vk_right);
leftKey = keyboard_check(vk_left);
upKey = keyboard_check(vk_up);
downKey = keyboard_check(vk_down);

// Inherit the parent event (this runs all the movement code)
event_inherited();