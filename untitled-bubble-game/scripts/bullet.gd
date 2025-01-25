extends Area2D

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var shoot_animation: AnimatedSprite2D = $ShootAnimation
@onready var explosion_animation: AnimatedSprite2D = $ExplosionAnimation
@onready var animation_player: AnimationPlayer = $ExplosionAnimation/AnimationPlayer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

const SPEED = 1500
const RANGE = 1200

var target :Vector2 
var distanceTraveled = 0
var is_moving = false
var moved = false
var exploded = false

func _ready():
	shoot_animation.hide()
	explosion_animation.hide()
	explosion_animation.frame = 1

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click") and not is_moving and moved !=true:
		target = get_global_mouse_position()
		start_bullet()
	if is_moving:
		if position != target:
			position = position.move_toward(target*10000, SPEED * delta)
		if distanceTraveled >= RANGE:
			stop_bullet()
	else:
		look_at(get_global_mouse_position())

func start_bullet():
	moved = true
	shoot_animation.show()
	audio_stream_player_2d.play()
	is_moving = true
	distanceTraveled = 0
	shoot_animation.play("shoot")

func stop_bullet():
	is_moving = false
	shoot_animation.stop()
	shoot_animation.hide()

func _on_area_entered(area: Area2D) -> void:
	if exploded == false:
		stop_bullet()
		explosion_animation.show()
		explosion_animation.play("explode")
		animation_player.play("explosion")
