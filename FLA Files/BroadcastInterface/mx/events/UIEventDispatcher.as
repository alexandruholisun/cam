dynamic class mx.events.UIEventDispatcher extends mx.events.EventDispatcher
{
	var dispatchQueue, owner, __sentLoadEvent, __origAddEventListener;
	function UIEventDispatcher() {
		super();
	}
	static function addKeyEvents(obj) {
		if (obj.keyHandler == undefined){
			var Register_1_ = (obj.keyHandler = new Object());
			Register_1_.owner = obj;
			Register_1_.onKeyDown = _fEventDispatcher.onKeyDown;
			Register_1_.onKeyUp = _fEventDispatcher.onKeyUp;
		}
		Key.addListener(obj.keyHandler);
	}
	static function removeKeyEvents(obj) {
		Key.removeListener(obj.keyHandler);
	}
	static function addLoadEvents(obj) {
		if (obj.onLoad == undefined){
			obj.onLoad = _fEventDispatcher.onLoad;
			obj.onUnload = _fEventDispatcher.onUnload;
			if (obj.getBytesTotal() == obj.getBytesLoaded()){
				obj.doLater(obj, "onLoad");
			}
		}
	}
	static function removeLoadEvents(obj) {
		delete obj.onLoad;
		delete obj.onUnload;
	}
	static function initialize(obj) {
		if (_fEventDispatcher == undefined){
			_fEventDispatcher = new UIEventDispatcher();
		}
		obj.addEventListener = _fEventDispatcher.__addEventListener;
		obj.__origAddEventListener = _fEventDispatcher.addEventListener;
		obj.removeEventListener = _fEventDispatcher.removeEventListener;
		obj.dispatchEvent = _fEventDispatcher.dispatchEvent;
		obj.dispatchQueue = _fEventDispatcher.dispatchQueue;
	}
	function dispatchEvent(eventObj) {
		if (eventObj.target == undefined){
			eventObj.target = this;
		}
		this[(eventObj.type + "Handler")](eventObj);
		this.dispatchQueue(mx.events.EventDispatcher, eventObj);
		this.dispatchQueue(this, eventObj);
	}
	function onKeyDown(Void) {
		this.owner.dispatchEvent({type:"keyDown", code:Key.getCode(), ascii:Key.getAscii(), shiftKey:Key.isDown(16), ctrlKey:Key.isDown(17)});
	}
	function onKeyUp(Void) {
		this.owner.dispatchEvent({type:"keyUp", code:Key.getCode(), ascii:Key.getAscii(), shiftKey:Key.isDown(16), ctrlKey:Key.isDown(17)});
	}
	function onLoad(Void) {
		if (this.__sentLoadEvent != true){
			this.dispatchEvent({type:"load"});
		}
		this.__sentLoadEvent = true;
	}
	function onUnload(Void) {
		this.dispatchEvent({type:"unload"});
	}
	function __addEventListener(event, handler) {
		this.__origAddEventListener(event, handler);
		var Register_3_ = lowLevelEvents;
		for (var Register_5_ in Register_3_) {
			if (UIEventDispatcher[Register_5_][event] != undefined){
				var Register_2_ = Register_3_[Register_5_][0];
				UIEventDispatcher[Register_2_](this);
			}
		}
	}
	function removeEventListener(event, handler) {
		var Register_6_ = ("__q_" + event);
		mx.events.EventDispatcher._removeEventListener(this[Register_6_], event, handler);
		if (this[Register_6_].length == 0){
			var Register_2_ = lowLevelEvents;
			for (var Register_5_ in Register_2_) {
				if (UIEventDispatcher[Register_5_][event] != undefined){
					var Register_3_ = Register_2_[Register_5_][1];
					UIEventDispatcher[Register_2_[Register_5_][1]](this);
				}
			}
		}
	}
	static var keyEvents = {keyDown:1, keyUp:1};
	static var loadEvents = {load:1, unload:1};
	static var lowLevelEvents = {keyEvents:["addKeyEvents", "removeKeyEvents"], loadEvents:["addLoadEvents", "removeLoadEvents"]};
	static var _fEventDispatcher = undefined;
}
