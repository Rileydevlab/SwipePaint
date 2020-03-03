extends Node

var drawblockbigcolorone = preload("res://draw.tscn")
var drawblocksmallcolorone = preload("res://draw2.tscn")
var drawblocksmallcolortwo = preload("res://draw3.tscn")
var drawblockbigcolortwo = preload("res://draw4.tscn")
#var pressed = false
onready var timer = $Timer


var randomnumone = 0
var randomnumtwo = 0
var randomnumthree = 0
var brush = 0
var color = 0

func _ready():
	timer.connect("timeout", self, "_on_Timer_timeout")
	
func _input(event):
#	if event is InputEventScreenTouch:
#		if event.pressed:
#			pressed = true
#			print("pressed")
#		else:
#			pressed = false
#			print("nah")
	if event is InputEventScreenDrag:
		if event.get_position().x < 677:
			var block
			if brush == 0 && color == 0:
				block = drawblockbigcolorone.instance()
			if brush == 1 && color == 0:
				block = drawblocksmallcolorone.instance()
			if brush == 0 && color == 1:
				block = drawblockbigcolortwo.instance()
			if brush == 1 && color == 1:
				block = drawblocksmallcolortwo.instance()
			block.modulate = Color(randomnumone,randomnumtwo,randomnumthree)
			block.set_position(event.get_position())
			print(event.get_position())
		#print(randomnumone,randomnumtwo,randomnumthree)
			block.add_to_group("drawing")
			get_parent().add_child(block)
#		var swipe = event.get_speed()
#		print(event.get_position())
#		if swipe.x <  -900:
#			print("left swipe")
#		if swipe.x > 900:
#			print("right swipe")
#		if swipe.y <  -900:
#			print("Up swipe")
#		if swipe.y > 900:
#			print("Down swipe")

func _on_Timer_timeout():
	randomnumone = randi()%10
	randomnumtwo = randi()%10
	randomnumthree = randi()%10
	

func _on_BigBrush_pressed():
	brush = 0


func _on_SmallBrush_pressed():
	brush = 1

func _on_ColorOne_pressed():
	color = 0

func _on_ColorTwo_pressed():
	color = 1
	

func _on_ClearCanavs_pressed():
	var value = 30
	var Mat
	var drawingblocks = get_tree().get_nodes_in_group("drawing")
	for drawingsblock in drawingblocks:
		drawingsblock.queue_free()

func _on_Transform_pressed():
	var value = 30
	var Mat
	var drawingblocks = get_tree().get_nodes_in_group("drawing")
	for drawingsblock in drawingblocks:
		Mat = drawingsblock.get_material()
		Mat.set_shader_param("my_value",value)


func _on_TransformStop_pressed():
	var value = 0
	var Mat
	var drawingblocks = get_tree().get_nodes_in_group("drawing")
	for drawingsblock in drawingblocks:
		Mat = drawingsblock.get_material()
		Mat.set_shader_param("my_value",value)
