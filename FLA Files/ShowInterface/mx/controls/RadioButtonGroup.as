dynamic class mx.controls.RadioButtonGroup
{
	var radioList, __groupName, selectedRadio;
	function RadioButtonGroup() {
		this.init();
		mx.events.UIEventDispatcher.initialize(this);
	}
	function init(Void) {
		this.radioList = new Array();
	}
	function setGroupName(groupName) {
		if (groupName == undefined || groupName == ""){
			return undefined;
		}
		var Register_6_ = this.__groupName;
		_parent[groupName] = this;
		for (var Register_5_ in this.radioList) {
			this.radioList[Register_5_].groupName = groupName;
			var Register_3_ = this.radioList[Register_5_];
		}
		Register_3_.deleteGroupObj(Register_6_);
	}
	function getGroupName() {
		return this.__groupName;
	}
	function addInstance(instance) {
		instance.indexNumber = this.indexNumber++;
		this.radioList.push(instance);
	}
	function getValue() {
		if (this.selectedRadio.data == ""){
			return this.selectedRadio.label;
		} else {
			return this.selectedRadio.__data;
		}
	}
	function getLabelPlacement() {
		for (var Register_3_ in this.radioList) {
			var Register_2_ = this.radioList[Register_3_].getLabelPlacement();
		}
		return Register_2_;
	}
	function setLabelPlacement(pos) {
		for (var Register_3_ in this.radioList) {
			this.radioList[Register_3_].setLabelPlacement(pos);
		}
	}
	function setEnabled(val) {
		for (var Register_3_ in this.radioList) {
			this.radioList[Register_3_].enabled = val;
		}
	}
	function setSize(val, val1) {
		for (var Register_3_ in this.radioList) {
			this.radioList[Register_3_].setSize(val, val1);
		}
	}
	function getEnabled() {
		for (var Register_4_ in this.radioList) {
			var Register_2_ = this.radioList[Register_4_].enabled;
			var Register_3_ = (t + (Register_2_ + 0));
		}
		if (Register_3_ == this.radioList.length){
			return true;
		}
		if (Register_3_ == 0){
			return false;
		}
	}
	function setStyle(name, val) {
		for (var Register_4_ in this.radioList) {
			this.radioList[Register_4_].setStyle(name, val);
		}
	}
	function setInstance(val) {
		for (var Register_3_ in this.radioList) {
			if (this.radioList[Register_3_] == val){
				this.radioList[Register_3_].selected = true;
			}
		}
	}
	function getInstance() {
		return this.selectedRadio;
	}
	function setValue(val) {
		for (var Register_4_ in this.radioList) {
			if (this.radioList[Register_4_].__data == val || this.radioList[Register_4_].label == val){
				var Register_2_ = Register_4_;
				break;
			}
		}
		if (Register_2_ != undefined){
			this.selectedRadio.setState(false);
			this.selectedRadio.hitArea_mc._height = this.selectedRadio.__height;
			this.selectedRadio.hitArea_mc._width = this.selectedRadio.__width;
			this.selectedRadio = this.radioList[Register_2_];
			this.selectedRadio.setState(true);
			this.selectedRadio.hitArea_mc._height = this.selectedRadio.hitArea_mc._width = 0;
		}
	}
	function set groupName(groupName) {
		if (groupName == undefined || groupName == ""){
			return;
		}
		var Register_6_ = this.__groupName;
		_parent[groupName] = this;
		for (var Register_5_ in this.radioList) {
			this.radioList[Register_5_].groupName = groupName;
			var Register_3_ = this.radioList[Register_5_];
		}
		Register_3_.deleteGroupObj(Register_6_);
	}
	function get groupName() {
		return this.__groupName;
	}
	function set selectedData(val) {
		for (var Register_4_ in this.radioList) {
			if (this.radioList[Register_4_].__data == val || this.radioList[Register_4_].label == val){
				var Register_2_ = Register_4_;
				break;
			}
		}
		if (Register_2_ != undefined){
			this.selectedRadio.setState(false);
			this.selectedRadio = this.radioList[Register_2_];
			this.selectedRadio.setState(true);
		}
	}
	function get selectedData() {
		if (this.selectedRadio.data == "" || this.selectedRadio.data == undefined){
			return this.selectedRadio.label;
		} else {
			return this.selectedRadio.__data;
		}
	}
	function get selection() {
		return this.selectedRadio;
	}
	function set selection(val) {
		for (var Register_3_ in this.radioList) {
			if (this.radioList[Register_3_] == val){
				this.radioList[Register_3_].selected = true;
			}
		}
	}
	function set labelPlacement(pos) {
		for (var Register_3_ in this.radioList) {
			this.radioList[Register_3_].setLabelPlacement(pos);
		}
	}
	function get labelPlacement() {
		for (var Register_3_ in this.radioList) {
			var Register_2_ = this.radioList[Register_3_].getLabelPlacement();
		}
		return Register_2_;
	}
	function set enabled(val) {
		for (var Register_3_ in this.radioList) {
			this.radioList[Register_3_].enabled = val;
		}
	}
	function get enabled() {
		var Register_2_ = 0;
		for (var Register_3_ in this.radioList) {
			Register_2_ = (Register_2_ + this.radioList[Register_3_].enabled);
		}
		if (Register_2_ == 0){
			return false;
		}
		if (Register_2_ == this.radioList.length){
			return true;
		}
	}
	static var symbolName = "RadioButtonGroup";
	static var symbolOwner = mx.controls.RadioButtonGroup;
	static var version = "2.0.0.360";
	var className = "RadioButtonGroup";
	var indexNumber = 0;
}
