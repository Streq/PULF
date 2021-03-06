extends CPUParticles2D

var orb = null
var freeing = false

func _process(delta):
	if !emitting and !freeing and is_inside_tree():
		freeing = true
		get_tree().create_timer(lifetime).connect("timeout", self, "queue_free")

	if is_instance_valid(orb):
		var _scale = clamp(100 / max(orb.linear_velocity.length(),0.1), 1.0, 1.0)
		global_scale = Vector2(_scale,_scale)
#		lifetime = 0.3*_scale
		
		global_position = orb.global_position
		global_rotation = 0
