// enemy phase
var _enemy_skill = obj_battle_enemy.data.character_data.chooseActiveSkill();
var _enemy_damage = _enemy_skill.calculate_damage(obj_battle_enemy.data.character_data);
//obj_battle_enemy.data.damage * random_range(0.7, 1.2);
obj_battle_player.data.character_data.takeDamage(_enemy_damage);

enemy_turn = 0; //player wait phase
alarm[3] = 60;

if(check_for_end())
{
    alarm[2] = 60;
}