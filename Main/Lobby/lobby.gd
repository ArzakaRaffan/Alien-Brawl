extends Node2D

@onready var lobby_char: MC = $Lobby_Char

var bool_multi:bool
var bool_single:bool
var countdown_single:int
var countdown_multi:int

func _ready() -> void:
	bool_multi = false
	bool_single = false

func _process(delta: float) -> void:
	pass


func _on_area_sing_body_entered(body: Node2D) -> void:
	if body is MC :
		lobby_char.stop()

func _on_area_mult_body_entered(body: Node2D) -> void:
	if body is MC :
		lobby_char.stop()
