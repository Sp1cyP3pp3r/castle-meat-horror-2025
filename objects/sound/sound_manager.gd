class_name SoundManagerNode
extends Node

@onready var soundtrack: AudioStreamPlayer = $Soundtrack
@onready var ada_voice: AudioStreamPlayer = $AdaVoice
@onready var heart_beating: AudioStreamPlayer = $HeartBeating
@onready var foot_steps: AudioStreamPlayer = $FootSteps
@onready var noticed_monster: AudioStreamPlayer = $NoticedMonster
@onready var player : Player = get_tree().get_nodes_in_group("Player")[0]

func monstro_appeared() -> void:
	noticed_monster.play()
	var _red = player.shake_camera.trauma_reduction_rate
	player.shake_camera.trauma_reduction_rate = 0
	player.shake_camera.add_trauma(0.5)
	await get_tree().create_timer(0.3).timeout
	player.shake_camera.trauma_reduction_rate = _red
