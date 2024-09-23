class_name DialogueSequence extends Resource

static var map := {}

@export var id: String:
	set(val):
		id = val
		map[id] = self

@export var steps: Array[DialogueStep]

static func get_sequence(id: String) -> DialogueSequence:
	return map.get(id)
