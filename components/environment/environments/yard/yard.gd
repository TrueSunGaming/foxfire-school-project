extends Node2D

func _on_door_body_entered(body: Node2D) -> void:
	if body != refs.player: return
	if refs.env.time_since_switch < 0.1: return
	
	refs.env.set_env("floor1")
	refs.player.global_position -= Vector2(0, 96)

func _on_maze_finish_body_entered(body: Node2D) -> void:
	if body != refs.player: return
	if refs.player.maze_completed: return
	
	refs.dialogue.start_dialogue("maze_finish")
	refs.player.maze_completed = true

func _on_dad_conversation_body_entered(body: Node2D) -> void:
	if body != refs.player: return
	
	refs.dialogue.start_dialogue("maze_intro")
