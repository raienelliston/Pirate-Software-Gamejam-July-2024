extends Node

signal PrimaryClick(Vector3)
signal MouseCoordinates

var scene_name: String

func getSceneSpawn() -> String:
	return scene_name
	
func setSceneSpawn(name: String):
	scene_name = name
