function SkillDB()
{
    var _skills = ds_map_create();
    
    var basicAttack = new ActiveSkill(SkillDB_Id().Basic_Attack, "Basic Attack", 1, 0.7, 70, 20, 0, 1);
    ds_map_add(_skills, basicAttack.skill_id, basicAttack);
    
    var basicEnemyAttack = new ActiveSkill(SkillDB_Id().Basic_EnemyAttack, "Basic Enemy Attack", 1, 0, 100, 0, 0, 1);
    ds_map_add(_skills, basicEnemyAttack.skill_id, basicEnemyAttack);
    
    function dodge(attacker_data, self_data, skillEffects, skill)
    {
        var _dodge_chance = self_data.precision / (self_data.precision + attacker_data.precision);
        var _skillEffects = skillEffects;
        
        if(random(1) < _dodge_chance)
        {
            show_debug_message("dodge");
            for (var i = 0; i < array_length(_skillEffects); i++) 
            {
                var _skillEffect = array_get(_skillEffects, i);
                
                if(_skillEffect.targetOpponent)
                {
                    _skillEffect.damage = 0;
                }
                
                if(_skillEffect.targetSelf)
                {
                    _skillEffect.energyCost += skill.calculate_energy_cost(self_data);
                }
            }
        }
    }
    var defensiveDodge = new DefensiveSkill(SkillDB_Id().Defensive_Dodge, "Dodge", dodge, 0.5, 0.6);
    addSkill(_skills, defensiveDodge);
    
    function block(attacker_data, self_data, skillEffects, skill)
    {
        var _block_chance = self_data.durability / (self_data.durability + attacker_data.pwr);
        var _skillEffects = skillEffects;
        
        if(random(1) < _block_chance)
        {
            show_debug_message("block");
            for (var i = 0; i < array_length(_skillEffects); i++) 
            {
                var _skillEffect = array_get(_skillEffects, i);
                
                if(_skillEffect.targetOpponent)
                {
                    _skillEffect.damage = 0;
                }
                
                if(_skillEffect.targetSelf)
                {
                    _skillEffect.energyCost += skill.calculate_energy_cost(self_data);
                }
            }
        }
    }
    var defensiveBlock = new DefensiveSkill(SkillDB_Id().Defensive_Block, "Block", block, 0.5, 0.3);
    addSkill(_skills, defensiveBlock);
    
    function do_nothing(attacker_data, self_data, skillEffects, skill)
    {
        show_debug_message("does nothing...");
    }
    var defensiveDoNothing = new DefensiveSkill(SkillDB_Id().Defensive_DoNothing, "Do Nothing", do_nothing, 0, 0);
    addSkill(_skills, defensiveDoNothing);

    return _skills;
}

function addSkill(skills, skill)
{
    ds_map_add(skills, skill.skill_id, skill);
}

global.Skills = SkillDB();

function GetSkill(_skill_id)
{
    var _skills = global.Skills;
    
    return ds_map_find_value(_skills, _skill_id);
}

function SkillDB_Id()
{
    return {
        Basic_Attack: 1,
        Basic_EnemyAttack: 2,
        Defensive_Dodge: 3,
        Defensive_Block: 4,
        Defensive_DoNothing: 5
    }
}