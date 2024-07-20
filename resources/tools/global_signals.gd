extends Node

signal PrimaryClick(Vector3)

func _ready():
	pass

func emitPrimaryClick(vector: Vector3):
	PrimaryClick.emit(vector)
