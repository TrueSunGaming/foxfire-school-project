class_name Player extends CharacterBody2D

signal aged(age)

@export var movement_speed: float

var age := 0
var traits: Array[String] = []

var trait_resources: Array[Trait]:
	get:
		var res: Array[Trait] = []
		res.assign(traits.map(func (v): return Trait.get_trait(v)))
		return res

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("left", "right", "up", "down") * movement_speed
	
	move_and_slide()

func _ready() -> void:
	refs.player = self
	refs.age_timer = $Timer
	
	add_trait("test")

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

func finish() -> void:
	$Timer.stop()
	
	for i in trait_resources:
		OS.alert(i.description, i.name)
