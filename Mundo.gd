extends Node
export (PackedScene) var Kunai
var Score

func _ready():
	randomize()
	
func nuevo_juego():
	Score = 0
	$Ninja.inicio($PosicionDeInicio.position) #posición de inicio del ninja
	$InicioTimer.start()
	$Interfaz.mostrar_mensaje("LISTO!")
	$Interfaz.update_score(Score)
	$Musica.play()

func game_over():
	$ScoreTimer.stop()
	$KunaiTimer.stop()
	$Interfaz.game_over()
	$AudioMuerte.play()
	$Musica.stop(	)


func _on_InicioTimer_timeout():
	$KunaiTimer.start()
	$ScoreTimer.start()


func _on_ScoreTimer_timeout():
	Score += 1
	$Interfaz.update_score(Score)


func _on_KunaiTimer_timeout():
	#Seleccionar un lugar aleatorio en el path o camino
	$Camino/KunaiPosicion.set_offset(randi())
	
	var K = Kunai.instance()
	add_child(K)
	
	#Seleccionar una direccion
	var d = $Camino/KunaiPosicion.rotation + PI /2
	
	K.position = $Camino/KunaiPosicion.position
	
	d += rand_range(-PI /4, PI /4)
	K.rotation = d
	K.set_linear_velocity(Vector2(rand_range(K.velocidad_min, K.velocidad_max), 0).rotated(d))
	
	
	
	
	
