extends Node

const traits := [
	"test",
	"cook",
	"hydrophobia",
	"pyrophobia",
	"lazy"
]

const environments := [
	"home/floor1/floor1",
	"yard/yard"
]

func _init() -> void:
	for i in traits: load("res://components/player/trait_system/traits/" + i + ".tres")
	for i in environments: load("res://components/environment/environments/" + i + ".tres")
