@tool
extends Node2D

signal UsedItem

@export var item_resource: Resource
@export var starting_state: State
@export var temp: bool = true

var killSignal: Signal
var active: bool = false

@onready var rigid_body_2d = $RigidBody2D
@onready var sprite_2d = $RigidBody2D/Sprite2D

# Dragging State Machine
@onready var drag_FSM = $DragFSM
@onready var clicked_state = $DragFSM/ClickedState
@onready var dragging_state = $DragFSM/DraggingState
@onready var dropped_state = $DragFSM/DroppedState
@onready var idle_state = $DragFSM/IdleState
@onready var initial_dragging_state = $DragFSM/InitialDraggingState


# Using Item State Machine
@onready var use_FSM = $UseFSM
@onready var active_state = $UseFSM/ActiveState
@onready var inactive_state = $UseFSM/InactiveState
@onready var used_state = $UseFSM/UsedState


func _ready():
	dragging_state.connect("DropStarted", _startDrop)
	clicked_state.connect("DragStarted", _startDrag)
	dropped_state.connect("IdleStarted", _startIdle)
	idle_state.connect("ClickStarted", _startClick)
	initial_dragging_state.connect("DropStarted", _startDrop)
	
	active_state.connect("Used", _useItem)
	
	sprite_2d.texture = item_resource["texture"]
	
	if temp:
		_startTempDragging()
	else:
		_startDrag()
	
func _process(delta):
	pass

func makePermanent():
	print("perma")
	temp = false

func _startDrop():
	if temp:
		killSignal.emit(true)
		queue_free()
	
	print("start prem drop")
	drag_FSM.change_state(dropped_state)
	killSignal.emit(true)
	
func _startDrag():
	drag_FSM.change_state(dragging_state)
	
func _startIdle():
	drag_FSM.change_state(idle_state)
	
func _startClick():
	drag_FSM.change_state(clicked_state)

func _startTempDragging():
	drag_FSM.change_state(initial_dragging_state)


func _on_bag_detector_area_entered(area):
	print("detect")
	if area.is_in_group("bag"):
		print("bag")
		if temp:
			makePermanent()
		use_FSM.change_state(inactive_state)

func _on_bag_detector_area_exited(area):
	print("left area")
	if area.is_in_group("bag"):
		use_FSM.change_state(active_state)

func _useItem():
	item_resource.useItem(self)
	UsedItem.emit()
