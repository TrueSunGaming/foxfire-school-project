class_name TextStream extends Resource

signal complete

@export_multiline var text: String
@export var speed := 30.0
@export var paused: bool

var time: float = 0.0

var stream: String:
	get:
		return text.substr(0, floori(time * speed))

var completed: bool:
	get:
		return time * speed >= text.length()

func update(delta: float) -> void:
	if paused or completed: return
	
	time += delta
	if completed: complete.emit()

func reset() -> void:
	time = 0
