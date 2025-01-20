enemy_turn = 0;
damage_to_enemy = 0;

player_attack = function(_damage) 
{
    damage_to_enemy = _damage;
    enemy_turn = 1;
    
    alarm[0] = 40; 
    
    obj_battle_player.alarm[0] = 10;
}

check_for_end = function() 
{
    return (obj_battle_player.data.hp <= 0 or obj_battle_enemy.data.hp <= 0);
}

alarm[3] = 10; // start player wait phase


//// Choose a skill based on strategy 
//function choose_skill(robot) 
//{ 
    //if (robot.strategy == "Offensive") 
    //{
        ////todo change it to prioritize active skills
        //return ds_list_find_value(robot.skills, 0);
    //} 
    //else if (robot.strategy == "Defensive") 
    //{
        ////todo change it to prioritize defensive skills
        //return ds_list_find_value(robot.skills, 0);
    //} 
    //else  
    //{ 
        ////todo change it to prioritize active skills
        //return ds_list_find_value(robot.skills, 0);
    //} 
//}
            //
//// Execute a skill on the target 
//function execute_skill(attacker, target, skill) 
//{  
    //var accuracy = (2.5 * attacker.agility) / (attacker.strength + attacker.agility + attacker.endurance); 
    //
    //if (random(1) < accuracy)
    //{
        //if (dodge(target))
        //{ 
            //show_debug_message(attacker.name + "'s attack missed!");
        //} 
        //else
        //{
            //var damage = (attacker.strength * 2) + skill.damage; if (skill.target_part == "armor")
            //{
                //target.armor_health -= damage;
            //} 
            //else if (skill.target_part == "weapon")
            //{
                //target.weapon_health -= damage;
            //}
            //else
            //{
                //target.health -= damage;
            //}
            //
            //show_debug_message(attacker.name + " hit " + target.name + " with " + skill.name + " for " + string(damage) + " damage!"); 
        //} 
    //}
    //else   
    //{ 
        //show_debug_message(attacker.name + "'s attack missed!"); 
    //} 
//} 
    //
//// Determine if the robot dodges the attack 
//function dodge(robot) 
//{ 
    //var dodge_chance = (robot.agility * 2) / 100; 
    //return random(1) < dodge_chance;
//} 
    //
//// Recover energy based on endurance and passive effects
//function recover_energy(robot) 
//{ 
    //var energy_recovery = 5 + (robot.endurance * 1.5); 
    //
    //if (ds_map_exists(robot.passive_effects, "energy_recovery")) 
    //{
        //energy_recovery += robot.passive_effects[? "energy_recovery"]; 
    //}
        //
    //robot.energy += energy_recovery;
    //if (robot.energy > 100) 
    //{ 
        //robot.energy = 100; 
    //} 
//}
//
//// Apply passive skills
//function apply_passive_skills2(robot) 
//{
    //for (var i = 0; i < ds_list_size(robot.skills); i++) 
    //{ 
      //var skill = skills[| i]; // Apply skill effect to robot 
      //skill_apply_effect(robot, skill); 
    //} 
//}
    //
//// Main battle function 
//function battle(robot_a, robot_b) 
//{ 
    //var rounds = 3; 
    //var actions_per_round = 20; 
    //
    //for (var roundCounter = 0; roundCounter < rounds; round++) 
    //{ 
        //show_debug_message("Round " + string(roundCounter + 1) + " begins!"); 
        //
        //for (var action = 0; action < actions_per_round; action++) 
        //{ 
            //apply_passive_skills2(robot_a); 
            //apply_passive_skills2(robot_b); 
            //
            //var skill_a = choose_skill(robot_a); 
            //execute_skill(robot_a, robot_b, skill_a); 
            //
            //var skill_b = choose_skill(robot_b); 
            //execute_skill(robot_b, robot_a, skill_b); 
            //
            //recover_energy(robot_a); 
            //recover_energy(robot_b); 
            //
            //if (robot_a.health <= 0 || robot_b.health <= 0) 
            //{ 
                //break; 
            //} 
        //} 
        //
        //if (robot_a.health <= 0) 
        //{ 
            //show_debug_message(robot_b.name + " wins the battle!"); 
            //return; 
        //} 
        //else if (robot_b.health <= 0) 
        //{ 
            //show_debug_message(robot_a.name + " wins the battle!"); 
            //return; 
        //} 
    //} 
    //
    //if (robot_a.health > robot_b.health) 
    //{ 
        //show_debug_message(robot_a.name + " wins the battle!"); 
    //} 
    //else 
    //{ 
        //show_debug_message(robot_b.name + " wins the battle!"); 
    //} 
//}