// Get WASD inputs
rightKey = keyboard_check(ord("D"));
leftKey = keyboard_check(ord("A"));
upKey = keyboard_check(ord("W"));
downKey = keyboard_check(ord("S"));

// Inherit the parent event (this runs all the movement code)
event_inherited();