class_name ThreeDDraggingState
extends State

signal DropStarted
signal ChangedTo2D(dropSignal: Signal)
signal DroppedItem

@export var sprite: Sprite3D
@export var animationPlayer: AnimationPlayer

var original_location: Vector3

func _ready():
	set_physics_process(false)

func _enter_state():
	print("3d drag state")
	sprite.visible = false
	ChangedTo2D.emit(DroppedItem)
	set_physics_process(true)

func _exit_state():
	set_physics_process(false)
	sprite.visible = true
