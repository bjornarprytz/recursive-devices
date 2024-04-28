class_name Factory
extends Node2D

var _deviceSpawner = preload ("res://device/device.tscn")
var _sampleSpawner = preload ("res://sample/sample.tscn")
var _deviceEditSpawner = preload ("res://device/deviceEdit.tscn")

## This is creates a nested device component
func device(specs: DeviceSpecs) -> Device:
	var deviceScene = _deviceSpawner.instantiate() as Device
	deviceScene.specs = specs
	return deviceScene

func sample(data: SampleSpecs) -> Sample:
	var sampleScene = _sampleSpawner.instantiate() as Sample
	sampleScene.specs = data
	return sampleScene

## This creates a device that can be edited
func deviceEdit(config: DeviceConfig) -> DeviceEdit:
	var deviceEditScene = _deviceEditSpawner.instantiate() as DeviceEdit
	deviceEditScene.config = config
	return deviceEditScene
