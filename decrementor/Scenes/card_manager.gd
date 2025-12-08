extends Node2D
const CARD_LOCATION_MASKS = 2
var card_being_dragged

func _ready() -> void:
	if Global.labels_hidden:
		hide_all_labels()
func _process(delta: float) -> void:
	if card_being_dragged:
		var mouse_pos = get_global_mouse_position()
		card_being_dragged.global_position = mouse_pos

		

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var card = raycast_check_for_card()
			if card:
				card_being_dragged = card
		else:
			if card_being_dragged:
				var parent_of_card_being_dragged = card_being_dragged.get_parent()
				var equation_area_found = raycast_check_for_equation_area()
				var hand_area_found = raycast_check_for_hand_area()
				if equation_area_found:
					#set position of card in equation area
					parent_of_card_being_dragged.remove_child(card_being_dragged)
					equation_area_found.get_child(2).add_child(card_being_dragged)
					# Hide the label in the equation area
					hide_equation_area_label_persistent(equation_area_found)
				elif hand_area_found:
					#set position of card in equation area
					parent_of_card_being_dragged.remove_child(card_being_dragged)
					hand_area_found.get_child(2).add_child(card_being_dragged)
				else:
					parent_of_card_being_dragged.remove_child(card_being_dragged)
					parent_of_card_being_dragged.add_child(card_being_dragged)
			card_being_dragged = null

# Helper function to hide the label in equation area
func hide_equation_area_label_persistent(equation_area):
	var label_node = equation_area.get_node_or_null("Label")
	if label_node:
		label_node.visible = false
		label_node.hide()
		
	var deck_label = get_node_or_null("../Deck Label")
	if deck_label:
		deck_label.visible = false
		deck_label.hide()
	
	var req_label = get_node_or_null("../Req Label")
	if req_label:
		req_label.visible = false
		req_label.hide()
	
	Global.labels_hidden = true
func hide_all_labels():
	var equation_areas = get_tree().get_nodes_in_group("equation_areas") 
	for area in equation_areas:
		var label_node = area.get_node_or_null("Label")
		if label_node:
			label_node.visible = false
			label_node.hide()

	var deck_label = get_node_or_null("../Deck Label")
	if deck_label:
		deck_label.visible = false
		deck_label.hide()
	
	var req_label = get_node_or_null("../Req Label")
	if req_label:
		req_label.visible = false
		req_label.hide()

# function checks card collision with mouse
func raycast_check_for_card():
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position()
	parameters.collide_with_areas = true
	parameters.collision_mask = 1
	var result = space_state.intersect_point(parameters)
	#print(result)
	if result.size() > 0:
		return result[0].collider.get_parent()
	return null

# function checks (mouse with card) collision with equation area
func raycast_check_for_equation_area():
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position()
	parameters.collide_with_areas = true
	parameters.collision_mask = CARD_LOCATION_MASKS
	var result = space_state.intersect_point(parameters)
	if result.size() > 0:
		return result[0].collider.get_parent()
	return null
	
# function checks (mouse with card) collision with hand area
func raycast_check_for_hand_area():
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position()
	parameters.collide_with_areas = true
	parameters.collision_mask = CARD_LOCATION_MASKS
	var result = space_state.intersect_point(parameters)
	if result.size() > 0:
		return result[0].collider.get_parent()
	return null
