extends Sprite


var value = 0
var Mat

func _ready():
	Mat = self.get_material()
	Mat.set_shader_param("my_value",value)
