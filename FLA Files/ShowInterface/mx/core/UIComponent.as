dynamic class mx.core.UIComponent extends mx.core.UIObject
{
	var __width, __height, invalidate, stylecache, removeEventListener, dispatchEvent, drawFocus, addEventListener, _xscale, _yscale, _focusrect, watch, enabled;
	function UIComponent() {
		super();
	}
	function get width() {
		return this.__width;
	}
	function get height() {
		return this.__height;
	}
	function setVisible(x, noEvent) {
		super.setVisible(x, noEvent);
	}
	function enabledChanged(id, oldValue, newValue) {
		this.setEnabled(newValue);
		this.invalidate();
		delete this.stylecache.tf;
		return newValue;
	}
	function setEnabled(enabled) {
		this.invalidate();
	}
	function getFocus() {
		var selFocus = Selection.getFocus();
		return selFocus === null ? null : eval(selFocus);
	}
	function setFocus() {
		Selection.setFocus(this);
	}
	function getFocusManager() {
		var Register_2_ = this;
		while (Register_2_ != undefined){
			if (Register_2_.focusManager != undefined){
				return Register_2_.focusManager;
			}
			Register_2_ = Register_2_._parent;
		}
		return undefined;
	}
	function onKillFocus(newFocus) {
		this.removeEventListener("keyDown", this);
		this.removeEventListener("keyUp", this);
		this.dispatchEvent({type:"focusOut"});
		this.drawFocus(false);
	}
	function onSetFocus(oldFocus) {
		this.addEventListener("keyDown", this);
		this.addEventListener("keyUp", this);
		this.dispatchEvent({type:"focusIn"});
		if (this.getFocusManager().bDrawFocus != false){
			this.drawFocus(true);
		}
	}
	function findFocusInChildren(o) {
		if (o.focusTextField != undefined){
			return o.focusTextField;
		}
		if (o.tabEnabled == true){
			return o;
		}
		return undefined;
	}
	function findFocusFromObject(o) {
		if (o.tabEnabled != true){
			if (o._parent == undefined){
				return undefined;
			}
			if (o._parent.tabEnabled == true){
				o = o._parent;
			} else if (o._parent.tabChildren){
				o = this.findFocusInChildren(o._parent);
			} else {
				o = this.findFocusFromObject(o._parent);
			}
		}
		return o;
	}
	function pressFocus() {
		var Register_3_ = this.findFocusFromObject(this);
		var Register_2_ = this.getFocus();
		if (Register_3_ != Register_2_){
			Register_2_.drawFocus(false);
			if (this.getFocusManager().bDrawFocus != false){
				Register_3_.drawFocus(true);
			}
		}
	}
	function releaseFocus() {
		var Register_2_ = this.findFocusFromObject(this);
		if (Register_2_ != this.getFocus()){
			Register_2_.setFocus();
		}
	}
	function isParent(o) {
		while (o != undefined){
			if (o == this){
				return true;
			}
			o = o._parent;
		}
		return false;
	}
	function size() {
	}
	function init() {
		super.init();
		this._xscale = 100;
		this._yscale = 100;
		this._focusrect = _global.useFocusRect == false;
		this.watch("enabled", this.enabledChanged);
		if (this.enabled == false){
			this.setEnabled(false);
		}
	}
	function dispatchValueChangedEvent(value) {
		this.dispatchEvent({type:"valueChanged", value:value});
	}
	static var symbolName = "UIComponent";
	static var symbolOwner = mx.core.UIComponent;
	static var version = "2.0.0.360";
	static var kStretch = 5000;
	var focusEnabled = true;
	var tabEnabled = true;
	var origBorderStyles = {themeColor:16711680};
	var clipParameters = {};
	static var mergedClipParameters = mx.core.UIObject.mergeClipParameters(UIComponent.prototype.clipParameters, mx.core.UIObject.prototype.clipParameters);
}
