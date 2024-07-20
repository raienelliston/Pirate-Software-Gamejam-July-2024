extends Node2D

@export var item_resource: Resource
@export var texture: Texture
@export var starting_state: State
@export var temp: bool = true

var dropSignal: Signal

@onready var FSM = $FSM
@onready var clicked_state = $FSM/ClickedState
@onready var dropped_state = $FSM/DroppedState
@onready var dragging_state = $FSM/DraggingState
@onready var idle_state = $FSM/IdleState

func _ready():
	dropped_state.connect("DropStarted", _startDrop)
	
func _process(delta):
	pass

func makePermanent():
	if temp:
		temp = false
		FSM.change_state("dragging_state")

func _startDrop():
	# If it's permenent
	if not temp:
		FSM.change_state(dropped_state)
		
	# If it's temperary
	dropSignal.emit()
	queue_free()
