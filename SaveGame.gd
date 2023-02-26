# Thanks to GDQuest
# https://www.youtube.com/watch?v=j7p7cGj20jU
class_name SaveGame
extends Reference

const SAVE_GAME_PATH:= "user://save.json"

var version: int = 1
var _file:= File.new()

func save_exists() -> bool:
	return _file.file_exists(SAVE_GAME_PATH)

func write_savegame():
	var error:= _file.open(SAVE_GAME_PATH, File.WRITE)
	
	if error != OK:
		printerr("Could not open the file %s. Aborting save operation. Error code: %s" % [SAVE_GAME_PATH, error])
		return
	
	var data:= {
		"frog_name": Global.frog_name,
		"run_highscore": Global.run_highscore,
		"age": Global.age,
		"hunger": Global.hunger,
		"money": Global.money,
		"seen_win_screen": Global.seen_win_screen,
	}
	
	var json_string := JSON.print(data)
	_file.store_string(json_string)
	_file.close()
	
func load_savegame():
	var error := _file.open(SAVE_GAME_PATH, File.READ)
	if error != OK:
		printerr("Could not open the file %s. Aborting load operation. Error code: %s" % [SAVE_GAME_PATH, error])
		return
	
	var content := _file.get_as_text()
	_file.close()
	
	var data: Dictionary = JSON.parse(content).result
	Global.frog_name = data.frog_name
	Global.run_highscore = data.run_highscore
	Global.age = data.age
	Global.hunger = data.hunger
	Global.money = data.money
	Global.seen_win_screen = data.seen_win_screen

func delete_savegame():
	var dir = Directory.new()
	dir.remove(SAVE_GAME_PATH)
	
	Global.score = 0
	Global.run_highscore = 0
	Global.frog_name = ""
	Global.age = 0.0
	Global.hunger = 99
	Global.money = 0
	Global.seen_win_screen = false
