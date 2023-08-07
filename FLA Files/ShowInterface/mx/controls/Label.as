dynamic class mx.controls.Label extends mx.core.UIObject
{
	var _yscale, _xscale, labelField, tabEnabled, tabChildren, useHandCursor, _color, initText, __autoSize, _getTextFormat, __width, setSize, _x, __height, enabled, getStyle;
	function Label() {
		super();
	}
	function init(Void) {
		super.init();
		this._xscale = this._yscale = 100;
		this.labelField.selectable = false;
		this.labelField.styleName = this;
		this.tabEnabled = false;
		this.tabChildren = false;
		this.useHandCursor = false;
		this._color = mx.core.UIObject.textColorList;
	}
	function get html() {
		return this.getHtml();
	}
	function set html(value) {
		this.setHtml(value);
	}
	function getHtml() {
		return this.labelField.html;
	}
	function setHtml(value) {
		if (value != this.labelField.html){
			this.labelField.html = value;
		}
	}
	function get text() {
		return this.getText();
	}
	function set text(t) {
		this.setText(t);
	}
	function getText() {
		if (this.initializing){
			return this.initText;
		}
		var Register_2_ = this.labelField;
		if (Register_2_.html == true){
			return Register_2_.htmlText;
		}
		return Register_2_.text;
	}
	function setText(t) {
		if (this.initializing){
			this.initText = t;
		} else {
			var Register_2_ = this.labelField;
			if (Register_2_.html == true){
				Register_2_.htmlText = t;
			} else {
				Register_2_.text = t;
			}
			this.adjustForAutoSize();
		}
	}
	function get autoSize() {
		return this.__autoSize;
	}
	function set autoSize(v) {
		if (_global.isLivePreview == true){
			v = "none";
		}
		this.__autoSize = v;
		if (!this.initializing){
			this.draw();
		}
	}
	function draw(Void) {
		var Register_2_ = this.labelField;
		if (this.initializing){
			var Register_4_ = this.text;
			this.initializing = false;
			this.setText(Register_4_);
			delete this.initText;
		}
		if (Register_2_.html){
			var Register_4_ = Register_2_.htmlText;
		}
		var Register_3_ = this._getTextFormat();
		Register_2_.embedFonts = Register_3_.embedFonts == true;
		if (Register_3_ != undefined){
			Register_2_.setTextFormat(Register_3_);
			Register_2_.setNewTextFormat(Register_3_);
		}
		if (Register_2_.html){
			Register_2_.htmlText = Register_4_;
		}
		this.adjustForAutoSize();
	}
	function adjustForAutoSize() {
		var Register_2_ = this.labelField;
		var Register_3_ = this.__autoSize;
		if (Register_3_ != undefined && Register_3_ != "none"){
			Register_2_._height = Register_2_.textHeight + 3;
			var Register_4_ = this.__width;
			this.setSize((Register_2_.textWidth + 4), Register_2_._height);
			if (Register_3_ == "right"){
				this._x +=  (Register_4_ - this.__width);
			} else if (Register_3_ == "center"){
				this._x +=  (Register_4_ - this.__width) / 2;
			} else if (Register_3_ == "left"){
				this._x +=  0;
			}
		} else {
			Register_2_._x = 0;
			Register_2_._width = this.__width;
			Register_2_._height = this.__height;
		}
	}
	function size(Void) {
		var Register_2_ = this.labelField;
		Register_2_._width = this.__width;
		Register_2_._height = this.__height;
	}
	function setEnabled(enable) {
		this.enabled = enable;
		var Register_2_ = this.getStyle(enable ? "color" : "disabledColor");
		if (Register_2_ == undefined){
			Register_2_ = enable ? 0 : 8947848;
		}
		this.setColor(Register_2_);
	}
	function setColor(col) {
		this.labelField.textColor = col;
	}
	function get styleSheet() {
		return this.labelField.styleSheet;
	}
	function set styleSheet(v) {
		this.labelField.styleSheet = v;
	}
	static var symbolName = "Label";
	static var symbolOwner = Object(Label);
	var className = "Label";
	static var version = "2.0.0.360";
	var initializing = true;
	var clipParameters = {text:1, html:1, autoSize:1};
	static var mergedClipParameters = mx.core.UIObject.mergeClipParameters(Label.prototype.clipParameters, mx.core.UIObject.prototype.clipParameters);
}
