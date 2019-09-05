//databaseからいれる
fire_damage_default = global.defender_data[defender_number, data.damage]
attack_per_second_default = global.defender_data[defender_number, data.attack_speed]
range_default = global.defender_data[defender_number, data.range]
cost = global.defender_data[defender_number, data.cost]

set_cooldown();
range = range_default;
fire_damage = fire_damage_default;

target_id = false;
draw_debug_line = false

state = state.decrement_cooldown;
enum state{
	decrement_cooldown,//攻撃のクールダウン中
	idle,//攻撃できるが周りに敵が居ない
	fire//攻撃の実行
}

