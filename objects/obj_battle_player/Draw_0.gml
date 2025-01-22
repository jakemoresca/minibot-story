draw_self();

var _x = 20
var _y = 5
var _w = (room_width / 2) - 30;
var _h = 12;

draw_sprite_stretched(spr_box, 0, _x, _y, _w, _h);
draw_sprite_stretched_ext(spr_box, 1, _x, _y, _w * (data.character_data.hp / data.character_data.hp_total), _h, c_green, 1);

var _hp_display = string(data.character_data.hp) + " / " + string(data.character_data.hp_total);
draw_set_halign(fa_center);
draw_text_transformed(_x + (_w / 2), _y + 2, _hp_display, 0.4, 0.4, 0);