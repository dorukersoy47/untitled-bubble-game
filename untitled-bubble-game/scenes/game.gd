extends Node2D

@onready var bullet: Area2D = $Bullet
@onready var bullet_timer: Timer = $BulletTimer
@onready var bubble_timer: Timer = $BubbleTimer
@onready var cannon: CharacterBody2D = $Cannon
@onready var marker_2d: Marker2D = %Marker2D

var bubble_x
var bubble_y
var random = RandomNumberGenerator.new()

func _on_bubble_time_timeout() -> void:
	print("your mother")
	var bubble = preload("res://scenes/bubble.tscn").instantiate()
	bubble_x = random.randf_range(-525, 525)
	bubble_y = -700
	bubble.global_position = Vector2(bubble_x, bubble_y)
	add_child(bubble)

var canShoot = true
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click") and canShoot:
		shoot()
		bullet_timer.start(0.3)

func shoot():
	canShoot=false
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = cannon.global_position
	add_child(new_bullet)

func _on_timer_timeout() -> void:
	canShoot=true
