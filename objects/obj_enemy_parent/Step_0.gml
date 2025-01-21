var _horizontal = clamp(target_x - x, -1, 1);
var _vertical = clamp(target_y - y, -1, 1);
var _move_speed = real(self.move_speed)

move_and_collide(_horizontal, _vertical, [tile_map, obj_enemy_parent], undefined, undefined, undefined, _move_speed, _move_speed);

if(character_data.isDead()) {
    instance_destroy();
}