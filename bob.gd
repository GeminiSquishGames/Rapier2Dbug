extends RigidBody2D

@onready var mov_time = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
    apply_impulse(Vector2(100,120))


func do_a_move():
    var rnd = randi() % 2

    match rnd:
        0:
            var impulse_x = randf_range(-100, 100)
            var impulse_y = randf_range(-100, 100)
            apply_impulse(Vector2.from_angle(global_rotation) * mass * 25)
        1:
            var impulse = randf_range(-1000, 1000) * mass * 2
            apply_torque_impulse(impulse)
