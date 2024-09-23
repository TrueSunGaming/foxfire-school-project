class_name Trait extends Resource

static var map := {}

enum IncompatibleHandle {
	NO_ADD,
	REMOVE_OTHER
}

@export var id: String:
	set(val):
		id = val
		map[val] = self

@export var name: String
@export_multiline var description: String
@export var incompatible: Array[String]
@export var incompatible_handle: IncompatibleHandle

static func get_trait(id: String) -> Trait:
	return map.get(id)
