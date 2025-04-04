class_name SoundManagerNode
extends Node

@onready var soundtrack: AudioStreamPlayer = $Soundtrack
@onready var ada_voice: AudioStreamPlayer = $AdaVoice
@onready var heart_beating: AudioStreamPlayer = $HeartBeating
@onready var foot_steps: AudioStreamPlayer = $FootSteps
@onready var noticed_monster: AudioStreamPlayer = $NoticedMonster

func monstro_appeared() -> void:
	noticed_monster.play()
