extends Control

var random_number = randi() % 4
var value
var already_initialized = false

@onready var addition = $Area2D/CollisionShape2D/BaseOpCard/Plus
@onready var subtraction = $Area2D/CollisionShape2D/BaseOpCard/Minus
@onready var multiply = $Area2D/CollisionShape2D/BaseOpCard/Multi
@onready var division = $Area2D/CollisionShape2D/BaseOpCard/Div

func _ready() -> void:
	if already_initialized:
		return
	
	if (random_number == 0):
		addition.visible = true
		subtraction.visible = false
		multiply.visible = false
		division.visible = false
		value = '+'
	elif (random_number == 1):
		addition.visible = false
		subtraction.visible = true
		multiply.visible = false
		division.visible = false
		value = '-'
	elif (random_number == 2):
		addition.visible = false
		subtraction.visible = false
		multiply.visible = true
		division.visible = false
		value = 'x'
	elif (random_number == 3):
		addition.visible = false
		subtraction.visible = false
		multiply.visible = false
		division.visible = true
		value = '/'
