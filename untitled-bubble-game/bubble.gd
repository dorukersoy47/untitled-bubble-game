extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var speed= 300
var got_hit = false
var hit_ground = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if not( got_hit or hit_ground):
		position.y += speed*delta



func _on_area_entered(area: Area2D) -> void:
	if area.name=="bullet":
		got_hit = true 
		speed=0
	if area.name=="ground":
		hit_ground = true
		speed=0
	print("pop")
	animation_player.play("pop")
