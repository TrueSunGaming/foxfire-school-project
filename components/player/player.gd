class_name Player extends CharacterBody2D

@export var movement_speed: float

var age := 0

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("left", "right", "up", "down") * movement_speed
	
	move_and_slide()

func _ready() -> void:
	refs.player = self
