extends Area2D

export (int) var Velocidad
var Movimiento = Vector2()
var limite
signal golpe

func _ready():
	hide() #Ocultar el personaje
	limite = get_viewport_rect().size

func _process(delta):
	Movimiento = Vector2() #Reiniciar el valor
	
	if Input.is_action_pressed("ui_right"): #Derecha
		Movimiento.x += 1
	if Input.is_action_pressed("ui_left"): #Izquierda
		Movimiento.x -= 1
	if Input.is_action_pressed("ui_down"): #Abajo
		Movimiento.y += 1
	if Input.is_action_pressed("ui_up"): #Ariiba
		Movimiento.y -= 1
	
	if Movimiento.length() > 0: #Verificar si se está moviendo
		Movimiento = Movimiento.normalized() * Velocidad #Normalizar la velocidad
	
	position += Movimiento * delta #Actualzar los movimientos
	position.x = clamp(position.x, 0, limite.x)
	position.y = clamp(position.y, 0, limite.y)
	
	if Movimiento.x != 0:
		$Player.animation = "avance"
		$Player.flip_h = Movimiento.x < 0
		$Player.flip_v = false
	elif Movimiento.y != 0:
		$Player.animation = "sube"
		$Player.flip_v = Movimiento.y > 0 
	else:
		$Player.animation = "quieto"

func _on_Ninja_body_entered(body): #Cuando haya una colisión con un cuerpo
	hide()
	emit_signal("golpe")
	$CollisionShape2D.disabled = true
	
func inicio(pos):
	position = pos 
	show() #Mostar el personaje
	$CollisionShape2D.disabled = false;
	
	
	
	
	
	
	
	
