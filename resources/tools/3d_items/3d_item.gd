@tool
extends Node3D

signal KilledTemp(killed)

@export var item_resource: Resource

const _2D_ITEM = preload("res://resources/tools/2d_items/2d_item.tscn")

@onready var item_sprite = $ItemSprite
@onready var collision_shape_2d = $Area2D/CollisionShape2D
@onready var area_3d = $Area3D

@onready var FSM = $FiniteStateMachine
@onready var IdleState = $FiniteStateMachine/IdleState
@onready var ClickedState = $FiniteStateMachine/ClickedState
@onready var DraggingState = $FiniteStateMachine/DraggingState
@onready var DroppedState = $FiniteStateMachine/DroppedState

func _ready():
	
	# Connect state machine connections
	IdleState.connect("ClickStarted", _startClick)
	ClickedState.connect("DragStarted", _startDrag)
	DraggingState.connect("DropStarted", _startDrop)
	DroppedState.connect("IdleStarted", _startIdle)
	DraggingState.connect("ChangedTo2D", changeTo2D)
	connect("KilledTemp", tempOutcome)
	
	# Set appearnce parameters
	item_sprite.texture = item_resource["texture"]
	#var width = item_sprite.texture.get_width()
	#var height = item_sprite.texture.get_height()
	
	#TEMP
	var width = item_resource["width"]
	var height = item_resource["height"]
	
	# Set collision_shape
	print(width, height)
	var shape = RectangleShape2D.new()
	shape.size = Vector2(width, height)
	#collision_shape_2d.set_shape(shape)
	
	onSpawn()

func onSpawn():
	pass

func changeTo2D(dropSignal: Signal):
	var canvas_node = CanvasLayer.new()
	var _2d_item = _2D_ITEM.instantiate()
	_2d_item.temp = true
	_2d_item.item_resource = item_resource
	position = global_position
	_2d_item.global_position = CharacterCamera.get_camera_position(position)
	_2d_item.killSignal = KilledTemp
	canvas_node.add_child(_2d_item)
	get_tree().get_root().add_child(canvas_node)

func tempOutcome(killed: bool):
	print("killed")
	if killed:
		FSM.change_state(DroppedState)
	else:
		queue_free()

func _startClick():
	FSM.change_state(ClickedState)

func _startDrag():
	FSM.change_state(DraggingState)
	
func _startDrop():
	FSM.change_state(DroppedState)
	
func _startIdle():
	FSM.change_state(IdleState)
