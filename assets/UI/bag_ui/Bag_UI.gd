extends Node

enum state {opened, closed, undefined}

@export var starting_state: state = state.closed

var current_state: state

@onready var animation_player = $AnimationPlayer

func _ready():
	var current_state = state.closed
	
func _on_menu_body_mouse_entered():
	open_menu()

func _on_menu_body_mouse_exited():
	if current_state == state.opened:
		close_menu()

func open_menu():
	animation_player.play("menu_open")
	
func close_menu():
	animation_player.play("menu_close")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "menu_open":
		current_state = state.opened
	if anim_name == "menu_close":
		current_state = state.closed


func _on_item_detector_body_entered(body):
	if body.has_method("makePermanent"):
		body.makePermanent()
