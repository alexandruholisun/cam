dynamic class mx.controls.RadioButton extends mx.controls.Button
{
	var setToggle, __value, selected, releaseFocus, phase, dispatchEvent, _parent, __data, setState, __state, getFocusManager;
	function RadioButton() {
		super();
	}
	function init(Void) {
		this.setToggle(this.__toggle);
		this.__value = this;
		super.init();
	}
	function size(Void) {
		super.size();
	}
	function onRelease() {
		if (this.selected){
			return undefined;
		}
		this.releaseFocus();
		this.phase = "up";
		this.setSelected(true);
		this.dispatchEvent({type:"click"});
		this._parent[this.__groupName].dispatchEvent({type:"click"});
	}
	function setData(val) {
		this.__data = val;
	}
	function set data(val) {
		this.__data = val;
	}
	function getData(val) {
		return this.__data;
	}
	function get data() {
		return this.__data;
	}
	function onUnload() {
		if (this._parent[this.__groupName].selectedRadio == this){
			this._parent[this.__groupName].selectedRadio = undefined;
		}
		this._parent[this.__groupName].radioList[this.indexNumber] = null;
		delete this._parent[this.__groupName].radioList[this.indexNumber];
	}
	function setSelected(val) {
		var Register_2_ = this._parent[this.__groupName];
		var Register_4_ = Register_2_.selectedRadio.__width;
		var Register_5_ = Register_2_.selectedRadio.__height;
		if (val){
			Register_2_.selectedRadio.setState(false);
			Register_2_.selectedRadio = this;
		} else if (Register_2_.selectedRadio == this){
			Register_2_.selectedRadio.setState(false);
			Register_2_.selectedRadio = undefined;
		}
		this.setState(val);
	}
	function deleteGroupObj(groupName) {
		delete this._parent[groupName];
	}
	function getGroupName() {
		return this.__groupName;
	}
	function get groupName() {
		return this.__groupName;
	}
	function setGroupName(groupName) {
		if (groupName == undefined || groupName == ""){
			return undefined;
		}
		delete this._parent[this.__groupName].radioList[this.__data];
		this.addToGroup(groupName);
		this.__groupName = groupName;
	}
	function set groupName(groupName) {
		this.setGroupName(groupName);
	}
	function addToGroup(groupName) {
		if (groupName == "" || groupName == undefined){
			return undefined;
		}
		var Register_2_ = this._parent[groupName];
		if (Register_2_ == undefined){
			Register_2_ = (this._parent[groupName] = new mx.controls.RadioButtonGroup());
			Register_2_.__groupName = groupName;
		}
		Register_2_.addInstance(this);
		if (this.__state){
			Register_2_.selectedRadio.setState(false);
			Register_2_.selectedRadio = this;
		}
	}
	function get emphasized() {
		return undefined;
	}
	function keyDown(e) {
		switch (e.code){
		  case 40 :
			this.setNext();
			break;
		  case 38 :
			this.setPrev();
			break;
		  case 37 :
			this.setPrev();
			break;
		  case 39 :
			this.setNext();
			return;
		}
	}
	function setNext() {
		var Register_2_ = this._parent[this.groupName];
		if ((Register_2_.selectedRadio.indexNumber + 1) == Register_2_.radioList.length){
			return undefined;
		}
		var Register_5_ = Register_2_.selectedRadio ? Register_2_.selectedRadio.indexNumber : -1;
		var Register_3_ = 1;
		while (Register_3_ < Register_2_.radioList.length){
			if (Register_2_.radioList[(Register_5_ + Register_3_)] != undefined){
				var Register_4_ = this.getFocusManager();
				Register_2_.radioList[(Register_5_ + Register_3_)].selected = true;
				Register_4_.setFocus(Register_2_.radioList[Register_2_.selectedRadio.indexNumber]);
				Register_2_.dispatchEvent({type:"click"});
				break;
			}
			Register_3_++;
		}
	}
	function setPrev() {
		var Register_2_ = this._parent[this.groupName];
		if (Register_2_.selectedRadio.indexNumber == 0){
			return undefined;
		}
		var Register_5_ = Register_2_.selectedRadio ? Register_2_.selectedRadio.indexNumber : 1;
		var Register_3_ = 1;
		while (Register_3_ < Register_2_.radioList.length){
			if (Register_2_.radioList[(Register_5_ - Register_3_)] != undefined){
				var Register_4_ = this.getFocusManager();
				Register_2_.radioList[(Register_5_ - Register_3_)].selected = true;
				Register_4_.setFocus(Register_2_.radioList[Register_2_.selectedRadio.indexNumber]);
				Register_2_.dispatchEvent({type:"click"});
				break;
			}
			Register_3_++;
		}
	}
	function set toggle(v) {
	}
	function get toggle() {
	}
	function set icon(v) {
	}
	function get icon() {
	}
	static var symbolName = "RadioButton";
	static var symbolOwner = mx.controls.RadioButton;
	static var version = "2.0.0.360";
	var className = "RadioButton";
	var btnOffset = 0;
	var __toggle = true;
	var __label = "Radio Button";
	var __labelPlacement = "right";
	var ignoreClassStyleDeclaration = {Button:1};
	var __groupName = "radioGroup";
	var indexNumber = 0;
	var offset = false;
	var falseUpSkin = "";
	var falseDownSkin = "";
	var falseOverSkin = "";
	var falseDisabledSkin = "";
	var trueUpSkin = "";
	var trueDownSkin = "";
	var trueOverSkin = "";
	var trueDisabledSkin = "";
	var falseUpIcon = "RadioFalseUp";
	var falseDownIcon = "RadioFalseDown";
	var falseOverIcon = "RadioFalseOver";
	var falseDisabledIcon = "RadioFalseDisabled";
	var trueUpIcon = "RadioTrueUp";
	var trueDownIcon = "";
	var trueOverIcon = "";
	var trueDisabledIcon = "RadioTrueDisabled";
	var centerContent = false;
	var borderW = 0;
	var clipParameters = {labelPlacement:1, data:1, label:1, groupName:1, selected:1};
	static var mergedClipParameters = mx.core.UIObject.mergeClipParameters(RadioButton.prototype.clipParameters, mx.controls.Button.prototype.clipParameters);
}
