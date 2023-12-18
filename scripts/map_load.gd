extends Node2D
var level_score = 0


func _process(_delta):
	if $enemeys.get_child_count() < 1:
		await get_tree().create_timer(1.5).timeout
		print("New level!")
		load_new_level()
func load_new_level():
	global.current_score += level_score
	match randi_range(0,5):
		0:
			get_tree().change_scene_to_file("res://scenes/test_map.tscn")
		1:
			get_tree().change_scene_to_file("res://scenes/lvl_1.tscn")
		2:
			get_tree().change_scene_to_file("res://scenes/lvl_2.tscn")
		3:
			get_tree().change_scene_to_file("res://scenes/lvl_3.tscn")
		4:
			get_tree().change_scene_to_file("res://scenes/lvl_4.tscn")
		5:
			get_tree().change_scene_to_file("res://scenes/lvl_5.tscn")
