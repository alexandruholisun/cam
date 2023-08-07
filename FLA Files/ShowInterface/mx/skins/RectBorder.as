dynamic class mx.skins.RectBorder extends mx.skins.Border
{
	var __width, __height, offset, __borderMetrics;
	function RectBorder() {
		super();
	}
	function get width() {
		return this.__width;
	}
	function get height() {
		return this.__height;
	}
	function init(Void) {
		super.init();
	}
	function draw(Void) {
		this.size();
	}
	function getBorderMetrics(Void) {
		var Register_2_ = this.offset;
		if (this.__borderMetrics == undefined){
			this.__borderMetrics = {left:Register_2_, top:Register_2_, right:Register_2_, bottom:Register_2_};
		} else {
			this.__borderMetrics.left = Register_2_;
			this.__borderMetrics.top = Register_2_;
			this.__borderMetrics.right = Register_2_;
			this.__borderMetrics.bottom = Register_2_;
		}
		return this.__borderMetrics;
	}
	function get borderMetrics() {
		return this.getBorderMetrics();
	}
	function drawBorder(Void) {
	}
	function size(Void) {
		this.drawBorder();
	}
	function setColor(Void) {
		this.drawBorder();
	}
	static var symbolName = "RectBorder";
	static var symbolOwner = mx.skins.RectBorder;
	static var version = "2.0.0.360";
	var className = "RectBorder";
	var borderStyleName = "borderStyle";
	var borderColorName = "borderColor";
	var shadowColorName = "shadowColor";
	var highlightColorName = "highlightColor";
	var buttonColorName = "buttonColor";
	var backgroundColorName = "backgroundColor";
}
