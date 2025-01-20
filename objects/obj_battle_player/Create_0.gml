data = obj_battle_switcher.player_data;

choose_skill = function() 
{
    var _skills = data.skills;
    var _active_skills = ds_list_create();
    
    for (var i = 0; i < ds_list_size(_skills); i++) 
    {
        var skill = _skills[| i]
        
        if(skill.skill_type == "active")
        {
            ds_list_add(_active_skills, skill);
        }
    }
    
    var chosen_index = irandom_range(0, ds_list_size(_active_skills) - 1);
    var chosen_skill = _active_skills[| chosen_index];
    return chosen_skill;
}