target_x = x;
target_y = y;

alarm[0] = 60;
tile_map = layer_tilemap_get_id("Tiles_Col");

var _skills = ds_list_create();
var basicAttack = GetSkill(SkillDB_Id().Basic_Attack)
ds_list_add(_skills, basicAttack);

character_data = new RobotCharacter("enemy", 1, 1, 1, _skills, undefined, undefined);