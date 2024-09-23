extends Node2D

func _on_door_body_entered(body: Node2D) -> void:
	if body != refs.player: return
	if refs.env.time_since_switch < 0.1: return
	
	refs.env.set_env("floor1")
	refs.player.global_position -= Vector2(0, 96)
