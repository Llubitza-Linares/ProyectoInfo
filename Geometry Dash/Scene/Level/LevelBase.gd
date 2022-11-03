extends Node2D

const ATTEMPT = "Attempt "

func stop_music():
	$music.stop()

func _ready():
	$Player.connect("died", self, "_on_hero_die")
	$Player.connect("die_timer", self, "_on_hero_die_timer")

	$Attempt.text = ATTEMPT + String(globals.level_attemps)
	$Win.hide()
func _physics_process(delta):
	$Background.position.x = $Player.position.x

func _on_hero_die():
	globals.level_attemps += 1
	stop_music()

func _on_hero_die_timer():
	get_tree().reload_current_scene()


