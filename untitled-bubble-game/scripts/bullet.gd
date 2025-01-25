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
var exploded = false

func _ready():
	explosion_animation.hide()
	explosion_animation.frame = 1

func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and not is_moving:
		target = get_global_mouse_position()
		start_bullet()
	if is_moving:
		if position != target:
			position = position.move_toward(target*10000, SPEED * delta)
		if distanceTraveled >= RANGE:
			stop_bullet()

func start_bullet():
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
		collision_shape.disabled = true
		stop_bullet()
		explosion_animation.show()
		explosion_animation.play("explode")
		animation_player.play("explosion")