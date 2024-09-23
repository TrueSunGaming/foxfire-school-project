class_name Player extends CharacterBody2D

signal aged(age)
signal finished

@export var movement_speed := 500.0
@export var run_multiplier := 3.0 / 2.0
@export var sneak_multiplier := 2.0 / 3.0

var age := 5
var traits: Array[String] = []

var trait_resources: Array[Trait]:
	get:
		var res: Array[Trait] = []
		res.assign(traits.map(func (v): return Trait.get_trait(v)))
		return res

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("left", "right", "up", "down") * movement_speed
	if Input.is_action_pressed("run"): velocity *= run_multiplier
	if Input.is_action_pressed("sneak"): velocity *= sneak_multiplier
	
	move_and_slide()

func _ready() -> void:
	refs.player = self
	refs.age_timer = $Timer

func _on_timer_timeout() -> void:
	age += 1
	aged.emit(age)
	
	if age >= 19: finish()

func skip_age() -> void:
	if $Timer.is_stopped(): return
	
	$Timer.stop()
	$Timer.start()
	_on_timer_timeout()

func add_trait(id: String) -> void:
	traits.push_back(id)

func remove_trait(id: String) -> void:
	traits.erase(id)

func has_trait(id: String) -> bool:
	return traits.has(id)

func finish() -> void:
	if traits.size() < 1: add_trait("lazy")
	
	$Timer.stop()
	finished.emit()
	
	global.end_traits = traits
	get_tree().change_scene_to_file("res://global/end.tscn")
