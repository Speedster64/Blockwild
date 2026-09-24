extends Node3D

func _ready() -> void:
	var world := WorldManager.new()
	world.name = "World"
	world.add_to_group("world")
	add_child(world)

	var player := PlayerController.new()
	player.name = "Player"
	player.position = Vector3(0, 40, 0)
	var camera := Camera3D.new()
	camera.name = "Camera3D"
	player.add_child(camera)
	add_child(player)

	var light := DirectionalLight3D.new()
	light.rotation_degrees = Vector3(-55, -35, 0)
	light.shadow_enabled = true
	add_child(light)

	var environment := WorldEnvironment.new()
	var env := Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color(0.48, 0.72, 0.95)
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color(0.7, 0.75, 0.8)
	env.ambient_light_energy = 0.8
	environment.environment = env
	add_child(environment)
