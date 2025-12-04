extends Control

var random_number = randi() % 4
var value

@onready var addition = $Area2D/CollisionShape2D/BaseOpCard/Plus
@onready var subtraction = $Area2D/CollisionShape2D/BaseOpCard/Minus
@onready var multiply = $Area2D/CollisionShape2D/BaseOpCard/Multi
@onready var division = $Area2D/CollisionShape2D/BaseOpCard/Div

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (random_number == 0):
		addition.visible = true
		value = '+'
	if (random_number == 1):
		subtraction.visible = true
		value = '-'
	if (random_number == 2):
		multiply.visible = true
		value = 'x'
	if (random_number == 3):
		division.visible = true
		value = '/'
	print(value) 
