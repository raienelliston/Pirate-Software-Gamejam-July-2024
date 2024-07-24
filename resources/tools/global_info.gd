extends Node

signal PrimaryClick(Vector3)
signal MouseCoordinates

var scene_name: String
var can_camera_rotate: bool
var paused: bool = false

func getSceneSpawn() -> String:
	return scene_name
	
func setSceneSpawn(name: String):
	scene_name = name
