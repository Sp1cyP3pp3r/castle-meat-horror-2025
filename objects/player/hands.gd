extends Node

func _process(delta: float) -> void:
	get_child(0).global_position = $"..".global_position + Vector3(0, -0.180, -0.114)\
	* owner.global_basis
