// Create Event
start_y = y;           // Remember starting position
distance = 10;        // How far to move up/down
move_speed = 2;        // Speed of oscillation
time = 0;             // Time tracker

// Step Event
var dt = delta_time / 1000000;  // Convert to seconds
time += dt * move_speed;

y = start_y + sin(time) * distance/2;  // Divide by 2 since sin goes from -1 to 1