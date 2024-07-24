extends Node

var inputEvents: Array

func add_pressed_input_event(key, param, function):
	inputEvents.append([key, param, function])
	
func _input(event):
	for inputevent in inputEvents:
		for paramerter in inputevent[1]:
			if not paramerter.call():
				return
		if event.is_action_pressed(inputevent[0]):
			inputevent[2].call()
			return
