extends Node2D



func _process(delta):
	if $enemeys.get_child_count() < 1:
		#delay
		print("New level!")
		load_new_level()
func load_new_level():
	get_tree().change_scene_to_file("res://scenes/test_map.tscn")
