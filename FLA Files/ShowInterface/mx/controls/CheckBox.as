dynamic class mx.controls.CheckBox extends mx.controls.Button
{
	var _getTextFormat, labelPath, iconName;
	function CheckBox() {
		super();
	}
	function onRelease() {
		super.onRelease();
	}
	function init() {
		super.init();
	}
	function size() {
		super.size();
	}
	function get emphasized() {
		return undefined;
	}
	function calcPreferredHeight() {
		var Register_5_ = this._getTextFormat();
		var Register_3_ = Register_5_.getTextExtent2(this.labelPath.text).height;
		var Register_4_ = this.iconName._height;
		var Register_2_ = 0;
		if (this.__labelPlacement == "left" || this.__labelPlacement == "right"){
			Register_2_ = Math.max(Register_3_, Register_4_);
		} else {
			Register_2_ = (Register_3_ + Register_4_);
		}
		return Math.max(14, Register_2_);
	}
	function set toggle(v) {
	}
	function get toggle() {
	}
	function set icon(v) {
	}
	function get icon() {
	}
	static var symbolName = "CheckBox";
	static var symbolOwner = mx.controls.CheckBox;
	static var version = "2.0.0.360";
	var className = "CheckBox";
	var ignoreClassStyleDeclaration = {Button:1};
	var btnOffset = 0;
	var __toggle = true;
	var __selected = false;
	var __labelPlacement = "right";
	var __label = "CheckBox";
	var falseUpSkin = "";
	var falseDownSkin = "";
	var falseOverSkin = "";
	var falseDisabledSkin = "";
	var trueUpSkin = "";
	var trueDownSkin = "";
	var trueOverSkin = "";
	var trueDisabledSkin = "";
	var falseUpIcon = "CheckFalseUp";
	var falseDownIcon = "CheckFalseDown";
	var falseOverIcon = "CheckFalseOver";
	var falseDisabledIcon = "CheckFalseDisabled";
	var trueUpIcon = "CheckTrueUp";
	var trueDownIcon = "CheckTrueDown";
	var trueOverIcon = "CheckTrueOver";
	var trueDisabledIcon = "CheckTrueDisabled";
	var clipParameters = {label:1, labelPlacement:1, selected:1};
	static var mergedClipParameters = mx.core.UIObject.mergeClipParameters(CheckBox.prototype.clipParameters, mx.controls.Button.prototype.clipParameters);
	var centerContent = false;
	var borderW = 0;
}
