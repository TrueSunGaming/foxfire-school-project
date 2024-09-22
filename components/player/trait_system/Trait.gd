class_name Trait extends Resource

static var map: Dictionary = {}

@export var id: String:
	set(val):
		id = val
		map[val] = self

@export var name: String
@export var description: String

static func get_trait(id: String) -> Trait:
	print(map)
	return map.get(id)
