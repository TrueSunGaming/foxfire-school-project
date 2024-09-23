class_name EnvironmentData extends Resource

static var map := {}

@export var id: String:
	set(val):
		id = val
		map[val] = self

@export var scene: PackedScene

static func get_data(id: String) -> EnvironmentData:
	return map.get(id)
