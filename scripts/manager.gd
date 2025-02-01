extends Node

static var json: Dictionary = {};
static var current_level := 0;
static var current_round := 0;

func _ready():
	call_deferred("init");

func init():
	var file = FileAccess.open("res://data/data.json", FileAccess.READ);
	if file == null:
		print("Could not open data/data.json file in manager.gd.")
		return;
	var content = file.get_as_text();
	file.close();
	json = JSON.parse_string(content);
	if json == null:
		print("Failed to parse json from data/data.json.");
		return;
	print("here's a test for level 0 round 0 burger list: ", get_round_list("burger"));

func get_round_list(key: String) -> Array:
	return json["levels"][current_level]["rounds"][current_round][key];

func next_level():
	current_level += 1;

func next_round():
	current_round += 1;
