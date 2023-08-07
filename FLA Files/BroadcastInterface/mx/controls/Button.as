dynamic class mx.controls.Button extends mx.controls.SimpleButton
{
	var initIcon, getState, enabled, phase, labelPath, idNames, __width, __height, setState, invalidate, iconName, refresh, createLabel, _iconLinkageName, initializing, removeIcons, hitArea_mc, createEmptyObject;
	function Button() {
		super();
	}
	function init(Void) {
		super.init();
	}
	function draw() {
		super.draw();
		if (this.initIcon != undefined){
			this._setIcon(this.initIcon);
		}
		delete this.initIcon;
	}
	function onRelease(Void) {
		super.onRelease();
	}
	function createChildren(Void) {
		super.createChildren();
	}
	function setSkin(tag, linkageName, initobj) {
		return super.setSkin(tag, linkageName, initobj);
	}
	function viewSkin(varName) {
		var Register_3_ = this.getState() ? "true" : "false";
		Register_3_ = (Register_3_ + (this.enabled ? this.phase : "disabled"));
		super.viewSkin(varName, {styleName:this, borderStyle:Register_3_});
	}
	function invalidateStyle(c) {
		this.labelPath.invalidateStyle(c);
		super.invalidateStyle(c);
	}
	function setColor(c) {
		var Register_2_ = 0;
		while (Register_2_ < 8){
			this[this.idNames[Register_2_]].redraw(true);
			Register_2_++;
		}
	}
	function setEnabled(enable) {
		this.labelPath.enabled = enable;
		super.setEnabled(enable);
	}
	function calcSize(tag, ref) {
		if (this.__width == undefined || this.__height == undefined){
			return undefined;
		}
		if (tag < 7){
			ref.setSize(this.__width, this.__height, true);
		}
	}
	function size(Void) {
		this.setState(this.getState());
		this.setHitArea(this.__width, this.__height);
		var Register_3_ = 0;
		while (Register_3_ < 8){
			var Register_4_ = this.idNames[Register_3_];
			if (typeof(this[Register_4_]) == "movieclip"){
				this[Register_4_].setSize(this.__width, this.__height, true);
			}
			Register_3_++;
		}
		super.size();
	}
	function set labelPlacement(val) {
		this.__labelPlacement = val;
		this.invalidate();
	}
	function get labelPlacement() {
		return this.__labelPlacement;
	}
	function getLabelPlacement(Void) {
		return this.__labelPlacement;
	}
	function setLabelPlacement(val) {
		this.__labelPlacement = val;
		this.invalidate();
	}
	function getBtnOffset(Void) {
		if (this.getState()){
			var Register_2_ = this.btnOffset;
		} else if (this.phase == "down"){
			Register_2_ = this.btnOffset;
		} else {
			Register_2_ = 0;
		}
		return Register_2_;
	}
	function setView(offset) {
		var Register_G_ = offset ? this.btnOffset : 0;
		var Register_C_ = this.getLabelPlacement();
		var Register_7_ = 0;
		var Register_6_ = 0;
		var Register_9_ = 0;
		var Register_8_ = 0;
		var Register_5_ = 0;
		var Register_4_ = 0;
		var Register_3_ = this.labelPath;
		var Register_2_ = this.iconName;
		var Register_F_ = Register_3_.textWidth;
		var Register_E_ = Register_3_.textHeight;
		var Register_A_ = ((this.__width - this.borderW) - this.borderW);
		var Register_B_ = ((this.__height - this.borderW) - this.borderW);
		Register_3_._visible = true;
		if (Register_2_ != undefined){
			Register_7_ = Register_2_._width;
			Register_6_ = Register_2_._height;
		}
		if (Register_C_ == "left" || Register_C_ == "right"){
			if (Register_3_ != undefined){
				Register_9_ = Math.min((Register_A_ - Register_7_), (Register_F_ + 5));
				Register_3_._width = Register_9_;
				Register_8_ = Math.min(Register_B_, (Register_E_ + 5));
				Register_3_._height = Register_8_;
			}
			if (Register_C_ == "right"){
				Register_5_ = Register_7_;
				if (this.centerContent){
					Register_5_ = (Register_5_ + ((Register_A_ - Register_9_) - Register_7_) / 2);
				}
				Register_2_._x = Register_5_ - Register_7_;
			} else {
				Register_5_ = ((Register_A_ - Register_9_) - Register_7_);
				if (this.centerContent){
					Register_5_ = Register_5_ / 2;
				}
				Register_2_._x = Register_5_ + Register_9_;
			}
			Register_4_ = 0;
			Register_2_._y = Register_4_;
			if (this.centerContent){
				Register_2_._y = (Register_B_ - Register_6_) / 2;
				Register_4_ = (Register_B_ - Register_8_) / 2;
			}
			if (!this.centerContent){
				Register_2_._y +=  Math.max(0, (Register_8_ - Register_6_) / 2);
			}
		} else {
			if (Register_3_ != undefined){
				Register_9_ = Math.min(Register_A_, (Register_F_ + 5));
				Register_3_._width = Register_9_;
				Register_8_ = Math.min((Register_B_ - Register_6_), (Register_E_ + 5));
				Register_3_._height = Register_8_;
			}
			Register_5_ = (Register_A_ - Register_9_) / 2;
			Register_2_._x = (Register_A_ - Register_7_) / 2;
			if (Register_C_ == "top"){
				Register_4_ = ((Register_B_ - Register_8_) - Register_6_);
				if (this.centerContent){
					Register_4_ = Register_4_ / 2;
				}
				Register_2_._y = Register_4_ + Register_8_;
			} else {
				Register_4_ = Register_6_;
				if (this.centerContent){
					Register_4_ = (Register_4_ + ((Register_B_ - Register_8_) - Register_6_) / 2);
				}
				Register_2_._y = Register_4_ - Register_6_;
			}
		}
		var Register_D_ = (this.borderW + Register_G_);
		Register_3_._x = Register_5_ + Register_D_;
		Register_3_._y = Register_4_ + Register_D_;
		Register_2_._x +=  Register_D_;
		Register_2_._y +=  Register_D_;
	}
	function set label(lbl) {
		this.setLabel(lbl);
	}
	function setLabel(label) {
		if (label == ""){
			this.labelPath.removeTextField();
			this.refresh();
			return undefined;
		}
		if (this.labelPath == undefined){
			var Register_2_ = this.createLabel("labelPath", 200, label);
			Register_2_._width = Register_2_.textWidth + 5;
			Register_2_._height = Register_2_.textHeight + 5;
			Register_2_.visible = false;
		} else {
			this.labelPath.text = label;
			this.refresh();
		}
	}
	function getLabel(Void) {
		return this.labelPath.text;
	}
	function get label() {
		return this.labelPath.text;
	}
	function _getIcon(Void) {
		return this._iconLinkageName;
	}
	function get icon() {
		if (this.initializing){
			return this.initIcon;
		}
		return this._iconLinkageName;
	}
	function _setIcon(linkage) {
		if (this.initializing){
			if (linkage == ""){
				return undefined;
			}
			this.initIcon = linkage;
		} else {
			if (linkage == ""){
				this.removeIcons();
				return undefined;
			}
			super.changeIcon(0, linkage);
			super.changeIcon(1, linkage);
			super.changeIcon(4, linkage);
			super.changeIcon(5, linkage);
			this._iconLinkageName = linkage;
			this.refresh();
		}
	}
	function set icon(linkage) {
		this._setIcon(linkage);
	}
	function setHitArea(w, h) {
		if (this.hitArea_mc == undefined){
			this.createEmptyObject("hitArea_mc", 100);
		}
		var Register_2_ = this.hitArea_mc;
		Register_2_.clear();
		Register_2_.beginFill(16711680);
		Register_2_.drawRect(0, 0, w, h);
		Register_2_.endFill();
		Register_2_.setVisible(false);
	}
	static var symbolName = "Button";
	static var symbolOwner = mx.controls.Button;
	var className = "Button";
	static var version = "2.0.0.360";
	var btnOffset = 0;
	var _color = "buttonColor";
	var __label = "default value";
	var __labelPlacement = "right";
	var falseUpSkin = "ButtonSkin";
	var falseDownSkin = "ButtonSkin";
	var falseOverSkin = "ButtonSkin";
	var falseDisabledSkin = "ButtonSkin";
	var trueUpSkin = "ButtonSkin";
	var trueDownSkin = "ButtonSkin";
	var trueOverSkin = "ButtonSkin";
	var trueDisabledSkin = "ButtonSkin";
	var falseUpIcon = "";
	var falseDownIcon = "";
	var falseOverIcon = "";
	var falseDisabledIcon = "";
	var trueUpIcon = "";
	var trueDownIcon = "";
	var trueOverIcon = "";
	var trueDisabledIcon = "";
	var clipParameters = {labelPlacement:1, icon:1, toggle:1, selected:1, label:1};
	static var mergedClipParameters = mx.core.UIObject.mergeClipParameters(Button.prototype.clipParameters, mx.controls.SimpleButton.prototype.clipParameters);
	var centerContent = true;
	var borderW = 1;
}
