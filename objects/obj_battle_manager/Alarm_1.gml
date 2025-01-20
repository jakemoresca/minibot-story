// enemy phase
var enemy_damage = obj_battle_enemy.data.damage * random_range(0.7, 1.2);
obj_battle_player.data.hp -= enemy_damage;

enemy_turn = 0; //player wait phase
alarm[3] = 60;

if(check_for_end())
{
    alarm[2] = 60;
}