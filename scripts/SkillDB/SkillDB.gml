function SkillDB()
{
    var _skills = ds_map_create();
    
    var basicAttack = new ActiveSkill(SkillDB_Id().Basic_Attack, "Basic Attack", 1, 0.7, 70, 20);
    ds_map_add(_skills, basicAttack.skill_id, basicAttack);
    
    var basicEnemyAttack = new ActiveSkill(SkillDB_Id().Basic_EnemyAttack, "Basic Enemy Attack", 1, 0, 100, 0);
    ds_map_add(_skills, basicEnemyAttack.skill_id, basicEnemyAttack);
    
    function dodge(attacker_data, target_data)
    {
        
    }
    
    var defensiveDodge = new DefensiveSkill(SkillDB_Id().Defensive_Dodge, "Dodge", dodge);
    ds_map_add(_skills, basicEnemyAttack.skill_id, defensiveDodge);
    
    function block(attacker_data, target_data)
    {
        
    }
    
    var defensiveBlock = new DefensiveSkill(SkillDB_Id().Defensive_Block, "Block", block);
    ds_map_add(_skills, defensiveBlock.skill_id, defensiveBlock);

    return _skills;
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
        Defensive_Block: 4
    }
}