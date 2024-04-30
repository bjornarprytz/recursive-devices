class_name DeviceConfig
extends Resource

## This is the ID of the state first passed to the constructor of this class
var id: int
@export var initialState: PackedScene

func _init(state: DeviceState) -> void:
	id = state.get_instance_id()
	saveState(state)

func saveState(state: DeviceState):
	var scene = PackedScene.new()
	
	scene.pack(state)
	
	initialState = scene

func loadState() -> Node2D:
	return initialState.instantiate() as DeviceState
