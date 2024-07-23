class_name LevelBase
extends Node3D

@export var defualt_spawn: Node3D
@export var spawn_name: String

const TEST_CHARACTER = preload("res://assets/characters/test_character/test_character.tscn")

@onready var spawns = $Spawns

func _ready():
	level_setup()
	
func level_setup():

	# Handle Player Spawning
	var spawn_name = Global.getSceneSpawn()
	var character = TEST_CHARACTER.instantiate()
	add_child(character)
	if spawn_name:
		var spawn_nodes = get_children()
	else:
		character.global_position = defualt_spawn.global_position
