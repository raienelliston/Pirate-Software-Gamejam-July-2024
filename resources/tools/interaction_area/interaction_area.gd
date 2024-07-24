class_name InteractionArea
extends Area3D

@export var interaction_name: String
@export var interaction_description: String 

func _on_body_entered(body):
	InteractionManager.register_area(self)

func _on_body_exited(body):
	InteractionManager.unregister_area(self)
