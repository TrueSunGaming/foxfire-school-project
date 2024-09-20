class_name Player extends CharacterBody2D

@export var movement_speed: float

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("left", "right", "up", "down") * movement_speed
	
	move_and_slide()
