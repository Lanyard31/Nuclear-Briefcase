extends Node

signal shoot

export (PackedScene) var Nuke

var population = 100
var missilecount = 100
var can_shoot = true
var position
var _position
var _direction

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("f"):
		if Input.is_action_pressed("shift"):
			print("FINLAND")
			fire_missile()
			return
		fire_missile()
		print("france")
		
func fire_missile():
	var dir = Vector2(1, 0).rotated($PlayerCity/Muzzle.global_rotation) #this is broken because you don't have a turret
	emit_signal('shoot', Nuke, $PlayerCity/Muzzle.global_position, dir)
	return
#		shoot signal leads to on_missile_fire
	
func _on_missile_fire(Nuke, _position, _direction):
	var b = Nuke.instance()
	add_child(b)
	b.start(_position, _direction)
	
	#subtract one from missilecount
	#create a missile at origin position
	#draw a line between origin and target
	#progress between origin and target
	#intercept other missiles if there are collisions
	#explosion anim at target
	#subtract from missile count and population