extends Node2D

@export var item_resource: Resource
@export var texture: Texture
@export var starting_state: State
@export var temp: bool = true

var killSignal: Signal

@onready var FSM = $FSM
@onready var clicked_state = $FSM/ClickedState
@onready var dropped_state = $FSM/DroppedState
@onready var dragging_state = $FSM/DraggingState
@onready var idle_state = $FSM/IdleState

func _ready():
	dragging_state.connect("DropStarted", _startDrop)
	clicked_state.connect("DragStarted", _startDrag)
	dropped_state.connect("IdleStarted", _startIdle)
	idle_state.connect("ClickStarted", _startClick)
	
func _process(delta):
	pass

func makePermanent():
	if temp:
		temp = false
		FSM.change_state(dragging_state)

func _startDrop():
	# If it's permenent
	if not temp:
		FSM.change_state(dropped_state)
		
	# If it's temperary
	print("balls")
	killSignal.emit()
	queue_free()
	
func _startDrag():
	FSM.change_state(dragging_state)
	
func _startIdle():
	FSM.change_state(idle_state)
	
func _startClick():
	FSM.change_state(clicked_state)
