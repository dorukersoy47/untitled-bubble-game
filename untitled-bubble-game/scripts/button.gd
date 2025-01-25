extends Button

func _ready():
	self.pressed.connect(self._button_pressed)
	
func _button_pressed():
	Global.health = 10
	Global.score = 0
	Global.speed = 200
	get_tree().change_scene_to_file("res://scenes/game.tscn")
