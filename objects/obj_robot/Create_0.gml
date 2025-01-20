/// @function Robot(name, strength, agility, endurance, skills, strategy, parts);
/// @param {string} name Name of the Robot
/// @param {real} strength Strength of the robot
/// @param {real} agility Agility of the robot
/// @param {real} endurance Endurance of the robot
/// @param {Id.DsList} skills Skills of the robot
/// @param {Id.DsList} strategy Strategy of the robot
/// @param {Id.DsList} parts Parts of the robot
function Robot(name, strength, agility, endurance, skills, strategy, parts) constructor 
{ 
    self.name = name; 
    self.strength = strength; 
    self.agility = agility; 
    self.endurance = endurance; 
    
    self.skills = skills; // ds_list of active, defensive, passive skills 
    self.strategy = strategy; // Offensive, Defensive, Balanced 
    self.parts = parts; // ds_map includes body, armor, weapons 
    
    self.hp = 50 + (8 * strength) + (5 * agility) + (10 * endurance) + (20 * min(strength, agility, endurance)); 
    self.energy = 100; 
    self.armor_health = 50 + (endurance * 5); 
    self.weapon_health = 30 + (agility * 3); 
    
    self.passive_effects = ds_list_create();
}

//var skills = ds_list_create();
//var strategy = ds_list_create();
//var parts = ds_list_create();
//var test = obj_robot.Robot("banme", 1, 1, 1, skills, strategy, parts)
