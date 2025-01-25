extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var speed= 300
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _process(delta: float) -> void:
	position.y += speed*delta



func _on_area_entered(area: Area2D) -> void:
	animation_player.play("pop")
