class_name Game extends Node

var http_request = HTTPRequest.new()
var version = Version.new(0, 1, 0)
var latest_version = Version.new(-1, -1, -1)

func _ready():
	add_child(http_request)
	print(version)
	get_latest_from_github()
	if version.compare(latest_version) == 1:
		OS.shell_open("")

func get_latest_from_github():
	http_request.request_completed.connect(Callable(_on_get_latest_from_github))
	var err = http_request.request("https://api.github.com/repos/NSWIP/MTBSG/releases/latest", PackedStringArray(["Accept: application/vnd.github+json"]))
	if err != OK:
		printerr(err)

func _on_get_latest_from_github(result: int, response_code: int, _headers: PackedStringArray, body: PackedByteArray):
	if result != HTTPRequest.RESULT_SUCCESS:
		printerr(result)
		return
	
	if response_code != 200:
		printerr("Bad Response")
		return
	
	latest_version = JSON.parse_string(body.get_string_from_utf8())["tag_name"]

class Version:
	var Major: int
	var Minor: int
	var Preview: int

	func _init(arg_major: int, arg_minor: int, arg_preview: int):
		Major = arg_major
		Minor = arg_minor
		Preview = arg_preview

	func _to_string():
		return str(Major) + "." + str(Minor) + "." + str(Preview)

	### Compares two versions
	### Returns: -1 if the passed version is older, 0 if they are the same, 1 if the passed version is newer
	func compare(arg_version: Version) -> int:
		if Major > arg_version.Major:
			return -1
		elif Major < arg_version.Major:
			return 1

		if Minor > arg_version.Minor:
			return -1
		elif Minor < arg_version.Minor:
			return 1
		
		if Preview > arg_version.Preview:
			return -1
		elif Preview < arg_version.Preview:
			return 1

		return 0