set_cooldown();
range = range_default;
fire_damage = fire_damage_default;

target_id = false;
draw_debug_line = false

defender_name = "Test";//このdefenderの名前 ステータス画面表示用
state = state.decrement_cooldown;
enum state{
	decrement_cooldown,//攻撃のクールダウン中
	idle,//攻撃できるが周りに敵が居ない
	fire//攻撃の実行
}