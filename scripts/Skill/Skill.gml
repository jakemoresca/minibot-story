function Skill(_id, _name, _skillType) constructor 
{
    self.skill_id = _id;
    self.name = _name;
    self.skill_type = _skillType;
}

function SkillType()
{
    return {
        ActiveSkillType: "active",
        PassiveSkillType: "passive",
        DefensiveSkillType: "defensive"
    };
}

function ActiveSkill(_id, _name, _baseDamage, _powerFactor, _baseAccuracy, _precisionFactor, _baseEnergyCost, _energyPowerFactor) : Skill(_id, _name, "active") constructor
{
    self.baseDamage = _baseDamage;
    self.powerFactor = _powerFactor;
    self.baseAccuracy = _baseAccuracy;
    self.precisionFactor = _precisionFactor;
    self.baseEnergyCost = _baseEnergyCost;
    self.energyPowerFactor = _energyPowerFactor;
    
    self.calculate_damage = function(character_data)
    {
        return round(self.baseDamage + (character_data.pwr * self.powerFactor));
    }
    
    self.calculate_accuracy = function(character_data)
    {
        return round(self.baseAccuracy + (character_data.accuracy * self.precisionFactor));
    }
    
    self.calculate_energy_cost = function(character_data)
    {
        return round(self.baseEnergyCost + (character_data.pwr * self.energyPowerFactor));
    }
    
    self.calculateSkillEffects = function(attacker_data, target_data) 
    {
        var _skillEffects = array_create(2);
        
        var _skillDamage = self.calculate_damage(attacker_data);
        _skillEffects[0] = new SkillEffect(_skillDamage, 0, 0, "opponent");
        
        var _energyCost = self.calculate_energy_cost(attacker_data);
        _skillEffects[1] = new SkillEffect(0, 0, _energyCost, "self");
        
        return _skillEffects;
    }
}

function PassiveSkill(_id, _name) : Skill(_id, _name, "passive") constructor
{
}

function DefensiveSkill(_id, _name, _calculateSkillEffects, _baseEnergyCost, _energyPowerFactor) : Skill(_id, _name, "defensive") constructor
{
    self.baseEnergyCost = _baseEnergyCost;
    self.energyPowerFactor = _energyPowerFactor;
    self.calculateSkillEffects = _calculateSkillEffects;
    
    self.calculate_energy_cost = function(character_data)
    {
        return round(self.baseEnergyCost + (character_data.pwr * self.energyPowerFactor));
    }
}

function SkillEffect(_damage, _armor, _energyCost, _target) constructor 
{
    self.damage = _damage;
    self.armor = _armor;
    self.energyCost = _energyCost;
    
    self.targetOpponent = _target == "opponent";
    self.targetSelf = _target == "self";
}