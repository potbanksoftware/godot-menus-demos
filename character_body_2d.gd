extends CharacterBody2D

var speed: int = 150


func _physics_process(_delta: float) -> void:
	velocity = (
		(
			Input
			. get_vector(
				"left",
				"right",
				"up",
				"down",
			)
		)
		* speed
	)

	move_and_slide()
