extends LevelBase

func _ready():
	level_setup()
	Global.AllowedCameraRotation.emit(true)

