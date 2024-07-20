@tool
extends Node3D

enum ItemStates {IDLE, CLICKED, DRAGGING, DROPPED}

@export var item_resource: Resource
@onready var item_sprite = $ItemSprite
@onready var collision_shape_2d = $Area2D/CollisionShape2D
@onready var current_state: ItemStates = ItemStates.IDLE

@onready var FSM = $FiniteStateMachine
@onready var idleState = $FiniteStateMachine/IdleState
@onready var clickedState = $FiniteStateMachine/ClickedState
@onready var draggingState = $FiniteStateMachine/DraggingState
@onready var droppedState = $FiniteStateMachine/DroppedState

func _ready():
	
	# Connect state machine connections
	
	
	# Set appearnce parameters
	item_sprite.texture = item_resource["texture"]
	var width = item_sprite.texture.get_width()
	var height = item_sprite.texture.get_height()
	
	# Set collision_shape
	print(width, height)
	var shape = RectangleShape2D.new()
	shape.size = Vector2(width, height)
	collision_shape_2d.set_shape(shape)
	
	onSpawn()

func _process(delta):
	
	# Drop Item
	if current_state == ItemStates.DRAGGING:
		if Input.is_action_just_released("primary_action"):
			pass

func onSpawn():
	pass

func changeTo2D():
	pass

func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouse:
		if Input.is_action_just_pressed("primary_action") and current_state == ItemStates.IDLE:
			pass
