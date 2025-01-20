move_speed = 1;
tile_map = layer_tilemap_get_id("Tiles_Col");

hp = 10;
hp_total = hp;
damage = 2;
charge = 2;

skills = ds_list_create();

Skill = function(_id, _name, _skillType)
{
    var skill_id = _name;
    var name = _name;
    var skill_type = _skillType;
    var calculate_damage = function(data)
    {
        return real(data.damage);
    }
    
    return { skill_id, name, skill_type, calculate_damage }
}

ActiveSkillType = "active";
PassiveSkillType = "passive";
DefensiveSkillType = "defensive";



var basicAttack = Skill(1, "Basic Attack", ActiveSkillType);
ds_list_add(skills, basicAttack);