extends CharacterBody2D


const speed = 100
var current_dir = "none"

@onready var all_interactions = []
@onready var InteractLabel = $"Interaction Component/InteractLabel"

func _ready():
	update_interactions()
	
func _physics_process(delta):
	player_movement(delta)
	
	if Input.is_action_just_pressed("interact"):
		execute_interaction()

func player_movement(delta):
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("Running")
		elif movement == 0:
			anim.play("Idle")
			
	elif dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("Running")
		elif movement == 0:
			anim.play("Idle")
			
	elif dir == "down":
		anim.flip_h = false
		if movement == 1:
			anim.play("Running")
		elif movement == 0:
			anim.play("Idle")
			
	elif dir == "up":
		anim.flip_h = false
		if movement == 1:
			anim.play("Running")
		elif movement == 0:
			anim.play("Idle")

#interactions

func _on_interaction_area_area_entered(area):
	all_interactions.insert(0, area)
	update_interactions()
	


func _on_interaction_area_area_exited(area):
	all_interactions.erase(area)
	update_interactions()
	
func update_interactions():
	if all_interactions:
		InteractLabel.text = all_interactions[0].interact_label
	else:
		InteractLabel.text = ""
		
func execute_interaction():
	if all_interactions:
		var current_interactions = all_interactions[0]
		match current_interactions.interact_type:
			"print_text" : print(current_interactions.interact_value)
		
