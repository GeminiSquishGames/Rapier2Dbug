extends RigidBody2D


func _on_body_entered(body):
    print("Hit by ", body)
    if body.is_in_group("player_weapon"):
        body.queue_free()
        var tween = get_tree().create_tween()
        tween.tween_property(self, "modulate", Color(0,0,0,0.1), 1)
        await tween.finished
        queue_free()
    pass


