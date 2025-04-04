extends Area3D

@export var trauma_ammount : float = 0.1

func _process(delta: float) -> void:
	cause_trauma()

func cause_trauma():
	var trauma_areas := get_overlapping_areas()
	for area in trauma_areas:
		if area.has_method("add_trauma"):
			area.add_trauma(trauma_ammount)
