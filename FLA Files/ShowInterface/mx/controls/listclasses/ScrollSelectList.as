dynamic class mx.controls.listclasses.ScrollSelectList extends mx.core.ScrollView
{
	var invLayoutContent, rows, topRowZ, listContent, __vPosition, __dataProvider, tW, layoutX, layoutY, tH, invRowHeight, invalidate, __height, invUpdateControl, __cellRenderer, __labelFunction, __iconField, __iconFunction, getLength, baseRowZ, lastPosition, propertyTable, isSelected, changeFlag, clearSelected, selectItem, lastSelected, wasKeySelected, dispatchEvent, dragScrolling, _ymouse, scrollInterval, isPressed, onMouseUp, getSelectedIndex, enabled, tabEnabled, tabChildren, createEmptyMovieClip, border_mc;
	function ScrollSelectList() {
		super();
	}
	function layoutContent(x, y, w, h) {
		delete this.invLayoutContent;
		var Register_4_ = Math.ceil(h / this.__rowHeight);
		this.roundUp = (h % this.__rowHeight) != 0;
		var Register_C_ = (Register_4_ - this.__rowCount);
		if (Register_C_ < 0){
			var Register_3_ = Register_4_;
			while (Register_3_ < this.__rowCount){
				this.rows[Register_3_].removeMovieClip();
				delete this.rows[Register_3_];
				Register_3_++;
			}
			this.topRowZ +=  Register_C_;
		} else if (Register_C_ > 0){
			if (this.rows == undefined){
				this.rows = new Array();
			}
			Register_3_ = this.__rowCount;
			while (Register_3_ < Register_4_){
				var Register_2_ = (this.rows[Register_3_] = this.listContent.createObject(this.__rowRenderer, ("listRow" + this.topRowZ++), this.topRowZ, {owner:this, styleName:this, rowIndex:Register_3_}));
				Register_2_._x = x;
				Register_2_._y = Math.round(Register_3_ * this.__rowHeight + y);
				Register_2_.setSize(w, this.__rowHeight);
				Register_2_.drawRow(this.__dataProvider.getItemAt(this.__vPosition + Register_3_), this.getStateAt(this.__vPosition + Register_3_));
				Register_2_.lastY = Register_2_._y;
				Register_3_++;
			}
		}
		if (w != this.tW){
			var Register_B_ = Register_C_ > 0 ? this.__rowCount : Register_4_;
			var Register_3_ = 0;
			while (Register_3_ < Register_B_){
				this.rows[Register_3_].setSize(w, this.__rowHeight);
				Register_3_++;
			}
		}
		if (this.layoutX != x || this.layoutY != y){
			var Register_3_ = 0;
			while (Register_3_ < Register_4_){
				this.rows[Register_3_]._x = x;
				this.rows[Register_3_]._y = Math.round(Register_3_ * this.__rowHeight + y);
				Register_3_++;
			}
		}
		this.__rowCount = Register_4_;
		this.layoutX = x;
		this.layoutY = y;
		this.tW = w;
		this.tH = h;
	}
	function getRowHeight(Void) {
		return this.__rowHeight;
	}
	function setRowHeight(v) {
		this.__rowHeight = v;
		this.invRowHeight = true;
		this.invalidate();
	}
	function get rowHeight() {
		return this.getRowHeight();
	}
	function set rowHeight(w) {
		this.setRowHeight(w);
	}
	function setRowCount(v) {
		this.__rowCount = v;
	}
	function getRowCount(Void) {
		if (!(this.__rowCount == 0)){
			return this.__rowCount;
		}
		var Register_2_ = Math.ceil(this.__height / this.__rowHeight);
		return Register_2_;
	}
	function get rowCount() {
		return this.getRowCount();
	}
	function set rowCount(w) {
		this.setRowCount(w);
	}
	function setEnabled(v) {
		super.setEnabled(v);
		this.invUpdateControl = true;
		this.invalidate();
	}
	function setCellRenderer(cR) {
		this.__cellRenderer = cR;
		var Register_2_ = 0;
		while (Register_2_ < this.rows.length){
			this.rows[Register_2_].setCellRenderer(true);
			Register_2_++;
		}
		this.invUpdateControl = true;
		this.invalidate();
	}
	function set cellRenderer(cR) {
		this.setCellRenderer(cR);
	}
	function get cellRenderer() {
		return this.__cellRenderer;
	}
	function set labelField(field) {
		this.setLabelField(field);
	}
	function setLabelField(field) {
		this.__labelField = field;
		this.invUpdateControl = true;
		this.invalidate();
	}
	function get labelField() {
		return this.__labelField;
	}
	function set labelFunction(func) {
		this.setLabelFunction(func);
	}
	function setLabelFunction(func) {
		this.__labelFunction = func;
		this.invUpdateControl = true;
		this.invalidate();
	}
	function get labelFunction() {
		return this.__labelFunction;
	}
	function set iconField(field) {
		this.setIconField(field);
	}
	function setIconField(field) {
		this.__iconField = field;
		this.invUpdateControl = true;
		this.invalidate();
	}
	function get iconField() {
		return this.__iconField;
	}
	function set iconFunction(func) {
		this.setIconFunction(func);
	}
	function setIconFunction(func) {
		this.__iconFunction = func;
		this.invUpdateControl = true;
		this.invalidate();
	}
	function get iconFunction() {
		return this.__iconFunction;
	}
	function setVPosition(pos) {
		if (pos < 0){
			return undefined;
		}
		if (pos > 0 && pos > ((this.getLength() - this.__rowCount) + this.roundUp)){
			return undefined;
		}
		var Register_8_ = (pos - this.__vPosition);
		if (Register_8_ == 0){
			return undefined;
		}
		this.__vPosition = pos;
		var Register_A_ = Register_8_ > 0;
		Register_8_ = Math.abs(Register_8_);
		if (Register_8_ >= this.__rowCount){
			this.updateControl();
		} else {
			var Register_4_ = new Array();
			var Register_9_ = (this.__rowCount - Register_8_);
			var Register_C_ = Register_8_ * this.__rowHeight;
			var Register_B_ = Register_9_ * this.__rowHeight;
			var Register_6_ = Register_A_ ? 1 : -1;
			var Register_3_ = 0;
			while (Register_3_ < this.__rowCount){
				if ((Register_3_ < Register_8_ && Register_A_) || (Register_3_ >= Register_9_ && !Register_A_)){
					this.rows[Register_3_]._y +=  Math.round(Register_6_ * Register_B_);
					var Register_5_ = (Register_3_ + Register_6_ * Register_9_);
					var Register_7_ = (this.__vPosition + Register_5_);
					Register_4_[Register_5_] = this.rows[Register_3_];
					Register_4_[Register_5_].rowIndex = Register_5_;
					Register_4_[Register_5_].drawRow(this.__dataProvider.getItemAt(Register_7_), this.getStateAt(Register_7_), false);
				} else {
					this.rows[Register_3_]._y -=  Math.round(Register_6_ * Register_C_);
					Register_5_ = (Register_3_ - Register_6_ * Register_8_);
					Register_4_[Register_5_] = this.rows[Register_3_];
					Register_4_[Register_5_].rowIndex = Register_5_;
				}
				Register_3_++;
			}
			this.rows = Register_4_;
			Register_3_ = 0;
			while (Register_3_ < this.__rowCount){
				this.rows[Register_3_].swapDepths(this.baseRowZ + Register_3_);
				Register_3_++;
			}
		}
		this.lastPosition = pos;
		super.setVPosition(pos);
	}
	function setPropertiesAt(index, obj) {
		var Register_2_ = this.__dataProvider.getItemID(index);
		if (Register_2_ == undefined){
			return undefined;
		}
		if (this.propertyTable == undefined){
			this.propertyTable = new Object();
		}
		this.propertyTable[Register_2_] = obj;
		this.rows[(index - this.__vPosition)].drawRow(this.__dataProvider.getItemAt(index), this.getStateAt(index));
	}
	function getPropertiesAt(index) {
		var Register_2_ = this.__dataProvider.getItemID(index);
		if (Register_2_ == undefined){
			return undefined;
		}
		return this.propertyTable[Register_2_];
	}
	function getStyle(styleProp) {
		var Register_2_ = super.getStyle(styleProp);
		var Register_3_ = mx.styles.StyleManager.colorNames[Register_2_];
		if (Register_3_ != undefined){
			Register_2_ = Register_3_;
		}
		return Register_2_;
	}
	function updateControl(Void) {
		var Register_2_ = 0;
		while (Register_2_ < this.__rowCount){
			this.rows[Register_2_].drawRow(this.__dataProvider.getItemAt(Register_2_ + this.__vPosition), this.getStateAt(Register_2_ + this.__vPosition));
			Register_2_++;
		}
		delete this.invUpdateControl;
	}
	function getStateAt(index) {
		return this.isSelected(index) ? "selected" : "normal";
	}
	function selectRow(rowIndex, transition) {
		if (!this.selectable){
			return undefined;
		}
		var Register_3_ = (this.__vPosition + rowIndex);
		var Register_8_ = this.__dataProvider.getItemAt(Register_3_);
		var Register_5_ = this.rows[rowIndex];
		if (Register_8_ == undefined){
			return undefined;
		}
		if (transition == undefined){
			transition = true;
		}
		this.changeFlag = true;
		if ((!this.multipleSelection && !Key.isDown(17)) || (!Key.isDown(16) && !Key.isDown(17))){
			this.clearSelected(transition);
			this.selectItem(Register_3_, true);
			this.lastSelected = Register_3_;
			Register_5_.drawRow(Register_5_.item, this.getStateAt(Register_3_), transition);
		} else {
			if (Key.isDown(16) && this.multipleSelection){
				if (this.lastSelected == undefined){
					this.lastSelected = Register_3_;
				}
				var Register_4_ = this.lastSelected < Register_3_ ? 1 : -1;
				this.clearSelected(false);
				var Register_2_ = this.lastSelected;
				while (Register_2_ != Register_3_){
					this.selectItem(Register_2_, true);
					if (Register_2_ >= this.__vPosition && Register_2_ < (this.__vPosition + this.__rowCount)){
						this.rows[(Register_2_ - this.__vPosition)].drawRow(this.rows[(Register_2_ - this.__vPosition)].item, "selected", false);
					}
					Register_2_ = (Register_2_ + Register_4_);
				}
				this.selectItem(Register_3_, true);
				Register_5_.drawRow(Register_5_.item, "selected", transition);
			} else if (Key.isDown(17)){
				var Register_7_ = this.isSelected(Register_3_);
				if (!this.multipleSelection || this.wasKeySelected){
					this.clearSelected(transition);
				}
				if (!(!this.multipleSelection && Register_7_)){
					this.selectItem(Register_3_, !Register_7_);
					var Register_9_ = !Register_7_ ? "selected" : "normal";
					Register_5_.drawRow(Register_5_.item, Register_9_, transition);
				}
				this.lastSelected = Register_3_;
			}
		}
		if (this.wasKeySelected){
			this.dispatchEvent({type:"change"});
		}
		delete this.wasKeySelected;
	}
	function dragScroll(Void) {
		clearInterval(this.dragScrolling);
		if (this._ymouse < 0){
			this.setVPosition(this.__vPosition - 1);
			this.selectRow(0, false);
			var Register_2_ = Math.min((-this._ymouse - 30), 0);
			this.scrollInterval = (0.59299999999999997 * Register_2_ * Register_2_ + 1) + this.minScrollInterval;
			this.dragScrolling = setInterval(this, "dragScroll", this.scrollInterval);
			this.dispatchEvent({type:"scroll", direction:"vertical", position:this.__vPosition});
		} else if (this._ymouse > this.__height){
			var Register_3_ = this.__vPosition;
			this.setVPosition(this.__vPosition + 1);
			if (Register_3_ != this.__vPosition){
				this.selectRow(((this.__rowCount - 1) - this.roundUp), false);
			}
			Register_2_ = Math.min(((this._ymouse - this.__height) - 30), 0);
			this.scrollInterval = (0.59299999999999997 * Register_2_ * Register_2_ + 1) + this.minScrollInterval;
			this.dragScrolling = setInterval(this, "dragScroll", this.scrollInterval);
			this.dispatchEvent({type:"scroll", direction:"vertical", position:this.__vPosition});
		} else {
			this.dragScrolling = setInterval(this, "dragScroll", 15);
		}
		updateAfterEvent();
	}
	function __onMouseUp(Void) {
		clearInterval(this.dragScrolling);
		delete this.dragScrolling;
		delete this.dragScrolling;
		delete this.isPressed;
		delete this.onMouseUp;
		if (!this.selectable){
			return undefined;
		}
		if (this.changeFlag){
			this.dispatchEvent({type:"change"});
		}
		delete this.changeFlag;
	}
	function moveSelBy(incr) {
		if (!this.selectable){
			this.setVPosition(this.__vPosition + incr);
			return undefined;
		}
		var Register_3_ = this.getSelectedIndex();
		if (Register_3_ == undefined){
			Register_3_ = -1;
		}
		var Register_2_ = (Register_3_ + incr);
		Register_2_ = Math.max(0, Register_2_);
		Register_2_ = Math.min((this.getLength() - 1), Register_2_);
		if (Register_2_ == Register_3_){
			return undefined;
		}
		if (Register_3_ < this.__vPosition || Register_3_ >= (this.__vPosition + this.__rowCount)){
			this.setVPosition(Register_3_);
		}
		if (Register_2_ >= ((this.__vPosition + this.__rowCount) - this.roundUp) || Register_2_ < this.__vPosition){
			this.setVPosition(this.__vPosition + incr);
		}
		this.wasKeySelected = true;
		this.selectRow((Register_2_ - this.__vPosition), false);
	}
	function keyDown(e) {
		if (this.selectable){
			if (this.findInputText()){
				return undefined;
			}
		}
		if (e.code == 40){
			this.moveSelBy(1);
		} else if (e.code == 38){
			this.moveSelBy(-1);
		} else if (e.code == 34){
			if (this.selectable){
				var Register_3_ = this.getSelectedIndex();
				if (Register_3_ == undefined){
					Register_3_ = 0;
				}
				this.setVPosition(Register_3_);
			}
			this.moveSelBy((this.__rowCount - 1) - this.roundUp);
		} else if (e.code == 33){
			if (this.selectable){
				var Register_3_ = this.getSelectedIndex();
				if (Register_3_ == undefined){
					Register_3_ = 0;
				}
				this.setVPosition(Register_3_);
			}
			this.moveSelBy((1 - this.__rowCount) + this.roundUp);
		} else if (e.code == 36){
			this.moveSelBy(-this.__dataProvider.length);
		} else if (e.code == 35){
			this.moveSelBy(this.__dataProvider.length);
		}
	}
	function findInputText(Void) {
		var Register_2_ = Key.getAscii();
		if (Register_2_ >= 33 && Register_2_ <= 126){
			this.findString(String.fromCharCode(Register_2_));
			return true;
		}
	}
	function findString(str) {
		if (this.__dataProvider.length == 0){
			return undefined;
		}
		var Register_4_ = this.getSelectedIndex();
		var Register_6_ = 0;
		var Register_3_ = (Register_4_ + 1);
		while (Register_3_ != Register_4_){
			var Register_2_ = this.__dataProvider.getItemAt(Register_3_);
			if (Register_2_ instanceof XMLNode){
				Register_2_ = Register_2_.attributes[this.__labelField];
			} else if (typeof(Register_2_) != "string"){
				Register_2_ = String(Register_2_[this.__labelField]);
			}
			Register_2_ = Register_2_.substring(0, str.length);
			if (str == Register_2_ || str.toUpperCase() == Register_2_.toUpperCase()){
				Register_6_ = (Register_3_ - Register_4_);
				break;
			}
			if (Register_3_ >= (this.getLength() - 1)){
				Register_3_ = -1;
			}
			Register_3_++;
		}
		if (Register_6_ != 0){
			this.moveSelBy(Register_6_);
		}
	}
	function onRowPress(rowIndex) {
		if (!this.enabled){
			return undefined;
		}
		this.isPressed = true;
		this.dragScrolling = setInterval(this, "dragScroll", 15);
		this.onMouseUp = this.__onMouseUp;
		if (!this.selectable){
			return undefined;
		}
		this.selectRow(rowIndex);
	}
	function onRowRelease(rowIndex) {
	}
	function onRowRollOver(rowIndex) {
		if (!this.enabled){
			return undefined;
		}
		var Register_2_ = this.rows[rowIndex].item;
		if (this.getStyle("useRollOver") && Register_2_ != undefined){
			this.rows[rowIndex].drawRow(Register_2_, "highlighted", false);
		}
		this.dispatchEvent({type:"itemRollOver", index:(rowIndex + this.__vPosition)});
	}
	function onRowRollOut(rowIndex) {
		if (!this.enabled){
			return undefined;
		}
		if (this.getStyle("useRollOver")){
			this.rows[rowIndex].drawRow(this.rows[rowIndex].item, this.getStateAt(rowIndex + this.__vPosition), false);
		}
		this.dispatchEvent({type:"itemRollOut", index:(rowIndex + this.__vPosition)});
	}
	function onRowDragOver(rowIndex) {
		if ((!this.enabled || this.isPressed != true) || (!this.selectable)){
			return undefined;
		}
		if (this.dropEnabled){
		} else if (this.dragScrolling){
			this.selectRow(rowIndex, false);
		} else {
			this.onMouseUp = this.__onMouseUp;
			this.onRowPress(rowIndex);
		}
	}
	function onRowDragOut(rowIndex) {
		if (!this.enabled){
			return undefined;
		}
		if (this.dragEnabled){
		} else {
			this.onRowRollOut(rowIndex);
		}
	}
	function init(Void) {
		super.init();
		this.tabEnabled = true;
		this.tabChildren = false;
		if (this.__dataProvider == undefined){
			this.__dataProvider = new Array();
			this.__dataProvider.addEventListener("modelChanged", this);
		}
		this.baseRowZ = this.topRowZ = 10;
	}
	function createChildren(Void) {
		super.createChildren();
		this.listContent = this.createEmptyMovieClip("content_mc", this.CONTENTDEPTH);
		this.invLayoutContent = true;
		this.invalidate();
	}
	function draw(Void) {
		if (this.invRowHeight){
			delete this.invRowHeight;
			this.__rowCount = 0;
			this.listContent.removeMovieClip();
			this.listContent = this.createEmptyMovieClip("content_mc", this.CONTENTDEPTH);
		}
		if (this.invUpdateControl){
			this.updateControl();
		}
		this.border_mc.draw();
	}
	function invalidateStyle(propName) {
		if (this.isRowStyle[propName]){
			this.invUpdateControl = true;
			this.invalidate();
		} else {
			var Register_3_ = 0;
			while (Register_3_ < this.__rowCount){
				this.rows[Register_3_].invalidateStyle(propName);
				Register_3_++;
			}
		}
		super.invalidateStyle(propName);
	}
	static var mixIt1 = mx.controls.listclasses.DataSelector.Initialize(ScrollSelectList);
	static var mixIt2 = mx.controls.listclasses.DataProvider.Initialize(Array);
	var CONTENTDEPTH = 100;
	var __hPosition = 0;
	var __rowRenderer = "SelectableRow";
	var __rowHeight = 22;
	var __rowCount = 0;
	var __labelField = "label";
	var minScrollInterval = 30;
	var dropEnabled = false;
	var dragEnabled = false;
	var className = "ScrollSelectList";
	var isRowStyle = {styleName:true, backgroundColor:true, selectionColor:true, rollOverColor:true, selectionDisabledColor:true, backgroundDisabledColor:true, textColor:true, textSelectedColor:true, textRollOverColor:true, textDisabledColor:true, alternatingRowColors:true, defaultIcon:true};
	var roundUp = 0;
	var selectable = true;
	var multipleSelection = false;
}
