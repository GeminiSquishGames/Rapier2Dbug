extends RigidBody2D

@onready var col = $CollisionShape2D

func _on_body_entered(body):
    if body.is_in_group("player_weapon"):
        col.disabled = true
        var tween = get_tree().create_tween()
        tween.tween_property(self, "modulate", Color(0,0,0,0.1), 0.2)
        await tween.finished
        # keep track of dem rocks
        GMan.tosser.num_rocks -+ 1
        queue_free()
    pass


