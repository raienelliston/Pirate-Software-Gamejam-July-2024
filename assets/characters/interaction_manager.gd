extends Node3D

@onready var tooltip = $Sprite3D/SubViewport/Tooltip
@onready var player = get_tree().get_first_node_in_group("player")

var active_areas := []

func register_area(area: InteractionArea):
	active_areas.push_back(area)
	
func unregister_area(area: InteractionArea):
	var index = active_areas.find(area)
	if index != -1:
		active_areas.remove_at(index)

func _process(delta):
	#if active_areas.size() > 0 and Global.can_interact:
	if true:
		active_areas.sort_custom(_sort_by_distance)
		var tooltip_text = "{primary} to use"
		if active_areas.size() > 1:
			tooltip_text += ", {secondary} to swap actions"
			
		tooltip_text = tooltip_text.format({"primary": "Primary", "secondary": "Secondary"})
		tooltip.text = tooltip_text
		
func _sort_by_distance(area1, area2):
	var area1_distance = player.global_position.distance_to(area1.global_position)
	var area2_distance = player.global_position.distance_to(area2.global_position)
	return area1_distance < area2_distance
