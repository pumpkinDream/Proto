extends Control

onready var animPlayer = $AnimationPlayer
onready var transition = $SCENE_FX/Transition

onready var startBtn = $GUI/Start

func _ready():
	pass

func _process(_delta):
	pass

func _on_Start_pressed():
	startBtn.hide()
	animPlayer.play("Intro")
