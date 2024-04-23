extends RigidBody2D

@export var speed = 1000

func _ready():
    apply_impulse( GameManager.player.linear_velocity + Vector2.from_angle(rotation) * speed)
    GameManager.player.linear_velocity += -linear_velocity
