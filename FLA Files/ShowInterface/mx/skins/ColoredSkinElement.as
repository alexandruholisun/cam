dynamic class mx.skins.ColoredSkinElement
{
	var _color, getStyle, onEnterFrame;
	function ColoredSkinElement() {
	}
	function setColor(c) {
		if (c != undefined){
			var Register_2_ = new Color(this);
			Register_2_.setRGB(c);
		}
	}
	function draw(Void) {
		this.setColor(this.getStyle(this._color));
		this.onEnterFrame = undefined;
	}
	function invalidateStyle(Void) {
		this.onEnterFrame = this.draw;
	}
	static function setColorStyle(p, colorStyle) {
		if (p._color == undefined){
			p._color = colorStyle;
		}
		p.setColor = mixins.setColor;
		p.invalidateStyle = mixins.invalidateStyle;
		p.draw = mixins.draw;
		p.setColor(p.getStyle(colorStyle));
	}
	static var mixins = new ColoredSkinElement();
}
