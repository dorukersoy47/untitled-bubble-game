extends Node2D

@onready var bullet: Area2D = $Bullet
@onready var timer: Timer = $Timer
@onready var cannon: CharacterBody2D = $Cannon
@onready var marker_2d: Marker2D = %Marker2D

var canShoot = true
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click") and canShoot:
		shoot()
		timer.start(0.3)

func shoot():
	canShoot=false
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = cannon.global_position
	add_child(new_bullet)


func _on_timer_timeout() -> void:
	canShoot=true 
