extends RigidBody2D

var bullet = preload("res://bullet.tscn")


func _ready():
    GameManager.player = self


func _physics_process(delta):
    mouse_rotation_control(delta)


func mouse_rotation_control(delta):
    var glr = global_rotation
    var to_rotation = lerp_angle(glr, glr + get_angle_to(get_global_mouse_position()) , 100 * delta)
    global_rotation = to_rotation


func _input(event):
    if Input.is_action_just_pressed("Fire"):
        var bullet_instance = bullet.instantiate()
        bullet_instance.position = position
        bullet_instance.global_rotation_degrees = global_rotation_degrees
        get_parent().add_child(bullet_instance)
