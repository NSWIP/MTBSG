class_name Notification extends Control

@onready var root = get_node(".")
var duration = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func init(title, content):
	get_node("MarginContainer/MarginContainer/VBoxContainer/Label").text = title
	get_node("MarginContainer/MarginContainer/VBoxContainer/Label2").text = content

func notification_show(aduration):
	duration = aduration
	root.visible = true
	get_node("AnimationPlayer").connect("animation_finished", _notif_show)
	get_node("AnimationPlayer").play("show")

func _notif_show(_name):
	get_node("AnimationPlayer").disconnect("animation_finished", _notif_show)
	get_node("Timer").connect("timeout", notification_hide)
	get_node("Timer").start(duration)

func notification_hide():
	get_node("AnimationPlayer").connect("animation_finished", _notif_hide)
	get_node("AnimationPlayer").play_backwards("show")

func _notif_hide(_name):
	root.visible = false
	get_node("Timer").disconnect("timeout", notification_hide)
	get_node("Timer").stop()
	get_node("AnimationPlayer").disconnect("animation_finished", _notif_hide)

