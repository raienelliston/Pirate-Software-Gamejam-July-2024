extends Node

signal PrimaryClick(Vector3)
signal MouseCoordinates
signal ToggledCameraRotation(bool)
signal player_node_id(String)
signal RegisteredArea(Area3D)
signal UnregisteredArea(Area3D)
signal SceneChanged(SceneTypes)

var scene_name: String
var paused: bool = false
var can_interact = true
var fixed_camera = false

var paused_state

func getSceneSpawn() -> String:
	return scene_name
	
func setSceneSpawn(name: String):
	scene_name = name

func pause():
	paused = true
	can_interact = false
	ToggledCameraRotation.emit(false)
	
func unpause():
	paused = false
	can_interact = true
	ToggledCameraRotation.emit(true)
