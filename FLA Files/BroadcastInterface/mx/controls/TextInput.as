dynamic class mx.controls.TextInput extends mx.core.UIComponent
{
	var owner, enterListener, label, tabChildren, tabEnabled, focusTextField, _color, _parent, border_mc, createClassObject, dispatchValueChangedEvent, tfx, tfy, tfw, tfh, enabled, getStyle, bind, updateModel, _getTextFormat;
	function TextInput() {
		super();
	}
	function addEventListener(event, handler) {
		if (event == "enter"){
			this.addEnterEvents();
		}
		super.addEventListener(event, handler);
	}
	function enterOnKeyDown() {
		if (Key.getAscii() == 13){
			this.owner.dispatchEvent({type:"enter"});
		}
	}
	function addEnterEvents() {
		if (this.enterListener == undefined){
			this.enterListener = new Object();
			this.enterListener.owner = this;
			this.enterListener.onKeyDown = this.enterOnKeyDown;
		}
	}
	function init(Void) {
		super.init();
		this.label.styleName = this;
		this.tabChildren = true;
		this.tabEnabled = false;
		this.focusTextField = this.label;
		this._color = mx.core.UIObject.textColorList;
		label.onSetFocus = function () {
			this._parent.onSetFocus();
		}
		label.onKillFocus = function (n) {
			this._parent.onKillFocus(n);
		}
		label.drawFocus = function (b) {
			this._parent.drawFocus(b);
		}
		this.label.onChanged = this.onLabelChanged;
	}
	function setFocus() {
		Selection.setFocus(this.label);
	}
	function onLabelChanged(Void) {
		this._parent.dispatchEvent({type:"change"});
		this._parent.dispatchValueChangedEvent(this.text);
	}
	function createChildren(Void) {
		super.createChildren();
		if (this.border_mc == undefined){
			this.createClassObject(_global.styles.rectBorderClass, "border_mc", 0, {styleName:this});
		}
		this.border_mc.swapDepths(this.label);
		this.label.autoSize = "none";
	}
	function get html() {
		return this.getHtml();
	}
	function set html(value) {
		this.setHtml(value);
	}
	function getHtml() {
		return this.label.html;
	}
	function setHtml(value) {
		if (value != this.label.html){
			this.label.html = value;
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
		if (this.label.html == true){
			return this.label.htmlText;
		}
		return this.label.text;
	}
	function setText(t) {
		if (this.initializing){
			this.initText = t;
		} else {
			var Register_2_ = this.label;
			if (Register_2_.html == true){
				Register_2_.htmlText = t;
			} else {
				Register_2_.text = t;
			}
		}
		this.dispatchValueChangedEvent(t);
	}
	function size(Void) {
		this.border_mc.setSize(this.width, this.height);
		var Register_2_ = this.border_mc.borderMetrics;
		var Register_6_ = (Register_2_.left + Register_2_.right);
		var Register_3_ = (Register_2_.top + Register_2_.bottom);
		var Register_5_ = Register_2_.left;
		var Register_4_ = Register_2_.top;
		this.tfx = Register_5_;
		this.tfy = Register_4_;
		this.tfw = this.width - Register_6_;
		this.tfh = this.height - Register_3_;
		this.label.move(this.tfx, this.tfy);
		this.label.setSize(this.tfw, (this.tfh + 1));
	}
	function setEnabled(enable) {
		this.enabled = enable;
		this.label.type = (this.__editable == true || this.enabled == false) ? "input" : "dynamic";
		this.label.selectable = this.enabled;
		var Register_2_ = this.getStyle(enable ? "color" : "disabledColor");
		if (Register_2_ == undefined){
			Register_2_ = enable ? 0 : 8947848;
		}
		this.setColor(Register_2_);
	}
	function setColor(col) {
		this.label.textColor = col;
	}
	function onKillFocus(newFocus) {
		if (this.enterListener != undefined){
			Key.removeListener(this.enterListener);
		}
		if (this.bind != undefined){
			this.updateModel(this.text);
		}
		super.onKillFocus(newFocus);
	}
	function onSetFocus(oldFocus) {
		var f = Selection.getFocus();
		var o = eval(f);
		if (o != this.label){
			Selection.setFocus(this.label);
			return undefined;
		}
		if (this.enterListener != undefined){
			Key.addListener(this.enterListener);
		}
		super.onSetFocus(oldFocus);
	}
	function draw(Void) {
		var Register_2_ = this.label;
		var Register_4_ = this.getText();
		if (this.initializing){
			this.initializing = false;
			delete this.initText;
		}
		var Register_3_ = this._getTextFormat();
		Register_2_.embedFonts = Register_3_.embedFonts == true;
		if (Register_3_ != undefined){
			Register_2_.setTextFormat(Register_3_);
			Register_2_.setNewTextFormat(Register_3_);
		}
		Register_2_.multiline = false;
		Register_2_.wordWrap = false;
		if (Register_2_.html == true){
			Register_2_.setTextFormat(Register_3_);
			Register_2_.htmlText = Register_4_;
		} else {
			Register_2_.text = Register_4_;
		}
		Register_2_.type = (this.__editable == true || this.enabled == false) ? "input" : "dynamic";
		this.size();
	}
	function setEditable(s) {
		this.__editable = s;
		this.label.type = s ? "input" : "dynamic";
	}
	function get maxChars() {
		return this.label.maxChars;
	}
	function set maxChars(w) {
		this.label.maxChars = w;
	}
	function get length() {
		return this.label.length;
	}
	function get restrict() {
		return this.label.restrict;
	}
	function set restrict(w) {
		this.label.restrict = w == "" ? null : w;
	}
	function get hPosition() {
		return this.label.hscroll;
	}
	function set hPosition(w) {
		this.label.hscroll = w;
	}
	function get maxHPosition() {
		return this.label.maxhscroll;
	}
	function get editable() {
		return this.__editable;
	}
	function set editable(w) {
		this.setEditable(w);
	}
	function get password() {
		return this.label.password;
	}
	function set password(w) {
		this.label.password = w;
	}
	function get tabIndex() {
		return this.label.tabIndex;
	}
	function set tabIndex(w) {
		this.label.tabIndex = w;
	}
	function set _accProps(val) {
		this.label._accProps = val;
	}
	function get _accProps() {
		return this.label._accProps;
	}
	static var symbolName = "TextInput";
	static var symbolOwner = mx.controls.TextInput;
	static var version = "2.0.0.360";
	var className = "TextInput";
	var initializing = true;
	var clipParameters = {text:1, editable:1, password:1, maxChars:1, restrict:1};
	static var mergedClipParameters = mx.core.UIObject.mergeClipParameters(TextInput.prototype.clipParameters, mx.core.UIComponent.prototype.clipParameters);
	var _maxWidth = mx.core.UIComponent.kStretch;
	var __editable = true;
	var initText = "";
}
