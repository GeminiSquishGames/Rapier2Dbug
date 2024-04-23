extends RigidBody2D

@export var speed = 1000

func _ready():
    apply_impulse( GMan.player.linear_velocity + Vector2.from_angle(rotation) * speed)
    GMan.player.linear_velocity += -linear_velocity


func _on_body_entered(body):
    queue_free()
