@tool
extends Node3D

enum ItemStates {IDLE, CLICKED, DRAGGING, DROPPED}

@export var item_resource: Resource

const _2D_ITEM = preload("res://resources/tools/2d_items/2d_item.tscn")

@onready var item_sprite = $ItemSprite
@onready var collision_shape_2d = $Area2D/CollisionShape2D
@onready var current_state: ItemStates = ItemStates.IDLE
@onready var area_3d = $Area3D


@onready var FSM = $FiniteStateMachine
@onready var idleState = $FiniteStateMachine/IdleState
@onready var ClickedState = $FiniteStateMachine/ClickedState
@onready var draggingState = $FiniteStateMachine/DraggingState
@onready var droppedState = $FiniteStateMachine/DroppedState

func _ready():
	
	
	# Connect state machine connections
	GlobalSignals.connect("PrimaryClick", onClick)
	ClickedState.connect("StartDrag", _startDrag)
	droppedState.connect("IdleStarted", _startIdle)
	
	# Set appearnce parameters
	item_sprite.texture = item_resource["texture"]
	var width = item_sprite.texture.get_width()
	var height = item_sprite.texture.get_height()
	
	# Set collision_shape
	print(width, height)
	var shape = RectangleShape2D.new()
	shape.size = Vector2(width, height)
	#collision_shape_2d.set_shape(shape)
	
	onSpawn()

func _process(delta):
	pass

func onSpawn():
	pass

func changeTo2D():
	var _2d_item = _2D_ITEM.instantiate()
	_2d_item.item_resource = item_resource
	#_2d_item.starting_state = 
	_2d_item.global_position = global_position
	get_tree().get_root().add_child(_2d_item)
	queue_free()
	
func onClick(position: Vector3):
	pass


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouse:
		if Input.is_action_just_pressed("primary_action"):
			print("alsdkjfasdf")
		if Input.is_action_just_released("primary_action"):
			print("released")
			
			
func _startDrag():
	FSM.change_state(draggingState)
	
func _startIdle():
	FSM.change_state(idleState)
