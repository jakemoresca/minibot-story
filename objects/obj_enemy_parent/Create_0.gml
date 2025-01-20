target_x = x;
target_y = y;

alarm[0] = 60;
tile_map = layer_tilemap_get_id("Tiles_Col");
hp_total = hp;

skills = ds_list_create();

var basicAttack = obj_player.Skill(1, "Basic Attack", obj_player.ActiveSkillType);
ds_list_add(skills, basicAttack);