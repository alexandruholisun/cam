dynamic class mx.controls.TextArea extends mx.core.ScrollView
{
	var label, invalidate, initText, dispatchValueChangedEvent, getHPosition, setHPosition, getVPosition, setVPosition, _color, focusTextField, tfx, tfy, tfw, tfh, doLater, _vpos, _hpos, hookedV, vScroller, hookedH, hScroller, getViewMetrics, hScrollPolicy, vScrollPolicy, enabled, getStyle, getFocusManager, addEventListener, removeEventListener, _getTextFormat, setScrollProperties;
	function TextArea() {
		super();
	}
	function get maxChars() {
		return this.label.maxChars;
	}
	function set maxChars(x) {
		this.label.maxChars = x;
	}
	function get length() {
		return this.label.length;
	}
	function get restrict() {
		return this.label.restrict;
	}
	function set restrict(s) {
		this.label.restrict = s == "" ? null : s;
	}
	function get wordWrap() {
		return this.label.wordWrap;
	}
	function set wordWrap(s) {
		this.label.wordWrap = s;
		this.invalidate();
	}
	function get editable() {
		return this.__editable;
	}
	function set editable(x) {
		this.__editable = x;
		this.label.type = x ? "input" : "dynamic";
	}
	function get password() {
		return this.label.password;
	}
	function set password(s) {
		this.label.password = s;
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
		var Register_2_ = this.label;
		if (Register_2_.html == true){
			return Register_2_.htmlText;
		}
		return Register_2_.text;
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
			this.invalidate();
		}
		this.dispatchValueChangedEvent(t);
	}
	function get hPosition() {
		return this.getHPosition();
	}
	function set hPosition(pos) {
		this.setHPosition(pos);
		this.label.hscroll = pos;
		this.label.background = false;
	}
	function get vPosition() {
		return this.getVPosition();
	}
	function set vPosition(pos) {
		this.setVPosition(pos);
		this.label.scroll = pos + 1;
		this.label.background = false;
	}
	function get maxVPosition() {
		var Register_2_ = (this.label.maxscroll - 1);
		return Register_2_ == undefined ? 0 : Register_2_;
	}
	function get maxHPosition() {
		var Register_2_ = this.label.maxhscroll;
		return Register_2_ == undefined ? 0 : Register_2_;
	}
	function init(Void) {
		super.init();
		this.label.styleName = this;
		this._color = mx.core.UIObject.textColorList;
		this.focusTextField = this.label;
		this.label.owner = this;
		label.onSetFocus = function (x) {
			this._parent.onSetFocus(x);
		}
		label.onKillFocus = function (x) {
			this._parent.onKillFocus(x);
		}
		label.drawFocus = function (b) {
			this._parent.drawFocus(b);
		}
		label.onChanged = function () {
			this.owner.adjustScrollBars();
			this.owner.dispatchEvent({type:"change"});
			this.owner.dispatchValueChangedEvent(this.owner.text);
		}
		label.onScroller = function () {
			this.owner.hPosition = this.hscroll;
			this.owner.vPosition = this.scroll - 1;
		}
		if (this.text == undefined){
			this.text = "";
		}
	}
	function createChildren(Void) {
		super.createChildren();
		this.label.autoSize = "none";
	}
	function layoutContent(x, y, totalW, totalH, displayW, displayH) {
		var Register_2_ = this.label;
		if (((this.tfx != x || this.tfy != y) || this.tfw != displayW) || (this.tfh != displayH)){
			this.tfx = x;
			this.tfy = y;
			this.tfw = displayW;
			this.tfh = displayH;
			Register_2_.move(this.tfx, this.tfy);
			Register_2_.setSize(this.tfw, this.tfh);
			this.doLater(this, "adjustScrollBars");
		}
	}
	function scrollChanged(Void) {
		var Register_2_ = Selection;
		if (Register_2_.lastBeginIndex != undefined){
			this.restoreSelection();
		}
		this.label.background = false;
	}
	function onScroll(docObj) {
		var Register_3_ = this.label;
		super.onScroll(docObj);
		Register_3_.hscroll = this.hPosition + 0;
		Register_3_.scroll = this.vPosition + 1;
		this._vpos = Register_3_.scroll;
		this._hpos = Register_3_.hscroll;
		Register_3_.background = false;
		if (this.hookedV != true){
			this.vScroller.addEventListener("scrollChanged", this);
			this.hookedV = true;
		}
		if (this.hookedH != true){
			this.hScroller.addEventListener("scrollChanged", this);
			this.hookedH = true;
		}
	}
	function size(Void) {
		var Register_3_ = this.getViewMetrics();
		var Register_7_ = (Register_3_.left + Register_3_.right);
		var Register_4_ = (Register_3_.top + Register_3_.bottom);
		var Register_6_ = Register_3_.left;
		var Register_5_ = Register_3_.top;
		this.tfx = Register_6_;
		this.tfy = Register_5_;
		this.tfw = this.width - Register_7_;
		this.tfh = this.height - Register_4_;
		super.size();
		this.label.move(this.tfx, this.tfy);
		this.label.setSize(this.tfw, this.tfh);
		if (this.height <= 40){
			this.hScrollPolicy = "off";
			this.vScrollPolicy = "off";
		}
		this.doLater(this, "adjustScrollBars");
	}
	function setEnabled(enable) {
		this.enabled = enable;
		this.vScroller.enabled = enable;
		this.hScroller.enabled = enable;
		this.label.type = (this.editable == false || this.enabled == false) ? "dynamic" : "input";
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
	function setFocus(Void) {
		Selection.setFocus(this.label);
	}
	function onSetFocus(x) {
		var f = Selection.getFocus();
		var o = eval(f);
		if (o != this.label){
			Selection.setFocus(this.label);
			return undefined;
		}
		this.getFocusManager().defaultPushButtonEnabled = false;
		this.addEventListener("keyDown", this);
		super.onSetFocus(x);
	}
	function onKillFocus(x) {
		this.getFocusManager().defaultPushButtonEnabled = true;
		this.removeEventListener("keyDown", this);
		super.onKillFocus(x);
	}
	function restoreSelection(x) {
		var Register_2_ = Selection;
		Selection.setSelection(Register_2_.lastBeginIndex, Register_2_.lastEndIndex);
		this.label.scroll = this._vpos;
		this.label.hscroll = this._hpos;
	}
	function getLineOffsets(Void) {
		var Register_G_ = this._getTextFormat();
		var Register_I_ = Register_G_.getTextExtent2(this.label.text);
		var Register_5_ = _root._getTextExtent;
		Register_5_.setNewTextFormat(Register_G_);
		var Register_E_ = this.label.wordWrap;
		var Register_9_ = 0;
		var Register_7_ = ((this.label._width - 2) - 2);
		var Register_C_ = new Array();
		var Register_H_ = new String(this.label.text);
		var Register_F_ = Register_H_.split("\r");
		var Register_B_ = 0;
		while (Register_B_ < Register_F_.length){
			Register_C_.push(Register_9_);
			var Register_4_ = Register_F_[Register_B_];
			Register_5_.text = Register_4_;
			var Register_D_ = Math.ceil(Register_5_.textWidth / Register_7_);
			var Register_A_ = Math.floor(Register_4_.length / Register_D_);
			var Register_3_ = undefined;
			while (Register_E_ && Register_5_.textWidth > Register_7_){
				Register_3_ = Register_4_.indexOf(" ", Register_A_);
				var Register_6_ = undefined;
				if (Register_3_ == -1){
					Register_3_ = Register_4_.lastIndexOf(" ");
					if (Register_3_ == -1){
						Register_3_ = Register_A_;
					}
				}
				Register_6_ = Register_4_.substr(0, Register_3_);
				Register_5_.text = Register_6_;
				if (Register_5_.textWidth > Register_7_){
					while (Register_5_.textWidth > Register_7_){
						var Register_8_ = Register_3_;
						Register_3_ = Register_4_.lastIndexOf(" ", (Register_3_ - 1));
						if (Register_3_ == -1){
							Register_3_ = (Register_8_ - 1);
						}
						Register_6_ = Register_4_.substr(0, Register_3_);
						Register_5_.text = Register_6_;
					}
				} else if (Register_5_.textWidth < Register_7_){
					var Register_8_ = Register_3_;
					while (Register_5_.textWidth < Register_7_){
						Register_8_ = Register_3_;
						Register_3_ = Register_4_.indexOf(" ", (Register_3_ + 1));
						if (Register_3_ == -1){
							if (Register_4_.indexOf(" ", 0) != -1){
								break;
							} else {
								Register_3_ = (Register_8_ + 1);
							}
						}
						Register_6_ = Register_4_.substr(0, Register_3_);
						Register_5_.text = Register_6_;
					}
					Register_3_ = Register_8_;
				}
				Register_9_ = (Register_9_ + Register_3_);
				Register_C_.push(Register_9_ + 1);
				Register_4_ = Register_4_.substr(Register_3_);
				if (Register_4_.charAt(0) == " "){
					Register_4_ = Register_4_.substr(1, (Register_4_.length - 1));
					Register_9_ = (Register_9_ + 1);
				}
				Register_5_.text = Register_4_;
			}
			Register_9_ = (Register_9_ + (Register_4_.length + 1));
			Register_B_++;
		}
		return Register_C_;
	}
	function keyDown(e) {
		var Register_5_ = e.code;
		if (Register_5_ == 34){
			var Register_6_ = ((this.label.bottomScroll - this.label.scroll) + 1);
			var Register_3_ = this.getLineOffsets();
			var Register_2_ = Math.min((this.label.bottomScroll + 1), this.label.maxscroll);
			if (Register_2_ == this.label.maxscroll){
				var Register_4_ = this.label.length;
				Selection.setSelection(Register_4_, Register_4_);
			} else {
				this.label.scroll = Register_2_;
				Selection.setSelection(Register_3_[(Register_2_ - 1)], Register_3_[(Register_2_ - 1)]);
			}
		} else if (Register_5_ == 33){
			Register_6_ = ((this.label.bottomScroll - this.label.scroll) + 1);
			Register_3_ = this.getLineOffsets();
			Register_2_ = (this.label.scroll - 1);
			if (Register_2_ < 1){
				Selection.setSelection(0, 0);
			} else {
				Selection.setSelection(Register_3_[(Register_2_ - 1)], Register_3_[(Register_2_ - 1)]);
				this.label.scroll = Math.max((Register_2_ - Register_6_), 1);
			}
		}
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
		Register_2_.multiline = true;
		Register_2_.wordWrap = this.wordWrap == true;
		if (Register_2_.wordWrap){
			this.__hScrollPolicy = "off";
		}
		if (Register_2_.html == true){
			Register_2_.setTextFormat(Register_3_);
			Register_2_.htmlText = Register_4_;
		} else {
			Register_2_.text = Register_4_;
		}
		Register_2_.type = this.editable == true ? "input" : "dynamic";
		this.size();
		Register_2_.background = false;
	}
	function adjustScrollBars() {
		var Register_2_ = this.label;
		var Register_4_ = ((Register_2_.bottomScroll - Register_2_.scroll) + 1);
		var Register_3_ = ((Register_4_ + Register_2_.maxscroll) - 1);
		if (Register_3_ < 1){
			Register_3_ = 1;
		}
		var Register_5_ = 0;
		if ((Register_2_.textWidth + 5) > Register_2_._width){
			if (!Register_2_.wordWrap){
				Register_5_ = (Register_2_._width + Register_2_.maxhscroll);
			}
		} else {
			Register_2_.hscroll = 0;
			Register_2_.background = false;
		}
		if (Register_2_.height / Register_4_ != Math.round(Register_2_.height / Register_4_)){
			Register_3_--;
		}
		this.setScrollProperties(Register_5_, 1, Register_3_, Register_2_.height / Register_4_);
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
	function get styleSheet() {
		return this.label.styleSheet;
	}
	function set styleSheet(v) {
		this.label.styleSheet = v;
	}
	static var symbolName = "TextArea";
	static var symbolOwner = mx.controls.TextArea;
	static var version = "2.0.0.360";
	var className = "TextArea";
	var initializing = true;
	var clipParameters = {text:1, wordWrap:1, editable:1, maxChars:1, restrict:1, html:1, password:1};
	static var mergedClipParameters = mx.core.UIObject.mergeClipParameters(TextArea.prototype.clipParameters, mx.core.ScrollView.prototype.clipParameters);
	var __vScrollPolicy = "auto";
	var __hScrollPolicy = "auto";
	var __editable = true;
}
