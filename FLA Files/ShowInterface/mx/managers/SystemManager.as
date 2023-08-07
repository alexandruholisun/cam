dynamic class mx.managers.SystemManager
{
	static var activate, deactivate, interval, checkIdle, onMouseMove, onMouseUp;
	static var _xAddEventListener, addEventListener, __addEventListener, _xRemoveEventListener, removeEventListener, __removeEventListener, form, __screen, dispatchEvent;
	function SystemManager() {
	}
	static function init(Void) {
		if (_initialized == false){
			_initialized = true;
			mx.events.EventDispatcher.initialize(SystemManager);
			Mouse.addListener(SystemManager);
			Stage.addListener(SystemManager);
			_xAddEventListener = addEventListener;
			addEventListener = __addEventListener;
			_xRemoveEventListener = removeEventListener;
			removeEventListener = __removeEventListener;
		}
	}
	static function addFocusManager(f) {
		form = f;
		f.focusManager.activate();
	}
	static function removeFocusManager(f) {
	}
	static function onMouseDown(Void) {
		var Register_1_ = form;
		Register_1_.focusManager._onMouseDown();
	}
	static function onResize(Void) {
		var Register_7_ = Stage.width;
		var Register_6_ = Stage.height;
		var Register_9_ = _global.origWidth;
		var Register_8_ = _global.origHeight;
		var Register_3_ = Stage.align;
		var Register_5_ = (Register_9_ - Register_7_) / 2;
		var Register_4_ = (Register_8_ - Register_6_) / 2;
		if (Register_3_ == "T"){
			Register_4_ = 0;
		} else if (Register_3_ == "B"){
			Register_4_ = (Register_8_ - Register_6_);
		} else if (Register_3_ == "L"){
			Register_5_ = 0;
		} else if (Register_3_ == "R"){
			Register_5_ = (Register_9_ - Register_7_);
		} else if (Register_3_ == "LT"){
			Register_4_ = 0;
			Register_5_ = 0;
		} else if (Register_3_ == "TR"){
			Register_4_ = 0;
			Register_5_ = (Register_9_ - Register_7_);
		} else if (Register_3_ == "LB"){
			Register_4_ = (Register_8_ - Register_6_);
			Register_5_ = 0;
		} else if (Register_3_ == "RB"){
			Register_4_ = (Register_8_ - Register_6_);
			Register_5_ = (Register_9_ - Register_7_);
		}
		if (__screen == undefined){
			__screen = new Object();
		}
		__screen.x = Register_5_;
		__screen.y = Register_4_;
		__screen.width = Register_7_;
		__screen.height = Register_6_;
		_root.focusManager.relocate();
		dispatchEvent({type:"resize"});
	}
	static function get screen() {
		SystemManager.init();
		if (__screen == undefined){
			SystemManager.onResize();
		}
		return __screen;
	}
	static var _initialized = false;
	static var idleFrames = 0;
	static var isMouseDown = false;
	static var forms = new Array();
}
