extends SceneBase

func _ready():
	level_setup()
	Global.ToggledCameraRotation.emit(true)
