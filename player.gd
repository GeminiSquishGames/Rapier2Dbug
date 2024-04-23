extends RigidBody2D

var bullet = preload("res://bullet.tscn")
var is_thrusting = false

@onready var fire_delay : Timer = $FireDelay


func _ready():
    GameManager.player = self


func _physics_process(delta):
    mouse_rotation_control(delta)
    if is_thrusting:
        apply_impulse(Vector2.from_angle(global_rotation) * mass * 10.69)

func mouse_rotation_control(delta):
    var glr = global_rotation
    var to_rotation = lerp_angle(glr, glr + get_angle_to(get_global_mouse_position()) , 100 * delta)
    global_rotation = to_rotation


func _input(event):
    if Input.is_action_just_pressed("Fire") and fire_delay.time_left == 0:
        var bullet_instance = bullet.instantiate()
        bullet_instance.position = position + Vector2.from_angle(global_rotation) * 50
        bullet_instance.global_rotation_degrees = global_rotation_degrees
        get_parent().add_child(bullet_instance)
        apply_impulse(-bullet_instance.linear_velocity * 100)
        $FireDelay.start()

    if Input.is_key_pressed(KEY_W):
        is_thrusting = true
    else:
        is_thrusting = false




