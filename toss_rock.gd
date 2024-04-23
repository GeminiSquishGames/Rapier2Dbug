extends Node2D

var rock : PackedScene = preload("res://rock.tscn")

static var rocks = 0

func make_rock():
    var impulse_x = randf_range(-1000, 1000)
    var impulse_y = randf_range(-1000, 1000)
    var impulse_vec = Vector2(impulse_x,impulse_y) * 10
    var rock_instance : RigidBody2D = rock.instantiate()
    rock_instance.position = position
    # n toss
    rock_instance.apply_impulse(impulse_vec)
    get_tree().root.add_child(rock_instance)
