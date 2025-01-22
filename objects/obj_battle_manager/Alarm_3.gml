// player wait phase
var _player_skill = obj_battle_player.data.character_data.chooseActiveSkill();
obj_battle_player.data.character_data.executeActiveSkill(obj_battle_enemy.data.character_data, _player_skill, array_create(0));

//var _damage = _player_skill.calculate_damage(obj_battle_player.data.character_data);

player_attack();