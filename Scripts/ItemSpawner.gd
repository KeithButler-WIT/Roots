extends Node2D


func _ready():
	spawnItem(60)

func spawnItem(var numItems):
	var itemScene = preload("res://Scenes/Item.tscn")
	var rand = RandomNumberGenerator.new()
	var screen_size = get_viewport().get_visible_rect().size
	for i in range(0,numItems):
		var item = itemScene.instance()
		rand.randomize()
		var x = rand.randf_range(0,screen_size.x)
		rand.randomize()
		var y = rand.randf_range(0,screen_size.y)
		item.rotation = rand.randf_range(0,360)
		item.position.y = y
		item.position.x = x
		add_child(item)
		
		#var item = itemSprite.instance()
		#item.set_position(rect_position)
	#	currency.set_position($".".get_rect().position)
		#add_child(item)
	

#func _on_ManualClick_pressed():
	#spawnItem()
