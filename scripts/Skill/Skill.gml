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

function ActiveSkill(_id, _name, _baseDamage, _powerFactor, _baseAccuracy, _precisionFactor) : Skill(_id, _name, "active") constructor
{
    self.baseDamage = _baseDamage;
    self.powerFactor = _powerFactor;
    self.baseAccuracy = _baseAccuracy;
    self.precisionFactor = _precisionFactor;
    
    self.calculate_damage = function(character_data)
    {
        return round(self.baseDamage + (character_data.pwr * self.powerFactor));
    }
    
    self.calculate_accuracy = function(character_data)
    {
        return round(self.baseAccuracy + (character_data.accuracy * self.precisionFactor));
    }
}

function PassiveSkill(_id, _name) : Skill(_id, _name, "passive") constructor
{
}

function DefensiveSkill(_id, _name, _calculateSkillEffect) : Skill(_id, _name, "defensive") constructor
{
    self.calculateSkillEffect = _calculateSkillEffect;
}

function SkillEffect(_damage, _armor, _staminaCost, _target) constructor 
{
    self.damage = _damage;
    self.armor = _armor;
    self.staminaCost = _staminaCost;
    
    self.targetOpponent = _target == "opponent";
    self.targetSelf = _target == "self";
}