extends Node3D

var items: Array[Node]
var enemies: Array[Node]
var friendlies: Array[Node]

@onready var area_3d = $Area3D

func _ready():
	pass
	
func _process(delta):
	
	items = []
	enemies = []
	friendlies = []
	
	for area in area_3d.get_overlapping_areas():
		if area.is_in_group("item"):
			items.append(area)
		if area.is_in_group("enemy"):
			enemies.append(area)
		if area.is_in_group("friendly"):
			friendlies.append(area)
	
	for body in area_3d.get_overlapping_bodies():
		if body.is_in_group("item"):
			items.append(body)
		if body.is_in_group("enemy"):
			enemies.append(body)
		if body.is_in_group("friendly"):
			friendlies.append(body)
