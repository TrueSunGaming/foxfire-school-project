class_name Dialogue extends MarginContainer

@export var sequence_id: String:
	set(val):
		sequence_id = val
		index = 0

@export var index: int:
	set(val):
		index = val
		update_content()

var sequence: DialogueSequence:
	get:
		return DialogueSequence.get_sequence(sequence_id)

var step: DialogueStep:
	get:
		return sequence.steps[index] if sequence and index < sequence.steps.size() else null

var stream := TextStream.new()

func _init() -> void:
	stream.complete.connect(update_options)

func _ready() -> void:
	refs.dialogue = self
	
	update_content()

func update_content() -> void:
	if not step: return hide()
	
	show()
	update_stream()
	$PanelContainer/VBoxContainer/Speaker.text = step.speaker
	for i in $PanelContainer/VBoxContainer/Options.get_children(): i.queue_free()

func update_stream() -> void:
	stream.reset()
	stream.text = step.text

func update_options() -> void:
	for i in step.options: add_option(i)
	if index < sequence.steps.size() - 1 or step.options.size() == 0: add_next()

func add_next() -> void:
	add_button("Close" if index >= sequence.steps.size() - 1 else "Next", func (): index += 1)

func add_option(option: DialogueOption) -> void:
	add_button(option.name, func (): sequence_id = option.sequence_id)

func add_button(text: String, callback: Callable) -> Button:
	var button := Button.new()
	button.text = text
	button.pressed.connect(callback)
	$PanelContainer/VBoxContainer/Options.add_child(button)
	
	return button

func _process(delta: float) -> void:
	stream.update(delta)
	$PanelContainer/VBoxContainer/Speech.text = stream.stream

func start_dialogue(id: String) -> void:
	sequence_id = id
