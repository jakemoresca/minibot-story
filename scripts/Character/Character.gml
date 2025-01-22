function Character(name, pwr, precision, durability) constructor 
{
    self.name = name; 
    self.pwr = pwr; 
    self.precision = precision; 
    self.durability = durability; 
    
    self.hp = 38 + (6 * pwr) + (3 * precision) + (8 * durability) + (16 * min(pwr, precision, durability)); 
    self.hp_total = hp; 
    self.energy = 100;
    self.energy_total = self.energy;
    self.armor_health = 1.3 * (durability); 
    self.accuracy = (3 * precision) / (pwr + precision + durability);
    
    self.weapon_health = 1 * (durability); 
    self.passive_effects = ds_map_create(); 
    self.weight_capacity = 50 + (durability * 2);
    
    self.isDead = function() 
    {
        return hp <= 0;
    }
    
    self.takeDamage = function(_damage)
    {
        var _armor = round(self.armor_health);
        self.hp -= max(_damage - _armor, 0);
    }
    
    self.reduceEnergy = function(_energy)
    {
        self.energy -= _energy;
    }
    
    self.takeSkillEffect = function(skillEffect)
    {
        if(skillEffect.damage != 0)
        {
            self.takeDamage(skillEffect.damage);
        }
        
        if(skillEffect.energyCost != 0)
        {
            self.reduceEnergy(skillEffect.energyCost);
        }
    }
    
    self.chooseActiveSkill = function() 
    {
        var _active_skills = self.active_skills;
        var chosen_index = irandom_range(0, ds_list_size(_active_skills) - 1);
        var chosen_skill = _active_skills[| chosen_index];
        return chosen_skill;
    }
    
    self.chooseDefensiveSkill = function()
    {
        var _defensive_skills = self.defensive_skills;
        var chosen_index = irandom_range(0, ds_list_size(_defensive_skills) - 1);
        var chosen_skill = _defensive_skills[| chosen_index];
        return chosen_skill;
    }
    
    self.willHit = function(_accuracy)
    {
        return random(1) < _accuracy;
    }
    
    self.executeActiveSkill = function(target, skill)
    {
        var _accuracy = skill.calculate_accuracy(self)
        
        if (self.willHit(accuracy))
        {
            var _skillEffects = skill.calculateSkillEffects(self, target);
            
            var _defensive_skill = target.chooseDefensiveSkill();
            _defensive_skill.calculateSkillEffects(self, target, _skillEffects, _defensive_skill);
            
            for (var i = 0; i < array_length(_skillEffects); i++) 
            {
                var _skillEffect = array_get(_skillEffects, i);
                
                if(_skillEffect.targetOpponent)
                {
                    target.takeSkillEffect(_skillEffect);
                }
                
                if(_skillEffect.targetSelf)
                {
                    self.takeSkillEffect(_skillEffect);
                }
            }
        }
    }
    
    function executePassiveSkill(target, skill, skillEffects)
    {
        
    }
    
    self.refreshSkills = function() 
    {
        var _skills = self.skills;
        var _active_skills = ds_list_create();
        var _defensive_skills = ds_list_create();
        var _passive_skills = ds_list_create();
        
        for (var i = 0; i < ds_list_size(_skills); i++) 
        {
            var skill = _skills[| i]
            
            if(skill.skill_type == SkillType().ActiveSkillType)
            {
                ds_list_add(_active_skills, skill);
            }
            else if(skill.skill_type == SkillType().DefensiveSkillType)
            {
                ds_list_add(_defensive_skills, skill);
            }
            else if(skill.skill_type == SkillType().PassiveSkillType)
            {
                ds_list_add(_passive_skills, skill);
            }
        }
        
        ds_list_clear(self.active_skills)
        ds_list_copy(self.active_skills, _active_skills);
        
        ds_list_clear(self.defensive_skills)
        ds_list_copy(self.defensive_skills, _defensive_skills); 
        
        ds_list_clear(self.passive_skills)
        ds_list_copy(self.passive_skills, _passive_skills); 
    }
    
    self.skills = ds_list_create();
    self.active_skills = ds_list_create();
    self.defensive_skills = ds_list_create();
    self.passive_skills = ds_list_create();
}

function RobotCharacter(name, pwr, precision, durability, skills, strategy, parts) : Character(name, pwr, precision, durability) constructor 
{
    ds_list_copy(self.skills, skills); // ds_list of active, defensive, passive skills 
    
    self.strategy = strategy; // Offensive, Defensive, Balanced 
    self.parts = parts; // ds_map includes body, armor, weapons
    
    var defensiveDoNothing = GetSkill(SkillDB_Id().Defensive_DoNothing)
    ds_list_add(self.skills, defensiveDoNothing);
    
    self.refreshSkills();
}

function BasicEnemyCharacter(name, hp) : Character(name, 1, 1, 1) constructor 
{
    self.hp = hp;
    self.hp_total = hp;
    self.armor_health = 0;
    
    var basicEnemyAttack = GetSkill(SkillDB_Id().Basic_EnemyAttack)
    ds_list_add(self.skills, basicEnemyAttack);
    
    self.refreshSkills();
}