extends Camera3D

@export var head : Node3D
@export_range(0, 100, 0.5) var mouse_x_sensitivity : float = 50
@export_range(0, 100, 0.5) var mouse_y_sensitivity : float = 50

func _ready() -> void:
	Input.mouse_mode = Input.MouseMode.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		owner.rotate_y(-event.relative.x * (mouse_x_sensitivity / 10000))
		head.rotate_x(-event.relative.y * (mouse_y_sensitivity / 10000) / 1.5)
		head.rotation.x = clampf(head.rotation.x, -1.5, 1.5)
