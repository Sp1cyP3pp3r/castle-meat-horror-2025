class_name ShakeCamera
extends Area3D

@export var trauma_reduction_rate : float = 1
@export var noise : Noise
@export var noise_speed : float = 50

@export var max_x : float = 10
@export var max_y : float = 10
@export var max_z : float = 5

var trauma : float = 0
var time : float = 0

@onready var camera : Camera3D = %Camera
@onready var init_rotation := camera.rotation_degrees as Vector3

func _process(delta):
	time += delta
	trauma = max(trauma - delta * trauma_reduction_rate, 0.0)
	
	camera.rotation_degrees.x = init_rotation.x + max_x * get_shake_intensity() * get_noise_from_seed(0)
	camera.rotation_degrees.y = init_rotation.y + max_y * get_shake_intensity() * get_noise_from_seed(1)
	camera.rotation_degrees.z = init_rotation.z + max_z * get_shake_intensity() * get_noise_from_seed(2)

func add_trauma(trauma_ammount : float):
	trauma = clamp(trauma + trauma_ammount, 0.0, 1.0)
	
func get_shake_intensity() -> float:
	return trauma * trauma

func get_noise_from_seed(seed : int) -> float:
	noise.seed = seed
	return noise.get_noise_1d(time * noise_speed)
