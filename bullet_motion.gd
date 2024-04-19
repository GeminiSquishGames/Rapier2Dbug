extends RigidBody2D

@export var speed = 1000
var dummy

func _ready():
    dummy = %Dummy02

    apply_impulse( GameManager.player.linear_velocity + Vector2.from_angle(rotation) * speed)

func kill():
    queue_free()
