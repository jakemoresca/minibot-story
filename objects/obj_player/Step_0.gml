var _horizontal = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _vertical = keyboard_check(ord("S")) - keyboard_check(ord("W"));

move_and_collide(_horizontal * move_speed, _vertical * move_speed, tile_map, undefined, undefined, undefined, move_speed, move_speed);

if(_horizontal != 0 or _vertical != 0)
{
    if(_vertical > 0)
        sprite_index = spr_player_walk_down;
    else if(_vertical < 0)
        sprite_index = spr_player_walk_up;
    else if(_horizontal > 0)
        sprite_index = spr_player_walk_right;
    else if(_horizontal < 0)
        sprite_index = spr_player_walk_left;
}
else 
{
    switch (sprite_index) {
        case spr_player_walk_down:
            sprite_index = spr_player_idle_down;
            break;
        case spr_player_walk_left:
            sprite_index = spr_player_idle_left;
            break;
        case spr_player_walk_right:
            sprite_index = spr_player_idle_right;
            break;
        case spr_player_walk_up:
            sprite_index = spr_player_idle_up;
            break;
    }
}

if(hp <= 0) {
    game_restart();
}