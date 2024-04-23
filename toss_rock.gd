extends Node2D

var rock : PackedScene = preload("res://rock.tscn")
var max_rocks = 100

static var num_rocks = 0


func _ready():
    GMan.tosser = self


func make_rock():
    # dumb... just turn off timer if < max
    if num_rocks >= max_rocks:
        return

    var rock_instance : RigidBody2D = rock.instantiate()

    var impulse_x = randf_range(-1000, 1000)
    var impulse_y = randf_range(-1000, 1000)
    var impulse_vec = Vector2(impulse_x,impulse_y) * 10
    var rot_impulse = randf_range(-1000, 1000) * rock_instance.mass
    rock_instance.position = position
    # n toss
    rock_instance.apply_impulse(impulse_vec)
    rock_instance.apply_torque_impulse(rot_impulse)

    get_tree().root.add_child(rock_instance)

    num_rocks += 1

