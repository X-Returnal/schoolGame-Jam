extends Node2D



func _process(_delta):
	if $enemeys.get_child_count() < 1:
		await get_tree().create_timer(.25).timeout
		print("New level!")
		load_new_level()
func load_new_level():
	global.current_score += global.level_score
	global.cleared_floors += 1
	match randi_range(0,5):
		0:
			get_tree().change_scene_to_file("res://scenes/lvl_0.tscn")
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
