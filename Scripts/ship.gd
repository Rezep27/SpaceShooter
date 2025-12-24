extends CharacterBody2D
class_name Ship

@export var max_speed := 400.0
@export var acceleration := 800.0
@export var rotation_speed := 3.0

@export var bullet : PackedScene

var thrust := 0.0
var rotation_input := 0.0
var shoot_requested := false
var can_shoot := true

func _physics_process(delta: float) -> void:
	_handle_rotation(delta)
	_handle_movement(delta)
	_handle_shooting()
	
func _handle_rotation(delta):
	rotation += rotation_input * rotation_speed * delta

func _handle_movement(delta):
	var direction = Vector2.UP.rotated(rotation)
	velocity = velocity.move_toward(direction * thrust * max_speed, acceleration * delta)
	move_and_slide()
	
func _handle_shooting():
	if shoot_requested and can_shoot:
		print("Shooted a bullet")
		can_shoot = false
		$ShotCD.start()

func _on_shot_cd_timeout() -> void:
	can_shoot = true
