class_name InteractionArea
extends Area3D

@export var interaction_name: String
@export var interaction_description: String 
@export var interaction_triggers: Array[Node]

func _on_body_entered(body):
	if body.is_in_group("player_character"):
		Global.RegisteredArea.emit(self)

func _on_body_exited(body):
	if body.is_in_group("player_character"):
		Global.UnregisteredArea.emit(self)

func interact():
	for node in interaction_triggers:
		if node.has_method("trigger"):
			node.trigger()
