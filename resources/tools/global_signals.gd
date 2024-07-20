class_name GlobalSignals
extends Node

signal PrimaryClick(Vector3)

func emitPrimaryClick(vector: Vector3):
	PrimaryClick.emit(vector)
