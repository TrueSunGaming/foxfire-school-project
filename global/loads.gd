extends Node

const traits := [
	"cook",
	"hydrophobia",
	"pyrophobia",
	"lazy",
	"solver"
]

const environments := [
	"home/floor1/floor1",
	"yard/yard"
]

const dialogue := [
	"stove_burn"
]

func _init() -> void:
	for i in traits: load("res://components/player/trait_system/traits/" + i + ".tres")
	for i in environments: load("res://components/environment/environments/" + i + ".tres")
	for i in dialogue: load("res://components/dialogue/data/" + i + ".tres")
