extends Menu


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_parent() == get_tree().root:
		# Launched as main scene (F6)
		enable_menu()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not visible:
		return

	if Input.is_action_just_pressed("menu_close"):
		menu_closed.emit()

	process_home_end_keys()


func _on_back_button_pressed() -> void:
	menu_closed.emit()


func enable_menu() -> void:
	await get_tree().create_timer(0.01).timeout
	show()
	set_process(true)
	_focus_node(_main_container_node.get_child(int(has_title)))
