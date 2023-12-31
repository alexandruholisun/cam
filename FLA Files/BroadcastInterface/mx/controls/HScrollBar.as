dynamic class mx.controls.HScrollBar extends mx.controls.scrollClasses.ScrollBar
{
	var _minHeight, _minWidth, _xscale, _rotation, __width, scrollIt;
	function HScrollBar() {
		super();
	}
	function getMinWidth(Void) {
		return this._minHeight;
	}
	function getMinHeight(Void) {
		return this._minWidth;
	}
	function init(Void) {
		super.init();
		this._xscale = -100;
		this._rotation = -90;
	}
	function get virtualHeight() {
		return this.__width;
	}
	function isScrollBarKey(k) {
		if (k == 37){
			this.scrollIt("Line", -1);
			return true;
		} else if (k == 39){
			this.scrollIt("Line", 1);
			return true;
		}
		return super.isScrollBarKey(k);
	}
	static var symbolName = "HScrollBar";
	static var symbolOwner = mx.core.UIComponent;
	static var version = "2.0.0.360";
	var className = "HScrollBar";
	var minusMode = "Left";
	var plusMode = "Right";
	var minMode = "AtLeft";
	var maxMode = "AtRight";
}
