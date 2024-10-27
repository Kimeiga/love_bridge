// Step Event of oPlayer
if (!can_move) {
    return
}

// calculate movement vector
xspd = (rightKey - leftKey);
yspd = (downKey - upKey);

// normalize diagonal movement
if (xspd != 0 && yspd != 0) {
    var normalizer = moveSpd / sqrt(2);
    xspd *= normalizer;
    yspd *= normalizer;
} else {
    xspd *= moveSpd;
    yspd *= moveSpd;
}

// Horizontal collision
var _canMoveX = true;
if (place_meeting(x + xspd, y, oWall)) {
    _canMoveX = false;
}

// Vertical collision
var _canMoveY = true;
if (place_meeting(x, y + yspd, oWall)) {
    _canMoveY = false;
}

// Apply movement only if we can move
if (!_canMoveX) xspd = 0;
if (!_canMoveY) yspd = 0;

// apply movement
x += xspd;
y += yspd;

//depth = -100; 