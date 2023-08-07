dynamic class mx.controls.VScrollBar extends mx.controls.scrollClasses.ScrollBar
{
	var scrollIt;
	function VScrollBar() {
		super();
	}
	function init(Void) {
		super.init();
	}
	function isScrollBarKey(k) {
		if (k == 38){
			this.scrollIt("Line", -1);
			return true;
		} else if (k == 40){
			this.scrollIt("Line", 1);
			return true;
		} else if (k == 33){
			this.scrollIt("Page", -1);
			return true;
		} else if (k == 34){
			this.scrollIt("Page", 1);
			return true;
		}
		return super.isScrollBarKey(k);
	}
	static var symbolName = "VScrollBar";
	static var symbolOwner = mx.core.UIComponent;
	static var version = "2.0.0.360";
	var className = "VScrollBar";
	var minusMode = "Up";
	var plusMode = "Down";
	var minMode = "AtTop";
	var maxMode = "AtBottom";
}
