extends Node3D

@export var headbob_frequency : float = 5.6
@export var headbob_amplitude : float = 0.04

@onready var init_pos : Vector3 = %Camera.transform.origin

var headbob_time : float = 0

func _process(delta: float) -> void:
	headbob_time += delta * owner.velocity.length() * float(owner.is_on_floor())
	if owner.velocity.length() >= 0.1:
		%Camera.transform.origin = headbob(headbob_time)
	else:
		%Camera.transform.origin = lerp(%Camera.transform.origin, init_pos, delta)

func headbob(time):
	var headbob_position : Vector3 = Vector3.ZERO
	headbob_position.y = sin(time * headbob_frequency) * headbob_amplitude
	headbob_position.x = cos(time * headbob_frequency / 2) * headbob_amplitude
	return headbob_position
