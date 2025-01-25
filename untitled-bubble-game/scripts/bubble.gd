extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

const BULLET_LAYER = 2
const GROUND_LAYER = 3
const BUBBLE_LAYER = 4

var speed = Global.speed
var got_hit = false

func _process(delta: float) -> void:
	if got_hit == false: 
		position.y += speed * delta

func _on_area_entered(area: Area2D) -> void:
	got_hit = true

	if area.collision_layer & (1 << BULLET_LAYER) != 0:
		Global.score += 1
		Global.speed += 10
		
	if area.collision_layer & (1 << GROUND_LAYER) != 0:
		Global.health -= 1
		
	animation_player.play("pop")
