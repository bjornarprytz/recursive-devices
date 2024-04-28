class_name DeviceConfig
extends Resource

var initialState: PackedScene

func save(state: DeviceState):
	var scene = PackedScene.new()
	
	scene.pack(state)
	
	initialState = scene

func load() -> DeviceState:
	return initialState.instantiate() as DeviceState
