extends CanvasLayer

signal iniciar_juego

func mostrar_mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$MensajeTimer.start()

func game_over():
	mostrar_mensaje("Game Over")
	yield($MensajeTimer,"timeout")
	$Button.show()
	$Mensaje.text = "FURIA NINJA"
	$Mensaje.show()
	
func update_score(Puntos):
	$ScoreLabel.text = str(Puntos)

func _on_MensajeTimer_timeout():
	$Mensaje.hide()

func _on_Button_pressed():
	$Button.hide()
	emit_signal("iniciar_juego")
