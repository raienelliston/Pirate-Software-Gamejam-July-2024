extends Node

enum state {opened, closed, undefined}

@export var starting_state: state = state.opened

var current_state: state

@onready var animation_player = $AnimationPlayer

func _ready():
	var current_state = starting_state

func _on_tab_button_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("primary_action"):
		if current_state == state.opened:
			close_menu()
		else:
			open_menu()

func open_menu():
	current_state = state.undefined
	animation_player.play("menu_open")
	current_state = state.opened
	
func close_menu():
	current_state = state.undefined
	animation_player.play("menu_close")
	current_state = state.closed
