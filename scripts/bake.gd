extends Node3D

var food = preload("res://scenes/food.tscn");
var burger = preload("res://models/burger.glb");

func _ready():
	call_deferred("run"); # TODO: reliant on %manager and manager.gd's JSON parse

func run():
	var times = %manager.get_round_list("burger");
	for time in times:
		schedule_function(time, "add_burger");

func schedule_function(delay: float, function_name: String):
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = delay
	timer.one_shot = true
	timer.connect("timeout", Callable(self, function_name))
	timer.start()

func add_burger():
	var food_item = food.instantiate();
	%foods.add_child(food_item);
	food_item.global_position = global_position;
	var burger_item = burger.instantiate();
	food_item.add_child(burger_item);
	burger_item.global_position = global_position;
