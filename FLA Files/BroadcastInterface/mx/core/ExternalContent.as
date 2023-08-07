dynamic class mx.core.ExternalContent
{
	var createObject, numChildren, prepList, doLater, loadList, dispatchEvent, loadedList, childLoaded;
	function ExternalContent() {
	}
	function loadExternal(url, placeholderClassName, instanceName, depth, initProps) {
		var Register_2_ = undefined;
		Register_2_ = this.createObject(placeholderClassName, instanceName, depth, initProps);
		this[(mx.core.View.childNameBase + this.numChildren)] = Register_2_;
		if (this.prepList == undefined){
			this.prepList = new Object();
		}
		this.prepList[instanceName] = {obj:Register_2_, url:url, complete:false, initProps:initProps};
		this.prepareToLoadMovie(Register_2_);
		return Register_2_;
	}
	function prepareToLoadMovie(obj) {
		obj.unloadMovie();
		this.doLater(this, "waitForUnload");
	}
	function waitForUnload() {
		var Register_3_ = undefined;
		for (Register_3_ in this.prepList) {
			var Register_2_ = this.prepList[Register_3_];
			if (Register_2_.obj.getBytesTotal() == 0){
				if (this.loadList == undefined){
					this.loadList = new Object();
				}
				this.loadList[Register_3_] = Register_2_;
				Register_2_.obj.loadMovie(Register_2_.url);
				delete this.prepList[Register_3_];
				this.doLater(this, "checkLoadProgress");
			} else {
				this.doLater(this, "waitForUnload");
			}
		}
	}
	function checkLoadProgress() {
		var Register_3_ = undefined;
		for (Register_3_ in this.loadList) {
			var Register_2_ = this.loadList[Register_3_];
			Register_2_.loaded = Register_2_.obj.getBytesLoaded();
			Register_2_.total = Register_2_.obj.getBytesTotal();
			if (Register_2_.total > 0){
				Register_2_.obj._visible = false;
				this.dispatchEvent({type:"progress", target:Register_2_.obj, current:Register_2_.loaded, total:Register_2_.total});
				if (Register_2_.loaded == Register_2_.total){
					if (this.loadedList == undefined){
						this.loadedList = new Object();
					}
					this.loadedList[Register_3_] = Register_2_;
					delete this.loadList[Register_3_];
					this.doLater(this, "contentLoaded");
				}
			} else if (Register_2_.total == -1){
				if (Register_2_.failedOnce != undefined){
					Register_2_.failedOnce++;
					if (Register_2_.failedOnce > 3){
						this.dispatchEvent({type:"complete", target:Register_2_.obj, current:Register_2_.loaded, total:Register_2_.total});
						delete this.loadList[Register_3_];
						//false;
					}
				} else {
					Register_2_.failedOnce = 0;
				}
			}
			this.doLater(this, "checkLoadProgress");
		}
	}
	function contentLoaded() {
		var Register_4_ = undefined;
		for (Register_4_ in this.loadedList) {
			var Register_2_ = this.loadedList[Register_4_];
			Register_2_.obj._visible = true;
			Register_2_.obj._complete = true;
			var Register_3_ = undefined;
			for (Register_3_ in Register_2_.initProps) {
				Register_2_.obj[Register_3_] = Register_2_.initProps[Register_3_];
			}
			this.childLoaded(Register_2_.obj);
			this.dispatchEvent({type:"complete", target:Register_2_.obj, current:Register_2_.loaded, total:Register_2_.total});
			delete this.loadedList[Register_4_];
			//false;
		}
	}
	function convertToUIObject(obj) {
		if (obj.setSize == undefined){
			var Register_2_ = mx.core.UIObject.prototype;
			obj.addProperty("width", Register_2_.__get__width, null);
			obj.addProperty("height", Register_2_.__get__height, null);
			obj.addProperty("left", Register_2_.__get__left, null);
			obj.addProperty("x", Register_2_.__get__x, null);
			obj.addProperty("top", Register_2_.__get__top, null);
			obj.addProperty("y", Register_2_.__get__y, null);
			obj.addProperty("right", Register_2_.__get__right, null);
			obj.addProperty("bottom", Register_2_.__get__bottom, null);
			obj.addProperty("visible", Register_2_.__get__visible, Register_2_.__set__visible);
			obj.move = mx.core.UIObject.prototype.move;
			obj.setSize = mx.core.UIObject.prototype.setSize;
			obj.size = mx.core.UIObject.prototype.size;
			mx.events.UIEventDispatcher.initialize(obj);
		}
	}
	static function enableExternalContent() {
	}
	static function classConstruct() {
		var Register_1_ = mx.core.View.prototype;
		var Register_2_ = ExternalContent.prototype;
		Register_1_.loadExternal = Register_2_.loadExternal;
		Register_1_.prepareToLoadMovie = Register_2_.prepareToLoadMovie;
		Register_1_.waitForUnload = Register_2_.waitForUnload;
		Register_1_.checkLoadProgress = Register_2_.checkLoadProgress;
		Register_1_.contentLoaded = Register_2_.contentLoaded;
		Register_1_.convertToUIObject = Register_2_.convertToUIObject;
		return true;
	}
	static var classConstructed = ExternalContent.classConstruct();
	static var ViewDependency = mx.core.View;
}
