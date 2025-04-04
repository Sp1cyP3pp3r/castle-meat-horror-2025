extends VisibleOnScreenNotifier3D



func _ready() -> void:
	screen_entered.connect(SoundManager.monstro_appeared)
