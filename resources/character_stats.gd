class_name player_info
extends Resource

signal health_changed

@export var starting_health: int = 20
@export var max_health: int = 20

var health: int = starting_health

func setHealth(amount: int):
	health = clamp(amount, 0, max_health)
	health_changed.emit()
