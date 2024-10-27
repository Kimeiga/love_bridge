
// Alarm 1 Event of oGameMaster
// This handles the blinking effect
if (game_won) {
    show_continue_text = !show_continue_text;
    alarm[1] = 30; // Reset timer for next blink
}
