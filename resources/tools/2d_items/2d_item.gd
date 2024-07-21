extends Node2D

@export var item_resource: Resource
@export var starting_state: State
@export var temp: bool = true

var killSignal: Signal

@onready var sprite_2d = $Sprite2D
@onready var rigid_body_2d = $Sprite2D/RigidBody2D

@onready var FSM = $FSM
@onready var clicked_state = $FSM/ClickedState
@onready var dropped_state = $FSM/DroppedState
@onready var dragging_state = $FSM/DraggingState
@onready var idle_state = $FSM/IdleState
@onready var initial_dragging_state = $FSM/InitialDraggingState

func _ready():
	dragging_state.connect("DropStarted", _startDrop)
	clicked_state.connect("DragStarted", _startDrag)
	dropped_state.connect("IdleStarted", _startIdle)
	idle_state.connect("ClickStarted", _startClick)
	initial_dragging_state.connect("DropStarted", _startDrop)
	
	sprite_2d.texture = item_resource["texture"]
	
	
	
	# Create Collision Shapes
	var texture_path = item_resource.texture["load_path"]
	var texture_img = load(texture_path)
	
	#var data = texture_img.get_data()
	var bitmap = BitMap.new()
	bitmap.create_from_image_alpha(texture_img)
	var polys = bitmap.opaque_to_polygons(Rect2(Vector2.ZERO, item_resource.texture.get_size()), 5)
	
	for poly in polys:
		var collision_polygon = CollisionPolygon2D.new()
		collision_polygon.polygon = poly
		rigid_body_2d.add_child(collision_polygon)
		
	
	if temp:
		_startTempDragging()
	else:
		_startDrag()
	
func _process(delta):
	pass

func makePermanent():
	print("perma")
	if temp:
		temp = false
		FSM.change_state(dragging_state)

func _startDrop():
	# If it's permenent
	if not temp:
		FSM.change_state(dropped_state)
		killSignal.emit(true)
		
	# If it's temperary
	print("balls")
	killSignal.emit(true)
	queue_free()
	
func _startDrag():
	FSM.change_state(dragging_state)
	
func _startIdle():
	FSM.change_state(idle_state)
	
func _startClick():
	FSM.change_state(clicked_state)

func _startTempDragging():
	FSM.change_state(initial_dragging_state)


func _on_bag_detector_area_entered(area):
	print("detect")
	if area.is_in_group("bag"):
		makePermanent()

func _on_bag_detector_area_exited(area):
	print("left area")
	if area.is_in_group("bag"):
		pass
