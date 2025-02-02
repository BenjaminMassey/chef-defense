extends Node3D;

@export var speed: float = 1.0;

var current_path = 0;

func _process(delta):
	move_path(delta);

func move_path(delta):
	var path = get_tree().current_scene.get_node("%path");
	if path.get_child_count() < current_path:
		return;
	var target = path.get_child(current_path);
	if target == null:
		return;
	var target_position = target.global_position;
	var direction = (target_position - global_position).normalized();
	global_position += direction * speed * delta
	if global_position.distance_to(target_position) < 0.1:
		current_path += 1;
