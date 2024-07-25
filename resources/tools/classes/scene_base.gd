class_name SceneBase
extends Node3D

enum SceneTypes {GENERAL, DUNGEON}

@export var defualt_spawn: Node3D
@export var spawn_name: String
@export var pause_menu: Node
@export var scene_type: SceneTypes
@export var fixed_camera: bool

var paused: bool = false
const TEST_CHARACTER = preload("res://assets/characters/character.tscn")

@onready var spawns = $Spawns

func _ready():
	level_setup()
	
func level_setup():
	# Reset some values
	Global.ToggledCameraRotation.emit(false)
	Global.paused = false
	Global.SceneChanged.emit(scene_type)

	# Handle Player Spawning
	var spawn_name = Global.getSceneSpawn()
	var character = TEST_CHARACTER.instantiate()
	add_child(character)
	if spawn_name:
		var spawn_nodes = get_children()
	else:
		character.global_position = defualt_spawn.global_position

	Global.fixed_camera = fixed_camera
	Global.ToggledCameraRotation.emit(!fixed_camera)
	Global.connect("Paused", pause_scene)

func pause_scene(status: bool):
	if status:
		print("print")
		if paused:
			Engine.time_scale = 1
		else:
			Engine.time_scale = 0
		
		paused = !paused
		
