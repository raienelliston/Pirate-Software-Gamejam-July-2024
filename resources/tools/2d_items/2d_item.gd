extends Node2D

@export var resource: Resource
@export var texture: Texture
@export var starting_state: State
@export var dropSignal: Signal

@onready var clicked_state = $FSM/ClickedState
@onready var dropped_state = $FSM/DroppedState
@onready var dragging_state = $FSM/DraggingState
@onready var idle_state = $FSM/IdleState

func _ready():
	pass
	
func _process(delta):
	pass
	
func changeTo3D():
	pass
