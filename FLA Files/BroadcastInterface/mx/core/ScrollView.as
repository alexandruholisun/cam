dynamic class mx.core.ScrollView extends mx.core.View
{
	var __width, hScroller, vScroller, __maxHPosition, propsInited, scrollAreaChanged, specialHScrollCase, createObject, viewableColumns, __height, viewableRows, oldRndUp, __viewMetrics, owner, enabled, border_mc, invLayout, mask_mc, _parent, dispatchEvent;
	function ScrollView() {
		super();
	}
	function getHScrollPolicy(Void) {
		return this.__hScrollPolicy;
	}
	function setHScrollPolicy(policy) {
		this.__hScrollPolicy = policy.toLowerCase();
		if (this.__width == undefined){
			return undefined;
		}
		this.setScrollProperties(this.numberOfCols, this.columnWidth, this.rowC, this.rowH, this.heightPadding, this.widthPadding);
	}
	function get hScrollPolicy() {
		return this.getHScrollPolicy();
	}
	function set hScrollPolicy(policy) {
		this.setHScrollPolicy(policy);
	}
	function getVScrollPolicy(Void) {
		return this.__vScrollPolicy;
	}
	function setVScrollPolicy(policy) {
		this.__vScrollPolicy = policy.toLowerCase();
		if (this.__width == undefined){
			return undefined;
		}
		this.setScrollProperties(this.numberOfCols, this.columnWidth, this.rowC, this.rowH, this.heightPadding, this.widthPadding);
	}
	function get vScrollPolicy() {
		return this.getVScrollPolicy();
	}
	function set vScrollPolicy(policy) {
		this.setVScrollPolicy(policy);
	}
	function get hPosition() {
		return this.getHPosition();
	}
	function set hPosition(pos) {
		this.setHPosition(pos);
	}
	function getHPosition(Void) {
		return this.__hPosition;
	}
	function setHPosition(pos) {
		this.hScroller.scrollPosition = pos;
		this.__hPosition = pos;
	}
	function get vPosition() {
		return this.getVPosition();
	}
	function set vPosition(pos) {
		this.setVPosition(pos);
	}
	function getVPosition(Void) {
		return this.__vPosition;
	}
	function setVPosition(pos) {
		this.vScroller.scrollPosition = pos;
		this.__vPosition = pos;
	}
	function get maxVPosition() {
		var Register_2_ = this.vScroller.maxPos;
		return Register_2_ == undefined ? 0 : Register_2_;
	}
	function get maxHPosition() {
		return this.getMaxHPosition();
	}
	function set maxHPosition(pos) {
		this.setMaxHPosition(pos);
	}
	function getMaxHPosition(Void) {
		if (this.__maxHPosition != undefined){
			return this.__maxHPosition;
		}
		var Register_2_ = this.hScroller.maxPos;
		return Register_2_ == undefined ? 0 : Register_2_;
	}
	function setMaxHPosition(pos) {
		this.__maxHPosition = pos;
	}
	function setScrollProperties(colCount, colWidth, rwCount, rwHeight, hPadding, wPadding) {
		var Register_3_ = this.getViewMetrics();
		if (hPadding == undefined){
			hPadding = 0;
		}
		if (wPadding == undefined){
			wPadding = 0;
		}
		this.propsInited = true;
		delete this.scrollAreaChanged;
		this.heightPadding = hPadding;
		this.widthPadding = wPadding;
		if (colWidth == 0){
			colWidth = 1;
		}
		if (rwHeight == 0){
			rwHeight = 1;
		}
		var Register_5_ = Math.ceil(((((this.__width - Register_3_.left) - Register_3_.right) - this.widthPadding)) / colWidth);
		if (this.__hScrollPolicy == "on" || (Register_5_ < colCount && this.__hScrollPolicy == "auto")){
			if (this.hScroller == undefined || this.specialHScrollCase){
				delete this.specialHScrollCase;
				this.hScroller = this.createObject("HScrollBar", "hSB", 1001);
				this.hScroller.lineScrollSize = 20;
				this.hScroller.scrollHandler = this.scrollProxy;
				this.hScroller.scrollPosition = this.__hPosition;
				this.scrollAreaChanged = true;
			}
			if (((this.numberOfCols != colCount || this.columnWidth != colWidth) || this.viewableColumns != Register_5_) || (this.scrollAreaChanged)){
				this.hScroller.setScrollProperties(Register_5_, 0, (colCount - Register_5_));
				this.viewableColumns = Register_5_;
				this.numberOfCols = colCount;
				this.columnWidth = colWidth;
			}
		} else {
			if ((this.__hScrollPolicy == "auto" || this.__hScrollPolicy == "off") && (this.hScroller != undefined)){
				this.hScroller.removeMovieClip();
				delete this.hScroller;
				this.scrollAreaChanged = true;
			}
		}
		if (this.heightPadding == undefined){
			this.heightPadding = 0;
		}
		var Register_4_ = Math.ceil(((((this.__height - Register_3_.top) - Register_3_.bottom) - this.heightPadding)) / rwHeight);
		var Register_8_ = (((((this.__height - Register_3_.top) - Register_3_.bottom))) % rwHeight) != 0;
		if (this.__vScrollPolicy == "on" || (Register_4_ < (rwCount + Register_8_) && this.__vScrollPolicy == "auto")){
			if (this.vScroller == undefined){
				this.vScroller = this.createObject("VScrollBar", "vSB", 1002);
				this.vScroller.scrollHandler = this.scrollProxy;
				this.vScroller.scrollPosition = this.__vPosition;
				this.scrollAreaChanged = true;
				this.rowH = 0;
			}
			if (((this.rowC != rwCount || this.rowH != rwHeight) || (this.viewableRows + Register_8_) != (Register_4_ + this.oldRndUp)) || (this.scrollAreaChanged)){
				this.vScroller.setScrollProperties(Register_4_, 0, ((rwCount - Register_4_) + Register_8_));
				this.viewableRows = Register_4_;
				this.rowC = rwCount;
				this.rowH = rwHeight;
				this.oldRndUp = Register_8_;
			}
		} else {
			if ((this.__vScrollPolicy == "auto" || this.__vScrollPolicy == "off") && (this.vScroller != undefined)){
				this.vScroller.removeMovieClip();
				delete this.vScroller;
				this.scrollAreaChanged = true;
			}
		}
		this.numberOfCols = colCount;
		this.columnWidth = colWidth;
		if (this.scrollAreaChanged){
			this.doLayout();
			var Register_2_ = this.__viewMetrics;
			var Register_C_ = this.owner != undefined ? this.owner : this;
			Register_C_.layoutContent(Register_2_.left, Register_2_.top, ((this.columnWidth * this.numberOfCols - Register_2_.left) - Register_2_.right), this.rowC * this.rowH, ((this.__width - Register_2_.left) - Register_2_.right), ((this.__height - Register_2_.top) - Register_2_.bottom));
		}
		if (!this.enabled){
			this.setEnabled(false);
		}
	}
	function getViewMetrics(Void) {
		var Register_2_ = this.__viewMetrics;
		var Register_3_ = this.border_mc.borderMetrics;
		Register_2_.left = Register_3_.left;
		Register_2_.right = Register_3_.right;
		if (this.vScroller != undefined){
			Register_2_.right +=  this.vScroller.minWidth;
		}
		Register_2_.top = Register_3_.top;
		if (this.hScroller == undefined && (this.__hScrollPolicy == "on" || this.__hScrollPolicy == true)){
			this.hScroller = this.createObject("FHScrollBar", "hSB", 1001);
			this.specialHScrollCase = true;
		}
		Register_2_.bottom = Register_3_.bottom;
		if (this.hScroller != undefined){
			Register_2_.bottom +=  this.hScroller.minHeight;
		}
		return Register_2_;
	}
	function doLayout(Void) {
		var Register_A_ = this.width;
		var Register_8_ = this.height;
		delete this.invLayout;
		var Register_3_ = (this.__viewMetrics = this.getViewMetrics());
		var Register_2_ = Register_3_.left;
		var Register_9_ = Register_3_.right;
		var Register_5_ = Register_3_.top;
		var Register_B_ = Register_3_.bottom;
		var Register_7_ = this.hScroller;
		var Register_6_ = this.vScroller;
		Register_7_.setSize(((Register_A_ - Register_2_) - Register_9_), (Register_7_.minHeight + 0));
		Register_7_.move(Register_2_, (Register_8_ - Register_B_));
		Register_6_.setSize((Register_6_.minWidth + 0), ((Register_8_ - Register_5_) - Register_B_));
		Register_6_.move((Register_A_ - Register_9_), Register_5_);
		var Register_4_ = this.mask_mc;
		Register_4_._width = (Register_A_ - Register_2_) - Register_9_;
		Register_4_._height = (Register_8_ - Register_5_) - Register_B_;
		Register_4_._x = Register_2_;
		Register_4_._y = Register_5_;
	}
	function createChild(id, name, props) {
		var Register_2_ = super.createChild(id, name, props);
		return Register_2_;
	}
	function init(Void) {
		super.init();
		this.__viewMetrics = new Object();
		if (_global.__SVMouseWheelManager == undefined){
			var Register_4_ = (_global.__SVMouseWheelManager = new Object());
			Register_4_.onMouseWheel = this.__onMouseWheel;
			Mouse.addListener(Register_4_);
		}
	}
	function __onMouseWheel(delta, scrollTarget) {
		var Register_3_ = scrollTarget;
		var Register_1_ = undefined;
		while (Register_3_ != undefined){
			if (Register_3_ instanceof ScrollView){
				Register_1_ = Register_3_;
				//false;
			}
			Register_3_ = Register_3_._parent;
		}
		if (Register_1_ != undefined){
			Register_3_ = delta <= 0 ? 1 : -1;
			var Register_2_ = Register_1_.vScroller.lineScrollSize;
			if (Register_2_ == undefined){
				Register_2_ = 0;
			}
			Register_2_ = Math.max(Math.abs(delta), Register_2_);
			Register_1_.vPosition +=  Register_2_ * Register_3_;
			Register_1_.dispatchEvent({type:"scroll", direction:"vertical", position:Register_1_.vPosition});
		}
	}
	function createChildren(Void) {
		super.createChildren();
		if (this.mask_mc == undefined){
			this.mask_mc = this.createObject("BoundingBox", "mask_mc", this.MASK_DEPTH);
		}
		this.mask_mc._visible = false;
	}
	function invalidate(Void) {
		super.invalidate();
	}
	function draw(Void) {
		this.size();
	}
	function size(Void) {
		super.size();
	}
	function scrollProxy(docObj) {
		this._parent.onScroll(docObj);
	}
	function onScroll(docObj) {
		var Register_3_ = docObj.target;
		var Register_2_ = Register_3_.scrollPosition;
		if (Register_3_ == this.vScroller){
			var Register_4_ = "vertical";
			var Register_5_ = "__vPosition";
		} else {
			Register_4_ = "horizontal";
			Register_5_ = "__hPosition";
		}
		this.dispatchEvent({type:"scroll", direction:Register_4_, position:Register_2_});
		this[Register_5_] = Register_2_;
	}
	function setEnabled(v) {
		this.vScroller.enabled = this.hScroller.enabled = v;
	}
	function childLoaded(obj) {
		super.childLoaded(obj);
		obj.setMask(this.mask_mc);
	}
	static var symbolName = "ScrollView";
	static var symbolOwner = mx.core.ScrollView;
	static var version = "2.0.0.360";
	var className = "ScrollView";
	var __vScrollPolicy = "auto";
	var __hScrollPolicy = "off";
	var __vPosition = 0;
	var __hPosition = 0;
	var numberOfCols = 0;
	var rowC = 0;
	var columnWidth = 1;
	var rowH = 0;
	var heightPadding = 0;
	var widthPadding = 0;
	var MASK_DEPTH = 10000;
}
