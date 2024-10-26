// get inputs
rightKey = keyboard_check(vk_right);
leftKey = keyboard_check(vk_left);
upKey = keyboard_check(vk_up);
downKey = keyboard_check(vk_down);

xspd = (rightKey - leftKey) * moveSpd;
yspd = (downKey - upKey) * moveSpd; 

// collisions
if place_meeting(x + xspd, y, oWall)
{ 
	xspd = 0;
}

if place_meeting(x + xspd, y, oWall)
{ 
	xspd = 0;
}

x += xspd;
y += yspd;