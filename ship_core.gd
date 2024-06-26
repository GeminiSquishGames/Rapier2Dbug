extends RigidBody2D

var bullet = preload("res://bullet.tscn")
var is_thrusting = false
var old_pos : Vector2
var velocity : float

@onready var shield : CollisionShape2D = $Shield
@onready var fire_d : Timer = $FireDelay


func _ready():
    # register globally
    GMan.player = self


func _physics_process(delta):
    velocity = position.distance_to(old_pos)
    mouse_rotation_control(delta)
    if is_thrusting:
        apply_impulse(Vector2.from_angle(global_rotation) * mass * 10.69)

    old_pos = position



func mouse_rotation_control(delta):
    var glr = global_rotation
    var to_rotation = lerp_angle(glr, glr + get_angle_to(get_global_mouse_position()) , 100 * delta)
    global_rotation = to_rotation


func _input(event):
    if Input.is_action_just_pressed("shoot") and fire_d.time_left == 0:
        var bullet_instance = bullet.instantiate()
        bullet_instance.position = position + Vector2.from_angle(global_rotation) * 50
        bullet_instance.global_rotation_degrees = global_rotation_degrees
        get_parent().add_child(bullet_instance)
        apply_impulse(-bullet_instance.linear_velocity * 100)
        fire_d.start()

    if Input.is_key_pressed(KEY_W):
        is_thrusting = true
    else:
        is_thrusting = false

    if Input.is_key_pressed(KEY_E):
        shield.disabled = not shield.disabled
        shield.visible = not shield.visible
        if shield.disabled:
            shield.process_mode = Node.PROCESS_MODE_DISABLED
        else:
            shield.process_mode = Node.PROCESS_MODE_ALWAYS
