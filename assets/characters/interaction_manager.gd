extends Node3D

var active_areas := []
var active_index := -1

@onready var interaction_text = $Sprite3D/SubViewport/VBoxContainer
@onready var interaction_name = $Sprite3D/SubViewport/VBoxContainer/InteractionName
@onready var interaction_description = $Sprite3D/SubViewport/VBoxContainer/InteractionDescription
@onready var tooltip = $Sprite3D/SubViewport/VBoxContainer/Tooltip
@onready var player = get_tree().get_first_node_in_group("player")


func _input(event):
	if Global.can_interact:
		if event.is_action_pressed("primary_action"):
			if active_areas.size() > 0:
				Global.can_interact = false
				interaction_text.hide()
				
				await active_areas[active_index].interact.call()
				
				Global.can_interact = true
				interaction_text.show()
				
		if event.is_action_pressed("secondary_action"):
			if active_index == active_areas.size() - 1:
				active_index = 0
			else:
				active_index += 1

func register_area(area: InteractionArea):
	active_areas.push_back(area)
	active_index += 1
	
func unregister_area(area: InteractionArea):
	var index = active_areas.find(area)
	if index != -1:
		active_areas.remove_at(index)
		active_index -= 1

func _process(delta):
	if active_areas.size() > 0 and Global.can_interact:
		active_areas.sort_custom(_sort_by_distance)
		var tooltip_text = "{primary} to use"
		if active_areas.size() > 1:
			tooltip_text += ", {secondary} to swap actions"
			
		interaction_name = active_areas[active_index].interaction_name
		interaction_description = active_areas[active_index].interaction_description
		tooltip_text = tooltip_text.format({"primary": "Primary", "secondary": "Secondary"})
		tooltip.text = tooltip_text
	else:
		interaction_name.text = ""
		interaction_description.text = ""
		tooltip.text = ""
		
func _sort_by_distance(area1, area2):
	var area1_distance = player.global_position.distance_to(area1.global_position)
	var area2_distance = player.global_position.distance_to(area2.global_position)
	return area1_distance < area2_distance
