extends Control

onready var animPlayer = $AnimationPlayer
onready var transition = $SCENE_FX/Transition

onready var playBtn = $GUI/Menu/MenuBtns/Panel/StartBtn
onready var characterBtn = $GUI/Menu/MenuBtns/Panel/CharacterBtn
onready var settingsBtn = $GUI/Menu/MenuBtns/Panel/SettingsBtn
onready var aboutBtn = $GUI/Menu/MenuBtns/Panel/AboutBtn

onready var redBtn = $GUI/Menu/CharacterTab/Panel/ScrollContainer/CharacterSelection/Red
onready var yellowBtn = $GUI/Menu/CharacterTab/Panel/ScrollContainer/CharacterSelection/Yellow
onready var whiteBtn = $GUI/Menu/CharacterTab/Panel/ScrollContainer/CharacterSelection/White
onready var blueBtn = $GUI/Menu/CharacterTab/Panel/ScrollContainer/CharacterSelection/Blue
onready var violetBtn = $GUI/Menu/CharacterTab/Panel/ScrollContainer/CharacterSelection/Violet

onready var previewCharacter = $GUI/Menu/CharacterTab/Panel/Preview

onready var startBtn = $GUI/Start

var characterSelected

func _ready():
	pass

func _process(_delta):
	GameModes.character = characterSelected

func _on_Start_pressed():
	startBtn.hide()
	animPlayer.play("Intro")
	
#START TAB
func _on_StartBtn_toggled(button_pressed):
	if button_pressed == true:
		print("START PRESSED")
		
#CHARACTER TAB
func _on_CharacterBtn_toggled(button_pressed):
	if button_pressed == true:
		if aboutBtn.pressed == true:
			_on_AboutBtn_toggled(false)
			yield(animPlayer, "animation_finished")
			animPlayer.play("Character")
		else:
			animPlayer.play("Character")
	if button_pressed == false:
		characterBtn.pressed = false
		animPlayer.play_backwards("Character")
	
#ABOUT TAB
func _on_AboutBtn_toggled(button_pressed):
	if button_pressed == true:
		if characterBtn.pressed == true:
			
			_on_CharacterBtn_toggled(false)
			yield(animPlayer, "animation_finished")
			animPlayer.play("About")
		else:
			animPlayer.play("About")
	if button_pressed == false:
		aboutBtn.pressed = false
		animPlayer.play_backwards("About")

#SETTINGS TAB
func _on_SettingsBtn_toggled(button_pressed):
	if button_pressed == true:
		print("SETTING PRESSED")

#CHARACTER SELECTION
func _on_Red_toggled(button_pressed):
	if button_pressed == true:
		if yellowBtn.pressed == true:
			_on_Yellow_toggled(false)
		elif blueBtn.pressed == true:
			_on_Blue_toggled(false)
		elif whiteBtn.pressed == true:
			_on_White_toggled(false)
		elif violetBtn.pressed == true:
			_on_Violet_toggled(false)
		characterSelected = "Red"
		previewCharacter.texture = load("res://scenes/mainmenu/assets/UI/sprites/proto0.png")
	if button_pressed == false:
		redBtn.pressed = false
		previewCharacter.texture = null
	
func _on_Yellow_toggled(button_pressed):
	if button_pressed == true:
		if redBtn.pressed == true:
			_on_Red_toggled(false)
		elif blueBtn.pressed == true:
			_on_Blue_toggled(false)
		elif whiteBtn.pressed == true:
			_on_White_toggled(false)
		elif violetBtn.pressed == true:
			_on_Violet_toggled(false)
		characterSelected = "Yellow"
		previewCharacter.texture = load("res://scenes/mainmenu/assets/UI/sprites/proto1.png")
	if button_pressed == false:
		yellowBtn.pressed = false
		previewCharacter.texture = null

func _on_Blue_toggled(button_pressed):
	if button_pressed == true:
		if yellowBtn.pressed == true:
			_on_Yellow_toggled(false)
		elif redBtn.pressed == true:
			_on_Red_toggled(false)
		elif whiteBtn.pressed == true:
			_on_White_toggled(false)
		elif violetBtn.pressed == true:
			_on_Violet_toggled(false)
		characterSelected = "Blue"
		previewCharacter.texture = load("res://scenes/mainmenu/assets/UI/sprites/proto2.png")
	if button_pressed == false:
		blueBtn.pressed = false
		previewCharacter.texture = null

func _on_White_toggled(button_pressed):
	if button_pressed == true:
		if yellowBtn.pressed == true:
			_on_Yellow_toggled(false)
		elif blueBtn.pressed == true:
			_on_Blue_toggled(false)
		elif redBtn.pressed == true:
			_on_Red_toggled(false)
		elif violetBtn.pressed == true:
			_on_Violet_toggled(false)
		characterSelected = "White"
		previewCharacter.texture = load("res://scenes/mainmenu/assets/UI/sprites/proto3.png")
	if button_pressed == false:
		whiteBtn.pressed = false
		previewCharacter.texture = null

func _on_Violet_toggled(button_pressed):
	if button_pressed == true:
		if yellowBtn.pressed == true:
			_on_Yellow_toggled(false)
		elif blueBtn.pressed == true:
			_on_Blue_toggled(false)
		elif whiteBtn.pressed == true:
			_on_White_toggled(false)
		elif redBtn.pressed == true:
			_on_Red_toggled(false)
		characterSelected = "Violet"
		previewCharacter.texture = load("res://scenes/mainmenu/assets/UI/sprites/proto4.png")
	if button_pressed == false:
		violetBtn.pressed = false
		previewCharacter.texture = null
