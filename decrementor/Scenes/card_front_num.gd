extends Control

var random_number = randi() % 10
var already_initialized = false

@onready var label = $Area2D/CollisionShape2D/BaseNumCard/Label

func _ready() -> void:
	if not already_initialized:
		label.text = str(random_number)
	
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
