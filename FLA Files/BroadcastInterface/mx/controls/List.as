dynamic class mx.controls.List extends mx.controls.listclasses.ScrollSelectList
{
	var border_mc, __labels, setDataProvider, __dataProvider, roundUp, __maxHPosition, invScrollProps, invalidate, __vPosition, getViewMetrics, __rowHeight, __width, setSize, totalWidth, totalHeight, displayWidth, __hScrollPolicy, vScroller, __hPosition, listContent, data, mask_mc, __height, __rowCount, invRowHeight, invLayoutContent, setScrollProperties, oldVWidth;
	function List() {
		super();
	}
	function setEnabled(v) {
		super.setEnabled(v);
		this.border_mc.backgroundColorName = v ? "backgroundColor" : "backgroundDisabledColor";
		this.border_mc.invalidate();
	}
	function get labels() {
		return this.__labels;
	}
	function set labels(lbls) {
		this.__labels = lbls;
		this.setDataProvider(lbls);
	}
	function setVPosition(pos) {
		pos = Math.min(((this.__dataProvider.length - this.rowCount) + this.roundUp), pos);
		pos = Math.max(0, pos);
		super.setVPosition(pos);
	}
	function setHPosition(pos) {
		pos = Math.max(Math.min(this.__maxHPosition, pos), 0);
		super.setHPosition(pos);
		this.hScroll(pos);
	}
	function setMaxHPosition(pos) {
		this.__maxHPosition = pos;
		this.invScrollProps = true;
		this.invalidate();
	}
	function setHScrollPolicy(policy) {
		if (policy.toLowerCase() == "auto" && !this.autoHScrollAble){
			return undefined;
		}
		super.setHScrollPolicy(policy);
		if (policy == "off"){
			this.setHPosition(0);
			this.setVPosition(Math.min(((this.__dataProvider.length - this.rowCount) + this.roundUp), this.__vPosition));
		}
	}
	function setRowCount(rC) {
		if (isNaN(rC)){
			return undefined;
		}
		var Register_2_ = this.getViewMetrics();
		this.setSize(this.__width, ((this.__rowHeight * rC + Register_2_.top) + Register_2_.bottom));
	}
	function layoutContent(x, y, tW, tH, dW, dH) {
		this.totalWidth = tW;
		this.totalHeight = tH;
		this.displayWidth = dW;
		var Register_4_ = (this.__hScrollPolicy == "on" || this.__hScrollPolicy == "auto") ? (Math.max(tW, dW)) : dW;
		super.layoutContent(x, y, Register_4_, dH);
	}
	function modelChanged(eventObj) {
		super.modelChanged(eventObj);
		var Register_3_ = eventObj.eventName;
		if (((Register_3_ == "addItems" || Register_3_ == "removeItems") || Register_3_ == "updateAll") || (Register_3_ == "filterModel")){
			this.invScrollProps = true;
			this.invalidate("invScrollProps");
		}
	}
	function onScroll(eventObj) {
		var Register_3_ = eventObj.target;
		if (Register_3_ == this.vScroller){
			this.setVPosition(Register_3_.scrollPosition);
		} else {
			this.hScroll(Register_3_.scrollPosition);
		}
		super.onScroll(eventObj);
	}
	function hScroll(pos) {
		this.__hPosition = pos;
		this.listContent._x = -pos;
	}
	function init(Void) {
		super.init();
		if (this.labels.length > 0){
			var Register_6_ = new Array();
			var Register_3_ = 0;
			while (Register_3_ < this.labels.length){
				Register_6_.addItem({label:this.labels[Register_3_], data:this.data[Register_3_]});
				Register_3_++;
			}
			this.setDataProvider(Register_6_);
		}
		this.__maxHPosition = 0;
	}
	function createChildren(Void) {
		super.createChildren();
		this.listContent.setMask(this.mask_mc);
		this.border_mc.move(0, 0);
		this.border_mc.setSize(this.__width, this.__height);
	}
	function getRowCount(Void) {
		var Register_2_ = this.getViewMetrics();
		return this.__rowCount == 0 ? (Math.ceil((((this.__height - Register_2_.top) - Register_2_.bottom)) / this.__rowHeight)) : this.__rowCount;
	}
	function size(Void) {
		super.size();
		this.configureScrolling();
		var Register_3_ = this.getViewMetrics();
		this.layoutContent(Register_3_.left, Register_3_.top, (this.__width + this.__maxHPosition), this.totalHeight, ((this.__width - Register_3_.left) - Register_3_.right), ((this.__height - Register_3_.top) - Register_3_.bottom));
	}
	function draw(Void) {
		if (this.invRowHeight){
			this.invScrollProps = true;
			super.draw();
			this.listContent.setMask(this.mask_mc);
			this.invLayoutContent = true;
		}
		if (this.invScrollProps){
			this.configureScrolling();
			delete this.invScrollProps;
		}
		if (this.invLayoutContent){
			var Register_3_ = this.getViewMetrics();
			this.layoutContent(Register_3_.left, Register_3_.top, (this.__width + this.__maxHPosition), this.totalHeight, ((this.__width - Register_3_.left) - Register_3_.right), ((this.__height - Register_3_.top) - Register_3_.bottom));
		}
		super.draw();
	}
	function configureScrolling(Void) {
		var Register_2_ = this.__dataProvider.length;
		if (this.__vPosition > Math.max(0, ((Register_2_ - this.getRowCount()) + this.roundUp))){
			this.setVPosition(Math.max(0, Math.min(((Register_2_ - this.getRowCount()) + this.roundUp), this.__vPosition)));
		}
		var Register_3_ = this.getViewMetrics();
		var Register_4_ = this.__hScrollPolicy != "off" ? (((this.__maxHPosition + this.__width) - Register_3_.left) - Register_3_.right) : ((this.__width - Register_3_.left) - Register_3_.right);
		if (Register_2_ == undefined){
			Register_2_ = 0;
		}
		this.setScrollProperties(Register_4_, 1, Register_2_, this.__rowHeight);
		if (this.oldVWidth != Register_4_){
			this.invLayoutContent = true;
		}
		this.oldVWidth = Register_4_;
	}
	static var symbolOwner = mx.controls.List;
	static var symbolName = "List";
	static var version = "2.0.0.360";
	var clipParameters = {rowHeight:1, enabled:1, visible:1, labels:1};
	var scrollDepth = 1;
	var __vScrollPolicy = "on";
	var autoHScrollAble = false;
}
