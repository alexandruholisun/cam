dynamic class mx.core.View extends mx.core.UIComponent
{
	var tabChildren, tabEnabled, boundingBox_mc, border_mc, __tabIndex, depth, createObject, createClassObject, loadExternal, destroyObject, createClassChildAtDepth, doLater;
	function View() {
		super();
	}
	function init() {
		super.init();
		this.tabChildren = true;
		this.tabEnabled = false;
		this.boundingBox_mc._visible = false;
		this.boundingBox_mc._width = this.boundingBox_mc._height = 0;
	}
	function size() {
		this.border_mc.move(0, 0);
		this.border_mc.setSize(this.width, this.height);
		this.doLayout();
	}
	function draw() {
		this.size();
	}
	function get numChildren() {
		var Register_3_ = childNameBase;
		var Register_2_ = 0;
		while (true){
			if (this[(Register_3_ + Register_2_)] == undefined){
				return Register_2_;
			}
			Register_2_++;
		}
		return -1;
	}
	function get tabIndex() {
		return this.tabEnabled ? this.__tabIndex : undefined;
	}
	function set tabIndex(n) {
		this.__tabIndex = n;
	}
	function addLayoutObject(object) {
	}
	function createChild(className, instanceName, initProps) {
		if (this.depth == undefined){
			this.depth = 1;
		}
		var Register_2_ = undefined;
		if (typeof(className) == "string"){
			Register_2_ = this.createObject(className, instanceName, this.depth++, initProps);
		} else {
			Register_2_ = this.createClassObject(className, instanceName, this.depth++, initProps);
		}
		if (Register_2_ == undefined){
			Register_2_ = this.loadExternal(className, this._loadExternalClass, instanceName, this.depth++, initProps);
		} else {
			this[(childNameBase + this.numChildren)] = Register_2_;
			Register_2_._complete = true;
			this.childLoaded(Register_2_);
		}
		this.addLayoutObject(Register_2_);
		return Register_2_;
	}
	function getChildAt(childIndex) {
		return this[(childNameBase + childIndex)];
	}
	function destroyChildAt(childIndex) {
		if (!(childIndex >= 0 && childIndex < this.numChildren)){
			return undefined;
		}
		var Register_4_ = (childNameBase + childIndex);
		var Register_6_ = this.numChildren;
		var Register_3_ = undefined;
		for (Register_3_ in this) {
			if (Register_3_ == Register_4_){
				Register_4_ = "";
				this.destroyObject(Register_3_);
				break;
			}
		}
		var Register_2_ = Number(childIndex);
		while (Register_2_ < (Register_6_ - 1)){
			this[(childNameBase + Register_2_)] = this[(childNameBase + (Register_2_ + 1))];
			Register_2_++;
		}
		delete this[(childNameBase + (Register_6_ - 1))];
		this.depth--;
	}
	function initLayout() {
		if (!this.hasBeenLayedOut){
			this.doLayout();
		}
	}
	function doLayout() {
		this.hasBeenLayedOut = true;
	}
	function createChildren() {
		if (this.border_mc == undefined){
			this.border_mc = this.createClassChildAtDepth(_global.styles.rectBorderClass, mx.managers.DepthManager.kBottom, {styleName:this});
		}
		this.doLater(this, "initLayout");
	}
	function convertToUIObject(obj) {
	}
	function childLoaded(obj) {
		this.convertToUIObject(obj);
	}
	static function extension() {
		mx.core.ExternalContent.enableExternalContent();
	}
	static var symbolName = "View";
	static var symbolOwner = mx.core.View;
	static var version = "2.0.0.360";
	var className = "View";
	static var childNameBase = "_child";
	var hasBeenLayedOut = false;
	var _loadExternalClass = "UIComponent";
}
