extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	$Time.text = str(global.current_time)
	$Score.text =str(global.current_score)
	await get_tree().create_timer(.5).timeout
	$LevelScore.text = str($"..".level_score)
	
