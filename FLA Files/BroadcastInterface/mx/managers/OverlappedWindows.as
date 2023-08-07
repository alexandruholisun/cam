dynamic class mx.managers.OverlappedWindows
{
	function OverlappedWindows() {
	}
	static function checkIdle(Void) {
		if (mx.managers.SystemManager.idleFrames > 10){
			mx.managers.SystemManager.dispatchEvent({type:"idle"});
		} else {
			mx.managers.SystemManager.idleFrames++;
		}
	}
	static function __addEventListener(e, o, l) {
		if (e == "idle"){
			if (mx.managers.SystemManager.interval == undefined){
				mx.managers.SystemManager.interval = setInterval(mx.managers.SystemManager.checkIdle, 100);
			}
		}
		mx.managers.SystemManager._xAddEventListener(e, o, l);
	}
	static function __removeEventListener(e, o, l) {
		if (e == "idle"){
			if (mx.managers.SystemManager._xRemoveEventListener(e, o, l) == 0){
				clearInterval(mx.managers.SystemManager.interval);
			}
		} else {
			mx.managers.SystemManager._xRemoveEventListener(e, o, l);
		}
	}
	static function onMouseDown(Void) {
		mx.managers.SystemManager.idleFrames = 0;
		mx.managers.SystemManager.isMouseDown = true;
		var Register_5_ = _root;
		var Register_3_ = undefined;
		var Register_8_ = _root._xmouse;
		var Register_7_ = _root._ymouse;
		if (mx.managers.SystemManager.form.modalWindow == undefined){
			if (mx.managers.SystemManager.forms.length > 1){
				var Register_6_ = mx.managers.SystemManager.forms.length;
				var Register_4_ = undefined;
				Register_4_ = 0;
				while (Register_4_ < Register_6_){
					var Register_2_ = mx.managers.SystemManager.forms[Register_4_];
					if (Register_2_._visible){
						if (Register_2_.hitTest(Register_8_, Register_7_)){
							if (Register_3_ == undefined){
								Register_3_ = Register_2_.getDepth();
								Register_5_ = Register_2_;
							} else if (Register_3_ < Register_2_.getDepth()){
								Register_3_ = Register_2_.getDepth();
								Register_5_ = Register_2_;
							}
						}
					}
					Register_4_++;
				}
				if (Register_5_ != mx.managers.SystemManager.form){
					mx.managers.SystemManager.activate(Register_5_);
				}
			}
		}
		var Register_9_ = mx.managers.SystemManager.form;
		Register_9_.focusManager._onMouseDown();
	}
	static function onMouseMove(Void) {
		mx.managers.SystemManager.idleFrames = 0;
	}
	static function onMouseUp(Void) {
		mx.managers.SystemManager.isMouseDown = false;
		mx.managers.SystemManager.idleFrames = 0;
	}
	static function activate(f) {
		if (mx.managers.SystemManager.form != undefined){
			if (mx.managers.SystemManager.form != f && mx.managers.SystemManager.forms.length > 1){
				var Register_1_ = mx.managers.SystemManager.form;
				Register_1_.focusManager.deactivate();
			}
		}
		mx.managers.SystemManager.form = f;
		f.focusManager.activate();
	}
	static function deactivate(f) {
		if (mx.managers.SystemManager.form != undefined){
			if (mx.managers.SystemManager.form == f && mx.managers.SystemManager.forms.length > 1){
				var Register_5_ = mx.managers.SystemManager.form;
				Register_5_.focusManager.deactivate();
				var Register_3_ = mx.managers.SystemManager.forms.length;
				var Register_1_ = undefined;
				var Register_2_ = undefined;
				Register_1_ = 0;
				while (Register_1_ < Register_3_){
					if (mx.managers.SystemManager.forms[Register_1_] == f){
						Register_1_ = (Register_1_ + 1);
						while (Register_1_ < Register_3_){
							if (mx.managers.SystemManager.forms[Register_1_]._visible == true){
								Register_2_ = mx.managers.SystemManager.forms[Register_1_];
							}
							Register_1_++;
						}
						mx.managers.SystemManager.form = Register_2_;
						break;
					} else if (mx.managers.SystemManager.forms[Register_1_]._visible == true){
						Register_2_ = mx.managers.SystemManager.forms[Register_1_];
					}
					Register_1_++;
				}
				Register_5_ = mx.managers.SystemManager.form;
				Register_5_.focusManager.activate();
			}
		}
	}
	static function addFocusManager(f) {
		mx.managers.SystemManager.forms.push(f);
		mx.managers.SystemManager.activate(f);
	}
	static function removeFocusManager(f) {
		var Register_3_ = mx.managers.SystemManager.forms.length;
		var Register_1_ = undefined;
		Register_1_ = 0;
		while (Register_1_ < Register_3_){
			if (mx.managers.SystemManager.forms[Register_1_] == f){
				if (mx.managers.SystemManager.form == f){
					mx.managers.SystemManager.deactivate(f);
				}
				mx.managers.SystemManager.forms.splice(Register_1_, 1);
				return undefined;
			}
			Register_1_++;
		}
	}
	static function enableOverlappedWindows() {
		if (!initialized){
			initialized = true;
			mx.managers.SystemManager.checkIdle = OverlappedWindows.checkIdle;
			mx.managers.SystemManager.__addEventListener = OverlappedWindows.__addEventListener;
			mx.managers.SystemManager.__removeEventListener = OverlappedWindows.__removeEventListener;
			mx.managers.SystemManager.onMouseDown = OverlappedWindows.onMouseDown;
			mx.managers.SystemManager.onMouseMove = OverlappedWindows.onMouseMove;
			mx.managers.SystemManager.onMouseUp = OverlappedWindows.onMouseUp;
			mx.managers.SystemManager.activate = OverlappedWindows.activate;
			mx.managers.SystemManager.deactivate = OverlappedWindows.deactivate;
			mx.managers.SystemManager.addFocusManager = OverlappedWindows.addFocusManager;
			mx.managers.SystemManager.removeFocusManager = OverlappedWindows.removeFocusManager;
		}
	}
	static var initialized = false;
	static var SystemManagerDependency = mx.managers.SystemManager;
}
