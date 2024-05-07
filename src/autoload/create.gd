class_name Factory
extends Node2D

var _deviceSpawner = preload ("res://device/device.tscn")
var _sampleSpawner = preload ("res://sample/sample.tscn")

## This is creates a nested device component
func device(data: DeviceData) -> Device:
	var deviceScene = _deviceSpawner.instantiate() as Device
	deviceScene.data = data
	return deviceScene

func sample(data: SampleSpecs) -> Sample:
	var sampleScene = _sampleSpawner.instantiate() as Sample
	sampleScene.specs = data
	return sampleScene
