class_name SessionManager
extends Node

const MAX_PLAYERS := 8

signal peer_joined(peer_id: int)
signal peer_left(peer_id: int)

var permissions := WorldPermissions.new()

func host(port := 24560, max_players := MAX_PLAYERS) -> Error:
	var peer := ENetMultiplayerPeer.new()
	var err := peer.create_server(port, clampi(max_players, 1, MAX_PLAYERS))
	if err != OK:
		return err
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_on_peer_connected)
	multiplayer.peer_disconnected.connect(_on_peer_disconnected)
	return OK

func join(address: String, port := 24560) -> Error:
	var peer := ENetMultiplayerPeer.new()
	var err := peer.create_client(address, port)
	if err != OK:
		return err
	multiplayer.multiplayer_peer = peer
	return OK

func _on_peer_connected(peer_id: int) -> void:
	peer_joined.emit(peer_id)

func _on_peer_disconnected(peer_id: int) -> void:
	peer_left.emit(peer_id)
