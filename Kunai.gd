extends RigidBody2D

export (int) var velocidad_min
export (int) var velocidad_max
var tipo_kunai = ["kunai"]


func _ready():
	$AnimatedSprite.animation = tipo_kunai[randi() % tipo_kunai.size()]


func _on_Visibilidad_screen_exited():
	queue_free() #elimina el kunai
