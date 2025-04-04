extends CharacterBody3D

enum movement_mode {WALK, SPRINT, CROUCH}
var current_movement_mode = movement_mode.WALK

func _physics_process(delta: float) -> void:
	handle_move(delta)
	#velocity.y += get_gravity().y * delta
	
	if Input.is_action_pressed("run"):
		current_movement_mode = movement_mode.SPRINT
	elif Input.is_action_just_released("run"):
		current_movement_mode = movement_mode.WALK
		
	
	match current_movement_mode:
		movement_mode.WALK:
			movement_multi = 1
		movement_mode.SPRINT:
			movement_multi = 25
		movement_mode.CROUCH:
			movement_multi = 0.7
	
	move_and_slide()


var slipperness : float = 0.6
var movement_multi : float = 1
func handle_move(delta):
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var forward: Vector3 = %Camera.global_transform.basis * Vector3(input.x, 0, input.y)
	var dir: Vector3 = Vector3(forward.x, 0, forward.z).normalized()
	var _dot = dir.dot(Vector3.FORWARD)
	_dot = max(0.25 + _dot, 1)
	
	velocity.x = velocity.x * slipperness * 0.91 + 0.1 * movement_multi\
	 * get_effect_multi() * pow((0.6 / slipperness), 3) * (dir.x * _dot)
	velocity.z = velocity.z * slipperness * 0.91 + 0.1 * movement_multi\
	 * get_effect_multi() * pow((0.6 / slipperness), 3) * (dir.z * _dot)

@export var speed : float = 20
@export var slowness : float = 0
func get_effect_multi(spd := speed, slw := slowness) -> float:
	var result = (1 + 0.2 * spd) * (1 - 0.15 * (slw / 10))
	return result if result >= 0.5 else 0.5
