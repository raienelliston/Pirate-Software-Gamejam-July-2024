extends Node

signal PrimaryClick(Vector3)
signal MouseCoordinates
signal AllowedCameraRotation(bool)

var scene_name: String
var paused: bool = false

var paused_state

func getSceneSpawn() -> String:
	return scene_name
	
func setSceneSpawn(name: String):
	scene_name = name

func pause():
	paused = true
	
func unpause():
	paused = false
