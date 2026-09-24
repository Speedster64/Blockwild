class_name PlayerController
extends CharacterBody3D

@export var move_speed := 7.0
@export var sprint_speed := 10.0
@export var jump_velocity := 6.0
@export var mouse_sensitivity := 0.002
@export var reach := 6.0

@onready var camera: Camera3D = $Camera3D

func _ready() -> void:
	add_to_group("player")
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		camera.rotate_x(-event.relative.y * mouse_sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-89), deg_to_rad(89))
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			_break_target()
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			_place_target()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	var input_vec := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var dir := (transform.basis * Vector3(input_vec.x, 0, input_vec.y)).normalized()
	var speed := sprint_speed if Input.is_action_pressed("sprint") else move_speed
	velocity.x = dir.x * speed
	velocity.z = dir.z * speed
	move_and_slide()

func _raycast() -> Dictionary:
	var from := camera.global_position
	var to := from + -camera.global_transform.basis.z * reach
	var query := PhysicsRayQueryParameters3D.create(from, to)
	return get_world_3d().direct_space_state.intersect_ray(query)

func _break_target() -> void:
	var hit := _raycast()
	if hit.is_empty():
		return
	var p := Vector3i(floor(hit.position - hit.normal * 0.01))
	_world().set_world_block(p, BlockRegistry.BlockId.AIR)

func _place_target() -> void:
	var hit := _raycast()
	if hit.is_empty():
		return
	var p := Vector3i(floor(hit.position + hit.normal * 0.01))
	_world().set_world_block(p, BlockRegistry.BlockId.DIRT)

func _world() -> WorldManager:
	return get_tree().get_first_node_in_group("world") as WorldManager
