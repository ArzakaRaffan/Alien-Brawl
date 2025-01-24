extends Node2D

@onready var label_single: Label = $Control/LabelSingle
@onready var label_multi: Label = $Control/LabelMulti
@onready var timer_single: Timer = $Single/TimerSingle
@onready var timer_multi: Timer = $Multi/TimerMulti
@onready var lobby_char: MC = $Lobby_Char
var bool_multi:bool
var bool_single:bool
var countdown_single:int
var countdown_multi:int

func _ready() -> void:
	bool_multi = false
	bool_single = false
	countdown_multi = 5
	countdown_single = 5

func _process(delta: float) -> void:
	if bool_multi:
		label_multi.text = str(int(timer_multi.time_left))
		label_multi.show()
		await timer_multi.timeout
		lobby_char.stop()
	else :
		label_multi.hide()
		
	if bool_single:
		label_single.text = str(int(timer_single.time_left))
		label_single.show()
		await timer_single.timeout
		lobby_char.stop()
	else :
		label_single.hide()

#func _on_area_single_body_entered(body: Node2D) -> void:
	#if body is MC:
		#print('single')
		#bool_single = true
		#timer_single.start()
#
#func _on_area_single_body_exited(body: Node2D) -> void:
	#if body is MC:
		#print('single2')
		#bool_single = false
		#timer_single.stop()
		#timer_single.wait_time = 4.0
	#
#func _on_area_multi_body_entered(body: Node2D) -> void:
	#if body is MC:
		#print('multi')
		#bool_multi = true
		#timer_multi.start()
#
#func _on_area_multi_body_exited(body: Node2D) -> void:
	#if body is MC:
		#print('multi2')
		#bool_multi = false
		#timer_multi.stop()
		#timer_multi.wait_time = 4.0
