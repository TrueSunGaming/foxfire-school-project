class_name SceneEnvironment extends Node2D

var instance: Node
var time_since_switch := 0.0

func _ready() -> void:
	refs.env = self
	
	set_env("floor1")

func _process(delta: float) -> void:
	time_since_switch += delta

func set_env_raw(scene: PackedScene) -> void:
	if instance: instance.queue_free()
	instance = scene.instantiate()
	
	call_deferred("add_child", instance)
	
	time_since_switch = 0.0

func set_env(id: String) -> void:
	var ed := EnvironmentData.get_data(id)
	if not ed: return OS.alert("Environment " + id + " does not exist", "Environment does not exist")
	set_env_raw(ed.scene)
