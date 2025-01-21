move_speed = 1;
tile_map = layer_tilemap_get_id("Tiles_Col");

var _skills = ds_list_create();
var basicAttack = GetSkill(SkillDB_Id().Basic_Attack)
ds_list_add(_skills, basicAttack);

character_data = new RobotCharacter("hero", 1, 1, 1, _skills, undefined, undefined);