// player phase
obj_battle_enemy.data.character_data.takeDamage(damage_to_enemy);

if(check_for_end())
{
    alarm[2] = 60;
}
else 
{
    alarm[1] = 60; //enemy turn
    obj_battle_enemy.alarm[0] = 30;
}