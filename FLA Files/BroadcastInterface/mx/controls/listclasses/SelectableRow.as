dynamic class mx.controls.listclasses.SelectableRow extends mx.core.UIComponent
{
	var __height, cell, owner, rowIndex, icon_mc, createObject, __width, backGround, highlightColor, highlight, createLabel, createClassObject, listOwner, tabEnabled, item, createEmptyMovieClip, drawRect, isChangedToSelected, bGTween, grandOwner;
	function SelectableRow() {
		super();
	}
	function setValue(itmObj, state) {
		var Register_7_ = this.__height;
		var Register_2_ = this.cell;
		var Register_5_ = this.owner;
		var Register_8_ = this.itemToString(itmObj);
		if (Register_2_.getValue() != Register_8_){
			Register_2_.setValue(Register_8_, itmObj, state);
		}
		var Register_4_ = Register_5_.getPropertiesAt(this.rowIndex + Register_5_.__vPosition).icon;
		if (Register_4_ == undefined){
			Register_4_ = Register_5_.__iconFunction(itmObj);
			if (Register_4_ == undefined){
				Register_4_ = itmObj[Register_5_.__iconField];
				if (Register_4_ == undefined){
					Register_4_ = Register_5_.getStyle("defaultIcon");
				}
			}
		}
		var Register_3_ = this.icon_mc;
		if (Register_4_ != undefined && itmObj != undefined){
			Register_3_ = this.createObject(Register_4_, "icon_mc", 20);
			Register_3_._x = 2;
			Register_3_._y = (Register_7_ - Register_3_._height) / 2;
			Register_2_._x = 4 + Register_3_._width;
		} else {
			Register_3_.removeMovieClip();
			Register_2_._x = 2;
		}
		var Register_9_ = Register_3_ == undefined ? 0 : Register_3_._width;
		Register_2_.setSize((this.__width - Register_9_), Math.min(Register_7_, Register_2_.getPreferredHeight()));
		Register_2_._y = (Register_7_ - Register_2_._height) / 2;
	}
	function size(Void) {
		var Register_3_ = this.backGround;
		var Register_2_ = this.cell;
		var Register_4_ = this.__height;
		var Register_5_ = this.__width;
		var Register_6_ = this.icon_mc == undefined ? 0 : this.icon_mc._width;
		Register_2_.setSize((Register_5_ - Register_6_), Math.min(Register_4_, Register_2_.getPreferredHeight()));
		Register_2_._y = (Register_4_ - Register_2_._height) / 2;
		this.icon_mc._y = (Register_4_ - this.icon_mc._height) / 2;
		Register_3_._x = 0;
		Register_3_._width = Register_5_;
		Register_3_._height = Register_4_;
		this.drawRowFill(Register_3_, this.normalColor);
		this.drawRowFill(this.highlight, this.highlightColor);
	}
	function setCellRenderer(forceSizing) {
		var Register_3_ = this.owner.__cellRenderer;
		var Register_4_ = undefined;
		if (this.cell != undefined){
			Register_4_ = this.cell._x;
			this.cell.removeMovieClip();
			this.cell.removeTextField();
		}
		var Register_2_ = undefined;
		if (Register_3_ == undefined){
			Register_2_ = (this.cell = this.createLabel("cll", 0, {styleName:this}));
			Register_2_.styleName = this.owner;
			Register_2_.selectable = false;
			Register_2_.tabEnabled = false;
			Register_2_.background = false;
			Register_2_.border = false;
		} else if (typeof(Register_3_) == "string"){
			Register_2_ = (this.cell = this.createObject(Register_3_, "cll", 0, {styleName:this}));
		} else {
			Register_2_ = (this.cell = this.createClassObject(Register_3_, "cll", 0, {styleName:this}));
		}
		Register_2_.owner = this;
		Register_2_.listOwner = this.owner;
		Register_2_.getCellIndex = this.getCellIndex;
		Register_2_.getDataLabel = this.getDataLabel;
		if (Register_4_ != undefined){
			Register_2_._x = Register_4_;
		}
		if (forceSizing){
			this.size();
		}
	}
	function getCellIndex(Void) {
		return {columnIndex:0, itemIndex:(this.owner.rowIndex + this.listOwner.__vPosition)};
	}
	function getDataLabel() {
		return this.listOwner.labelField;
	}
	function init(Void) {
		super.init();
		this.tabEnabled = false;
	}
	function createChildren(Void) {
		this.setCellRenderer(false);
		this.setupBG();
		this.setState(this.state, false);
	}
	function drawRow(itmObj, state, transition) {
		this.item = itmObj;
		this.setState(state, transition);
		this.setValue(itmObj, state, transition);
	}
	function itemToString(itmObj) {
		if (itmObj == undefined){
			return " ";
		}
		var Register_2_ = this.owner.__labelFunction(itmObj);
		if (Register_2_ == undefined){
			Register_2_ = itmObj instanceof XMLNode ? itmObj.attributes[this.owner.__labelField] : itmObj[this.owner.__labelField];
			if (Register_2_ == undefined){
				Register_2_ = " ";
				if (typeof(itmObj) == "object"){
					for (var Register_4_ in itmObj) {
						if (Register_4_ != "__ID__"){
							Register_2_ = ((itmObj[Register_4_] + ", ") + Register_2_);
						}
					}
					Register_2_ = Register_2_.substring(0, (Register_2_.length - 2));
				} else {
					Register_2_ = itmObj;
				}
			}
		}
		return Register_2_;
	}
	function setupBG(Void) {
		var Register_2_ = (this.backGround = this.createEmptyMovieClip("bG_mc", LOWEST_DEPTH));
		this.drawRowFill(Register_2_, this.normalColor);
		this.highlight = this.createEmptyMovieClip("tran_mc", (LOWEST_DEPTH + 10));
		Register_2_.owner = this;
		Register_2_.grandOwner = this.owner;
		Register_2_.onPress = this.bGOnPress;
		Register_2_.onRelease = this.bGOnRelease;
		Register_2_.onRollOver = this.bGOnRollOver;
		Register_2_.onRollOut = this.bGOnRollOut;
		Register_2_.onDragOver = this.bGOnDragOver;
		Register_2_.onDragOut = this.bGOnDragOut;
		Register_2_.useHandCursor = false;
		Register_2_.trackAsMenu = true;
		Register_2_.drawRect = this.drawRect;
		this.highlight.drawRect = this.drawRect;
	}
	function drawRowFill(mc, newClr) {
		mc.clear();
		mc.beginFill(newClr);
		mc.drawRect(1, 0, this.__width, this.__height);
		mc.endFill();
		mc._width = this.__width;
		mc._height = this.__height;
	}
	function setState(newState, transition) {
		var Register_2_ = this.highlight;
		var Register_8_ = this.backGround;
		var Register_4_ = this.__height;
		var Register_3_ = this.owner;
		if (!Register_3_.enabled){
			if (newState == "selected" || this.state == "selected"){
				this.highlightColor = Register_3_.getStyle("selectionDisabledColor");
				this.drawRowFill(Register_2_, this.highlightColor);
				Register_2_._visible = true;
				Register_2_._y = 0;
				Register_2_._height = Register_4_;
			} else {
				Register_2_._visible = false;
				this.normalColor = Register_3_.getStyle("backgroundDisabledColor");
				this.drawRowFill(Register_8_, this.normalColor);
			}
			this.cell.__enabled = false;
			this.cell.setColor(Register_3_.getStyle("disabledColor"));
		} else {
			this.cell.__enabled = true;
			if (transition && newState == this.state || (newState == "highlighted" && this.state == "selected")){
				this.isChangedToSelected = true;
				return undefined;
			}
			var Register_6_ = Register_3_.getStyle("selectionDuration");
			var Register_7_ = 0;
			if (this.isChangedToSelected && newState == "selected"){
				transition = false;
			}
			var Register_A_ = (transition && Register_6_ != 0);
			if (newState == "normal"){
				Register_7_ = Register_3_.getStyle("color");
				this.normalColor = this.getNormalColor();
				this.drawRowFill(Register_8_, this.normalColor);
				if (Register_A_){
					Register_6_ = Register_6_ / 2;
					Register_2_._height = Register_4_;
					Register_2_._width = this.__width;
					Register_2_._y = 0;
					this.bGTween = new mx.effects.Tween(this, (Register_4_ + 2), Register_4_ * 0.2, Register_6_, 5);
				} else {
					Register_2_._visible = false;
				}
				delete this.isChangedToSelected;
			} else {
				this.highlightColor = Register_3_.getStyle(newState == "highlighted" ? "rollOverColor" : "selectionColor");
				this.drawRowFill(Register_2_, this.highlightColor);
				Register_2_._visible = true;
				Register_7_ = Register_3_.getStyle(newState == "highlighted" ? "textRollOverColor" : "textSelectedColor");
				if (Register_A_){
					Register_2_._height = Register_4_ * 0.5;
					Register_2_._y = (Register_4_ - Register_2_._height) / 2;
					this.bGTween = new mx.effects.Tween(this, Register_2_._height, (Register_4_ + 2), Register_6_, 5);
					var Register_9_ = Register_3_.getStyle("selectionEasing");
					if (Register_9_ != undefined){
						this.bGTween.easingEquation = Register_9_;
					}
				} else {
					Register_2_._y = 0;
					Register_2_._height = Register_4_;
				}
			}
			this.cell.setColor(Register_7_);
		}
		this.state = newState;
	}
	function onTweenUpdate(val) {
		this.highlight._height = val;
		this.highlight._y = (this.__height - val) / 2;
	}
	function onTweenEnd(val) {
		this.onTweenUpdate(val);
		this.highlight._visible = this.state != "normal";
	}
	function getNormalColor(Void) {
		var Register_3_ = undefined;
		var Register_2_ = this.owner;
		if (!this.owner.enabled){
			Register_3_ = Register_2_.getStyle("backgroundDisabledColor");
		} else {
			var Register_5_ = (this.rowIndex + Register_2_.__vPosition);
			Register_3_ = Register_2_.getPropertiesAt(Register_5_).backgroundColor;
			if (Register_3_ == undefined){
				var Register_4_ = Register_2_.getStyle("alternatingRowColors");
				if (Register_4_ == undefined){
					Register_3_ = Register_2_.getStyle("backgroundColor");
				} else {
					Register_3_ = Register_4_[(Register_5_ % Register_4_.length)];
				}
			}
		}
		return Register_3_;
	}
	function invalidateStyle(propName) {
		this.cell.invalidateStyle(propName);
		super.invalidateStyle(propName);
	}
	function bGOnPress(Void) {
		this.grandOwner.pressFocus();
		this.grandOwner.onRowPress(this.owner.rowIndex);
	}
	function bGOnRelease(Void) {
		this.grandOwner.releaseFocus();
		this.grandOwner.onRowRelease(this.owner.rowIndex);
	}
	function bGOnRollOver(Void) {
		this.grandOwner.onRowRollOver(this.owner.rowIndex);
	}
	function bGOnRollOut(Void) {
		this.grandOwner.onRowRollOut(this.owner.rowIndex);
	}
	function bGOnDragOver(Void) {
		this.grandOwner.onRowDragOver(this.owner.rowIndex);
	}
	function bGOnDragOut(Void) {
		this.grandOwner.onRowDragOut(this.owner.rowIndex);
	}
	static var LOWEST_DEPTH = -16384;
	var state = "normal";
	var disabledColor = 15263976;
	var normalColor = 16777215;
}
