dynamic class mx.controls.listclasses.DataSelector extends Object
{
	var __vPosition, setVPosition, __dataProvider, enabled, lastSelected, lastSelID, selected, invUpdateControl, invalidate, multipleSelection, updateControl, __rowCount, rows;
	function DataSelector() {
		super();
	}
	static function Initialize(obj) {
		var Register_3_ = DataSelector.mixinProps;
		var Register_4_ = Register_3_.length;
		obj = obj.prototype;
		var Register_1_ = 0;
		while (Register_1_ < Register_4_){
			obj[Register_3_[Register_1_]] = mixins[Register_3_[Register_1_]];
			Register_1_++;
		}
		mixins.createProp(obj, "dataProvider", true);
		mixins.createProp(obj, "length", false);
		mixins.createProp(obj, "value", false);
		mixins.createProp(obj, "selectedIndex", true);
		mixins.createProp(obj, "selectedIndices", true);
		mixins.createProp(obj, "selectedItems", false);
		mixins.createProp(obj, "selectedItem", true);
		return true;
	}
	function createProp(obj, propName, setter) {
		var p = (propName.charAt(0).toUpperCase() + propName.substr(1));
		var Register_2_ = null;
		var Register_4_ = function (Void) {
			return this[("get" + p)]();
		}
		if (setter){
			var Register_2_ = function (val) {
				this[("set" + p)](val);
			}
		}
		obj.addProperty(propName, Register_4_, Register_2_);
	}
	function setDataProvider(dP) {
		if (this.__vPosition != 0){
			this.setVPosition(0);
		}
		this.clearSelected();
		this.__dataProvider.removeEventListener(this);
		this.__dataProvider = dP;
		dP.addEventListener("modelChanged", this);
		this.modelChanged({eventName:"updateAll"});
	}
	function getDataProvider(Void) {
		return this.__dataProvider;
	}
	function addItemAt(index, label, data) {
		if (index < 0 || !this.enabled){
			return undefined;
		}
		var Register_2_ = this.__dataProvider;
		if (Register_2_ == undefined){
			Register_2_ = (this.__dataProvider = new Array());
			Register_2_.addEventListener("modelChanged", this);
			index = 0;
		}
		if (typeof(label) == "object" || typeof(Register_2_.getItemAt(0)) == "string"){
			Register_2_.addItemAt(index, label);
		} else {
			Register_2_.addItemAt(index, {label:label, data:data});
		}
	}
	function addItem(label, data) {
		this.addItemAt(this.__dataProvider.length, label, data);
	}
	function removeItemAt(index) {
		return this.__dataProvider.removeItemAt(index);
	}
	function removeAll(Void) {
		this.__dataProvider.removeAll();
	}
	function replaceItemAt(index, newLabel, newData) {
		if (typeof(newLabel) == "object"){
			this.__dataProvider.replaceItemAt(index, newLabel);
		} else {
			this.__dataProvider.replaceItemAt(index, {label:newLabel, data:newData});
		}
	}
	function sortItemsBy(fieldName, order) {
		this.lastSelID = this.__dataProvider.getItemID(this.lastSelected);
		this.__dataProvider.sortItemsBy(fieldName, order);
	}
	function sortItems(compareFunc, order) {
		this.lastSelID = this.__dataProvider.getItemID(this.lastSelected);
		this.__dataProvider.sortItems(compareFunc, order);
	}
	function getLength(Void) {
		return this.__dataProvider.length;
	}
	function getItemAt(index) {
		return this.__dataProvider.getItemAt(index);
	}
	function modelChanged(eventObj) {
		var Register_3_ = eventObj.firstItem;
		var Register_6_ = eventObj.lastItem;
		var Register_7_ = eventObj.eventName;
		if (Register_7_ == undefined){
			Register_7_ = eventObj.event;
			Register_3_ = eventObj.firstRow;
			Register_6_ = eventObj.lastRow;
			if (Register_7_ == "addRows"){
				Register_7_ = (eventObj.eventName = "addItems");
			} else if (Register_7_ == "deleteRows"){
				Register_7_ = (eventObj.eventName = "removeItems");
			} else if (Register_7_ == "updateRows"){
				Register_7_ = (eventObj.eventName = "updateItems");
			}
		}
		if (Register_7_ == "addItems"){
			for (var Register_2_ in this.selected) {
				var Register_5_ = this.selected[Register_2_];
				if (Register_5_ != undefined && Register_5_ >= Register_3_){
					this.selected[Register_2_] +=  ((Register_6_ - Register_3_) + 1);
				}
			}
		} else if (Register_7_ == "removeItems"){
			if (this.__dataProvider.length == 0){
				delete this.selected;
			} else {
				var Register_9_ = eventObj.removedIDs;
				var Register_A_ = Register_9_.length;
				var Register_2_ = 0;
				while (Register_2_ < Register_A_){
					var Register_4_ = Register_9_[Register_2_];
					if (this.selected[Register_4_] != undefined){
						delete this.selected[Register_4_];
					}
					Register_2_++;
				}
				for (Register_2_ in this.selected) {
					if (this.selected[Register_2_] >= Register_3_){
						this.selected[Register_2_] -=  ((Register_6_ - Register_3_) + 1);
					}
				}
			}
		} else {
			if (Register_7_ == "sort"){
				if (typeof(this.__dataProvider.getItemAt(0)) != "object"){
					delete this.selected;
				} else {
					var Register_A_ = this.__dataProvider.length;
					var Register_2_ = 0;
					while (Register_2_ < Register_A_){
						if (this.isSelected(Register_2_)){
							var Register_4_ = this.__dataProvider.getItemID(Register_2_);
							if (Register_4_ == this.lastSelID){
								this.lastSelected = Register_2_;
							}
							this.selected[Register_4_] = Register_2_;
						}
						Register_2_++;
					}
				}
			} else if (Register_7_ == "filterModel"){
				this.setVPosition(0);
			}
		}
		this.invUpdateControl = true;
		this.invalidate();
	}
	function getValue(Void) {
		var Register_2_ = this.getSelectedItem();
		if (typeof(Register_2_) != "object"){
			return Register_2_;
		}
		return Register_2_.data == undefined ? Register_2_.label : Register_2_.data;
	}
	function getSelectedIndex(Void) {
		for (var Register_3_ in this.selected) {
			var Register_2_ = this.selected[Register_3_];
			if (Register_2_ != undefined){
				return Register_2_;
			}
		}
	}
	function setSelectedIndex(index) {
		if ((index >= 0 && index < this.__dataProvider.length) && (this.enabled)){
			delete this.selected;
			this.selectItem(index, true);
			this.lastSelected = index;
			this.invUpdateControl = true;
			this.invalidate();
		} else if (index == undefined){
			this.clearSelected();
		}
	}
	function getSelectedIndices(Void) {
		var Register_2_ = new Array();
		for (var Register_3_ in this.selected) {
			Register_2_.push(this.selected[Register_3_]);
		}
		Register_2_.reverse();
		return Register_2_.length > 0 ? Register_2_ : undefined;
	}
	function setSelectedIndices(indexArray) {
		if (this.multipleSelection != true){
			return undefined;
		}
		delete this.selected;
		var Register_3_ = 0;
		while (Register_3_ < indexArray.length){
			var Register_2_ = indexArray[Register_3_];
			if (Register_2_ >= 0 && Register_2_ < this.__dataProvider.length){
				this.selectItem(Register_2_, true);
			}
			Register_3_++;
		}
		this.invUpdateControl = true;
		this.updateControl();
	}
	function getSelectedItems(Void) {
		var Register_3_ = this.getSelectedIndices();
		var Register_4_ = new Array();
		var Register_2_ = 0;
		while (Register_2_ < Register_3_.length){
			Register_4_.push(this.getItemAt(Register_3_[Register_2_]));
			Register_2_++;
		}
		return Register_4_.length > 0 ? Register_4_ : undefined;
	}
	function getSelectedItem(Void) {
		return this.__dataProvider.getItemAt(this.getSelectedIndex());
	}
	function selectItem(index, selectedFlag) {
		if (this.selected == undefined){
			this.selected = new Object();
		}
		var Register_2_ = this.__dataProvider.getItemID(index);
		if (Register_2_ == undefined){
			return undefined;
		}
		if (selectedFlag && !this.isSelected(index)){
			this.selected[Register_2_] = index;
		} else if (!selectedFlag){
			delete this.selected[Register_2_];
		}
	}
	function isSelected(index) {
		var Register_2_ = this.__dataProvider.getItemID(index);
		if (Register_2_ == undefined){
			return false;
		}
		return this.selected[Register_2_] != undefined;
	}
	function clearSelected(transition) {
		var Register_3_ = 0;
		for (var Register_4_ in this.selected) {
			var Register_2_ = this.selected[Register_4_];
			if ((Register_2_ != undefined && this.__vPosition <= Register_2_) && (Register_2_ < (this.__vPosition + this.__rowCount))){
				this.rows[(Register_2_ - this.__vPosition)].drawRow(this.rows[(Register_2_ - this.__vPosition)].item, "normal", (transition && (Register_3_ % 3) == 0));
			}
			Register_3_++;
		}
		delete this.selected;
	}
	static var mixins = new DataSelector();
	static var mixinProps = ["setDataProvider", "getDataProvider", "addItem", "addItemAt", "removeAll", "removeItemAt", "replaceItemAt", "sortItemsBy", "sortItems", "getLength", "getItemAt", "modelChanged", "calcPreferredWidthFromData", "calcPreferredHeightFromData", "getValue", "getSelectedIndex", "getSelectedItem", "getSelectedIndices", "getSelectedItems", "selectItem", "isSelected", "clearSelected", "setSelectedIndex", "setSelectedIndices"];
}
