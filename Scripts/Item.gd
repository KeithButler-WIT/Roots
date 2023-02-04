extends KinematicBody2D

var isTarget : bool = false

func _ready():
	#deleteItem()
	pass


func deleteItem():
	# Add a timer to this node
	var timer = Timer.new()
	self.add_child(timer)
	
	# Connect the timer to make it call "queue_free" after two seconds
	timer.connect("timeout", self, "queue_free")
	timer.set_wait_time(2)
	timer.start()
	
#	queue_free()

var velocity = Vector2()

func _on_RigidBody2D_mouse_entered():
	var speed = Input.get_last_mouse_speed();

	velocity = Vector2()
	if speed.x:
		velocity.x += speed
	if speed.x < 0:
		velocity.x -= speed
	if speed.y > 0:
		velocity.y += speed
	if speed.y < 0:
		velocity.y -= speed
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	velocity = move_and_slide(velocity)
