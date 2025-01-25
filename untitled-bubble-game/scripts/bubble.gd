extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var speed= 300
var got_hit = false

func _process(delta: float) -> void:
	if got_hit == false: 
		position.y += speed * delta

func _on_area_entered(area: Area2D) -> void:
	got_hit = true
	print(area.name)
	if area.name == "Bullet":
		print(Global.score)
		Global.score += 1
	if area.name == "Ground":
		print(Global.health)
		Global.health -= 1
	animation_player.play("pop")
