extends Node3D

const DUNGEON_UI = preload("res://scenes/ui/dungeon_ui/dungeon_ui.tscn")
const GENERAL_UI = preload("res://scenes/ui/general_ui/general_ui.tscn")

var UI

func _ready():
	Global.connect("SceneChanged", onSceneChange)

func onSceneChange(scenetype: SceneBase.SceneTypes):
	if scenetype == SceneBase.SceneTypes.GENERAL:
		UI = GENERAL_UI.instantiate()
	elif scenetype == SceneBase.SceneTypes.DUNGEON:
		UI = DUNGEON_UI.instantiate()
	
	UI.hide()
	get_parent().add_child(UI)
