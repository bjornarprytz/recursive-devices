class_name DeviceConfig
extends Resource

var initialState: PackedScene

func saveState(state: DeviceState):
	var scene = PackedScene.new()
	
	scene.pack(state)
	
	initialState = scene

func loadState() -> Node2D:
	return initialState.instantiate() as DeviceState
