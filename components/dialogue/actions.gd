extends Node

var action_map := {
	"pull_back": func (): refs.player.global_position += Vector2(0, 96),
	"help_kitchen": func (): refs.player.kitchen_helped = true
}
