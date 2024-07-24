extends SceneBase

func _ready():
	level_setup()
	Global.AllowedCameraRotation.emit(true)
