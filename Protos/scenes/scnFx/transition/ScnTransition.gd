extends CanvasLayer

onready var animPlayer = $AnimationPlayer

func transition(nextScene:String):
	animPlayer.play("zoomIn")
	var _changeScene = get_tree().change_scene(nextScene)
