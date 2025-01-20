// player wait phase
var _player_skill = obj_battle_player.choose_skill();
var _damage = _player_skill.calculate_damage(obj_battle_player.data);

player_attack(_damage);