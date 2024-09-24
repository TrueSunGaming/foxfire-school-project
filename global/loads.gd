extends Node

const traits := [
	"cook",
	"hydrophobic",
	"pyrophobic",
	"lazy",
	"solver",
	"curious",
	"artistic",
	"responsible",
	"irresponsible"
]

const environments := [
	"home/floor1/floor1",
	"yard/yard"
]

const dialogue := [
	"stove_burn",
	"maze_intro",
	"dad_lore",
	"home_beauty",
	"maze_finish",
	"sink_drown",
	"sink_apologize",
	"sink_excuses"
]

func _init() -> void:
	for i in traits: load("res://components/player/trait_system/traits/" + i + ".tres")
	for i in environments: load("res://components/environment/environments/" + i + ".tres")
	for i in dialogue: load("res://components/dialogue/data/" + i + ".tres")
