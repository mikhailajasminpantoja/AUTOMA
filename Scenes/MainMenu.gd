extends Control

@onready var start_button = $VBoxContainer/Start
@onready var exit_button = $VBoxContainer/Exit
@onready var world_scene = preload("res://Scenes/world.tscn")



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_exit_pressed():
		SilentWolf.Auth.logout_player()


func _on_start_pressed():
	get_tree().change_scene_to_packed(world_scene)

