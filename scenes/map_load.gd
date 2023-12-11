extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.call_deferred("_started")
func _started():
	pass
