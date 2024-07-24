class_name LevelBase
extends Node3D

@export var defualt_spawn: Node3D
@export var spawn_name: String
@export var pause_menu: Node

var paused: bool = false
const TEST_CHARACTER = preload("res://assets/characters/test_character/test_character.tscn")

@onready var spawns = $Spawns

func _ready():
	level_setup()
	
func _process(delta):
	level_process()
	
func level_setup():

	# Reset some values
	Global.can_camera_rotate = false
	Global.paused = false

	# Handle Player Spawning
	var spawn_name = Global.getSceneSpawn()
	var character = TEST_CHARACTER.instantiate()
	add_child(character)
	if spawn_name:
		var spawn_nodes = get_children()
	else:
		character.global_position = defualt_spawn.global_position

func level_process():
	if Input.is_action_just_pressed("pause"):
		if paused:
			pause_menu.hide()
			Global.paused = false
			Engine.time_scale = 1
		else:
			pause_menu.show()
			Global.paused = true
			Engine.time_scale = 0
		
		paused = !paused
		
