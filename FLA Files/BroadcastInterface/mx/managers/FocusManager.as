dynamic class mx.managers.FocusManager extends mx.core.UIComponent
{
	var __defaultPushButton, defPushButton, form, move, tabEnabled, _height, _width, _y, _x, _alpha, _parent, tabCapture, watch, _visible, lastFocus, doLater, lastSelFocus, cancelAllDoLaters, _searchKey, _lastTarget, _firstNode, _nextIsNext, _nextNode, _lastx, _prevNode, _needPrev, _foundList, _prevObj, _nextObj, _firstObj, _lastObj, _lastNode, lastTabFocus, lastYMouse, lastXMouse, findFocusFromObject;
	function FocusManager() {
		super();
	}
	function get defaultPushButton() {
		return this.__defaultPushButton;
	}
	function set defaultPushButton(x) {
		if (x != this.__defaultPushButton){
			this.__defaultPushButton.emphasized = false;
			this.__defaultPushButton = x;
			this.defPushButton = x;
			x.emphasized = true;
		}
	}
	function getMaxTabIndex(o) {
		var Register_3_ = 0;
		var Register_6_ = undefined;
		for (Register_6_ in o) {
			var Register_2_ = o[Register_6_];
			if (Register_2_._parent == o){
				if (Register_2_.tabIndex != undefined){
					if (Register_2_.tabIndex > Register_3_){
						Register_3_ = Register_2_.tabIndex;
					}
				}
				if (Register_2_.tabChildren == true){
					var Register_4_ = this.getMaxTabIndex(Register_2_);
					if (Register_4_ > Register_3_){
						Register_3_ = Register_4_;
					}
				}
			}
		}
		return Register_3_;
	}
	function getNextTabIndex(Void) {
		return (this.getMaxTabIndex(this.form) + 1);
	}
	function get nextTabIndex() {
		return this.getNextTabIndex();
	}
	function relocate(Void) {
		var Register_2_ = mx.managers.SystemManager.screen;
		this.move((Register_2_.x - 1), (Register_2_.y - 1));
	}
	function init(Void) {
		super.init();
		this.tabEnabled = false;
		this._width = this._height = 1;
		this._x = this._y = -1;
		this._alpha = 0;
		this._parent.focusManager = this;
		this._parent.tabChildren = true;
		this._parent.tabEnabled = false;
		this.form = this._parent;
		this._parent.addEventListener("hide", this);
		this._parent.addEventListener("reveal", this);
		mx.managers.SystemManager.init();
		mx.managers.SystemManager.addFocusManager(this.form);
		this.tabCapture.tabIndex = 0;
		this.watch("enabled", this.enabledChanged);
		Selection.addListener(this);
	}
	function enabledChanged(id, oldValue, newValue) {
		this._visible = newValue;
		return newValue;
	}
	function activate(Void) {
		Key.addListener(this);
		this.activated = this._visible = true;
		if (this.lastFocus != undefined){
			this.bNeedFocus = true;
			if (!mx.managers.SystemManager.isMouseDown){
				this.doLater(this, "restoreFocus");
			}
		}
	}
	function deactivate(Void) {
		Key.removeListener(this);
		this.activated = this._visible = false;
		var Register_2_ = this.getSelectionFocus();
		var Register_3_ = this.getActualFocus(Register_2_);
		if (this.isOurFocus(Register_3_)){
			this.lastSelFocus = Register_2_;
			this.lastFocus = Register_3_;
		}
		this.cancelAllDoLaters();
	}
	function isOurFocus(o) {
		if (o.focusManager == this){
			return true;
		}
		while (o != undefined){
			if (o.focusManager != undefined){
				return false;
			}
			if (o._parent == this._parent){
				return true;
			}
			o = o._parent;
		}
		return false;
	}
	function onSetFocus(o, n) {
		if (n == null){
			if (this.activated){
				this.bNeedFocus = true;
			}
		} else {
			var Register_2_ = this.getFocus();
			if (this.isOurFocus(Register_2_)){
				this.bNeedFocus = false;
				this.lastFocus = Register_2_;
				this.lastSelFocus = n;
			}
		}
	}
	function restoreFocus(Void) {
		var Register_2_ = this.lastSelFocus.hscroll;
		if (Register_2_ != undefined){
			var Register_5_ = this.lastSelFocus.scroll;
			var Register_4_ = this.lastSelFocus.background;
		}
		this.lastFocus.setFocus();
		var Register_3_ = Selection;
		Selection.setSelection(Register_3_.lastBeginIndex, Register_3_.lastEndIndex);
		if (Register_2_ != undefined){
			this.lastSelFocus.scroll = Register_5_;
			this.lastSelFocus.hscroll = Register_2_;
			this.lastSelFocus.background = Register_4_;
		}
	}
	function onUnload(Void) {
		mx.managers.SystemManager.removeFocusManager(this.form);
	}
	function setFocus(o) {
		if (o == null){
			Selection.setFocus(null);
		} else if (o.setFocus == undefined){
			Selection.setFocus(o);
		} else {
			o.setFocus();
		}
	}
	function getActualFocus(o) {
		var Register_1_ = o._parent;
		while (Register_1_ != undefined){
			if (Register_1_.focusTextField != undefined){
				while (Register_1_.focusTextField != undefined){
					o = Register_1_;
					Register_1_ = Register_1_._parent;
					if (Register_1_ == undefined){
						return undefined;
					}
					if (Register_1_.focusTextField == undefined){
						return o;
					}
				}
			}
			if (Register_1_.tabEnabled != true){
				return o;
			}
			o = Register_1_;
			Register_1_ = o._parent;
		}
		return undefined;
	}
	function getSelectionFocus() {
		var m = Selection.getFocus();
		var o = eval(m);
		return o;
	}
	function getFocus(Void) {
		var Register_2_ = this.getSelectionFocus();
		return this.getActualFocus(Register_2_);
	}
	function walkTree(p, index, groupName, dir, lookup, firstChild) {
		var Register_5_ = true;
		var Register_B_ = undefined;
		for (Register_B_ in p) {
			var Register_2_ = p[Register_B_];
			if (((Register_2_._parent == p && Register_2_.enabled != false) && Register_2_._visible != false) && Register_2_.tabEnabled == true || Register_2_.tabEnabled != false && (((((((Register_2_.onPress != undefined || Register_2_.onRelease != undefined) || Register_2_.onReleaseOutside != undefined) || Register_2_.onDragOut != undefined) || Register_2_.onDragOver != undefined) || Register_2_.onRollOver != undefined) || Register_2_.onRollOut != undefined) || (Register_2_ instanceof TextField))){
				if (Register_2_._searchKey == this._searchKey){
					continue;
				}
				Register_2_._searchKey = this._searchKey;
				if (Register_2_ != this._lastTarget){
					if ((Register_2_.groupName != undefined || groupName != undefined) && (Register_2_.groupName == groupName)){
						continue;
					}
					if (Register_2_ instanceof TextField && Register_2_.selectable == false){
						continue;
					}
					if (Register_5_ || ((Register_2_.groupName != undefined && Register_2_.groupName == this._firstNode.groupName) && (Register_2_.selected == true))){
						if (firstChild){
							this._firstNode = Register_2_;
							firstChild = false;
						}
					}
					if (this._nextIsNext == true){
						if (((Register_2_.groupName != undefined && Register_2_.groupName == this._nextNode.groupName) && Register_2_.selected == true) || this._nextNode == undefined && Register_2_.groupName == undefined || (Register_2_.groupName != undefined && Register_2_.groupName != groupName)){
							this._nextNode = Register_2_;
						}
					}
					if (Register_2_.groupName == undefined || groupName != Register_2_.groupName){
						if ((this._lastx.groupName != undefined && Register_2_.groupName == this._lastx.groupName) && (this._lastx.selected == true)){
						} else {
							this._lastx = Register_2_;
						}
					}
				} else {
					this._prevNode = this._lastx;
					this._needPrev = false;
					this._nextIsNext = true;
				}
				if (Register_2_.tabIndex != undefined){
					if (Register_2_.tabIndex == index){
						if (this._foundList[Register_2_._name] == undefined){
							if (this._needPrev){
								this._prevObj = Register_2_;
								this._needPrev = false;
							}
							this._nextObj = Register_2_;
						}
					}
					if (dir && Register_2_.tabIndex > index){
						if (this._nextObj == undefined || this._nextObj.tabIndex > Register_2_.tabIndex && ((Register_2_.groupName == undefined || this._nextObj.groupName == undefined) || Register_2_.groupName != this._nextObj.groupName) || (((this._nextObj.groupName != undefined && this._nextObj.groupName == Register_2_.groupName) && this._nextObj.selected != true) && (Register_2_.selected == true || this._nextObj.tabIndex > Register_2_.tabIndex))){
							this._nextObj = Register_2_;
						}
					} else {
						if (!dir && Register_2_.tabIndex < index){
							if (this._prevObj == undefined || this._prevObj.tabIndex < Register_2_.tabIndex && ((Register_2_.groupName == undefined || this._prevObj.groupName == undefined) || Register_2_.groupName != this._prevObj.groupName) || (((this._prevObj.groupName != undefined && this._prevObj.groupName == Register_2_.groupName) && this._prevObj.selected != true) && (Register_2_.selected == true || this._prevObj.tabIndex < Register_2_.tabIndex))){
								this._prevObj = Register_2_;
							}
						}
					}
					if (this._firstObj == undefined || Register_2_.tabIndex < this._firstObj.tabIndex && ((Register_2_.groupName == undefined || this._firstObj.groupName == undefined) || Register_2_.groupName != this._firstObj.groupName) || (((this._firstObj.groupName != undefined && this._firstObj.groupName == Register_2_.groupName) && this._firstObj.selected != true) && (Register_2_.selected == true || Register_2_.tabIndex < this._firstObj.tabIndex))){
						this._firstObj = Register_2_;
					}
					if (this._lastObj == undefined || Register_2_.tabIndex > this._lastObj.tabIndex && ((Register_2_.groupName == undefined || this._lastObj.groupName == undefined) || Register_2_.groupName != this._lastObj.groupName) || (((this._lastObj.groupName != undefined && this._lastObj.groupName == Register_2_.groupName) && this._lastObj.selected != true) && (Register_2_.selected == true || Register_2_.tabIndex > this._lastObj.tabIndex))){
						this._lastObj = Register_2_;
					}
				}
				if (Register_2_.tabChildren){
					this.getTabCandidateFromChildren(Register_2_, index, groupName, dir, (Register_5_ && firstChild));
				}
				Register_5_ = false;
			} else {
				if ((Register_2_._parent == p && Register_2_.tabChildren == true) && (Register_2_._visible != false)){
					if (Register_2_ == this._lastTarget){
						if (Register_2_._searchKey == this._searchKey){
							continue;
						}
						Register_2_._searchKey = this._searchKey;
						if (this._prevNode == undefined){
							var Register_3_ = this._lastx;
							var Register_7_ = false;
							while (Register_3_ != undefined){
								if (Register_3_ == Register_2_){
									Register_7_ = true;
									break;
								}
								Register_3_ = Register_3_._parent;
							}
							if (Register_7_ == false){
								this._prevNode = this._lastx;
							}
						}
						this._needPrev = false;
						if (this._nextNode == undefined){
							this._nextIsNext = true;
						}
					} else {
						if (!(Register_2_.focusManager != undefined && Register_2_.focusManager._parent == Register_2_)){
							if (Register_2_._searchKey == this._searchKey){
								continue;
							}
							Register_2_._searchKey = this._searchKey;
							this.getTabCandidateFromChildren(Register_2_, index, groupName, dir, (Register_5_ && firstChild));
						}
					}
					Register_5_ = false;
				}
			}
		}
		this._lastNode = this._lastx;
		if (lookup){
			if (p._parent != undefined){
				if (p != this._parent){
					if (this._prevNode == undefined && dir){
						this._needPrev = true;
					} else {
						if (this._nextNode == undefined && !dir){
							this._nextIsNext = false;
						}
					}
					this._lastTarget = this._lastTarget._parent;
					this.getTabCandidate(p._parent, index, groupName, dir, true);
				}
			}
		}
	}
	function getTabCandidate(o, index, groupName, dir, firstChild) {
		var Register_2_ = undefined;
		var Register_3_ = true;
		if (o == this._parent){
			Register_2_ = o;
			Register_3_ = false;
		} else {
			Register_2_ = o._parent;
			if (Register_2_ == undefined){
				Register_2_ = o;
				Register_3_ = false;
			}
		}
		this.walkTree(Register_2_, index, groupName, dir, Register_3_, firstChild);
	}
	function getTabCandidateFromChildren(o, index, groupName, dir, firstChild) {
		this.walkTree(o, index, groupName, dir, false, firstChild);
	}
	function getFocusManagerFromObject(o) {
		while (o != undefined){
			if (o.focusManager != undefined){
				return o.focusManager;
			}
			o = o._parent;
		}
		return undefined;
	}
	function tabHandler(Void) {
		this.bDrawFocus = true;
		var Register_5_ = this.getSelectionFocus();
		var Register_4_ = this.getActualFocus(Register_5_);
		if (Register_4_ != Register_5_){
			Register_5_ = Register_4_;
		}
		if (this.getFocusManagerFromObject(Register_5_) != this){
			Register_5_ == undefined;
		}
		if (Register_5_ == undefined){
			Register_5_ = this.form;
		} else if (Register_5_.tabIndex != undefined){
			if (this._foundList != undefined || this._foundList.tabIndex != Register_5_.tabIndex){
				this._foundList = new Object();
				this._foundList.tabIndex = Register_5_.tabIndex;
			}
			this._foundList[Register_5_._name] = Register_5_;
		}
		var Register_3_ = Key.isDown(16) != true;
		this._searchKey = getTimer();
		this._needPrev = true;
		this._nextIsNext = false;
		this._lastx = undefined;
		this._firstNode = undefined;
		this._lastNode = undefined;
		this._nextNode = undefined;
		this._prevNode = undefined;
		this._firstObj = undefined;
		this._lastObj = undefined;
		this._nextObj = undefined;
		this._prevObj = undefined;
		this._lastTarget = Register_5_;
		var Register_6_ = Register_5_;
		this.getTabCandidate(Register_6_, (Register_5_.tabIndex == undefined ? 0 : Register_5_.tabIndex), Register_5_.groupName, Register_3_, true);
		var Register_2_ = undefined;
		if (Register_3_){
			if (this._nextObj != undefined){
				Register_2_ = this._nextObj;
			} else {
				Register_2_ = this._firstObj;
			}
		} else if (this._prevObj != undefined){
			Register_2_ = this._prevObj;
		} else {
			Register_2_ = this._lastObj;
		}
		if (Register_2_.tabIndex != Register_5_.tabIndex){
			this._foundList = new Object();
			this._foundList.tabIndex = Register_2_.tabIndex;
			this._foundList[Register_2_._name] = Register_2_;
		} else {
			if (this._foundList == undefined){
				this._foundList = new Object();
				this._foundList.tabIndex = Register_2_.tabIndex;
			}
			this._foundList[Register_2_._name] = Register_2_;
		}
		if (Register_2_ == undefined){
			if (Register_3_ == false){
				if (this._nextNode != undefined){
					Register_2_ = this._nextNode;
				} else {
					Register_2_ = this._firstNode;
				}
			} else {
				if (this._prevNode == undefined || Register_5_ == this.form){
					Register_2_ = this._lastNode;
				} else {
					Register_2_ = this._prevNode;
				}
			}
		}
		if (Register_2_ == undefined){
			return undefined;
		}
		this.lastTabFocus = Register_2_;
		this.setFocus(Register_2_);
		if (Register_2_.emphasized != undefined){
			if (this.defPushButton != undefined){
				Register_5_ = this.defPushButton;
				this.defPushButton = Register_2_;
				Register_5_.emphasized = false;
				Register_2_.emphasized = true;
			}
		} else {
			if (this.defPushButton != undefined && this.defPushButton != this.__defaultPushButton){
				Register_5_ = this.defPushButton;
				this.defPushButton = this.__defaultPushButton;
				Register_5_.emphasized = false;
				this.__defaultPushButton.emphasized = true;
			}
		}
	}
	function onKeyDown(Void) {
		mx.managers.SystemManager.idleFrames = 0;
		if (this.defaultPushButtonEnabled){
			if (Key.getCode() == 13){
				if (this.defaultPushButton != undefined){
					this.doLater(this, "sendDefaultPushButtonEvent");
				}
			}
		}
	}
	function sendDefaultPushButtonEvent(Void) {
		this.defPushButton.dispatchEvent({type:"click"});
	}
	function getMousedComponentFromChildren(x, y, o) {
		for (var Register_7_ in o) {
			var Register_2_ = o[Register_7_];
			if (((Register_2_._visible && Register_2_.enabled) && Register_2_._parent == o) && (Register_2_._searchKey != this._searchKey)){
				Register_2_._searchKey = this._searchKey;
				if (Register_2_.hitTest(x, y, true)){
					if (Register_2_.onPress != undefined || Register_2_.onRelease != undefined){
						return Register_2_;
					}
					var Register_3_ = this.getMousedComponentFromChildren(x, y, Register_2_);
					if (Register_3_ != undefined){
						return Register_3_;
					}
					return Register_2_;
				}
			}
		}
		return undefined;
	}
	function mouseActivate(Void) {
		if (!this.bNeedFocus){
			return undefined;
		}
		this._searchKey = getTimer();
		var Register_2_ = this.getMousedComponentFromChildren(this.lastXMouse, this.lastYMouse, this.form);
		if (Register_2_ instanceof mx.core.UIComponent){
			return undefined;
		}
		Register_2_ = this.findFocusFromObject(Register_2_);
		if (Register_2_ == this.lastFocus){
			return undefined;
		}
		if (Register_2_ == undefined){
			this.doLater(this, "restoreFocus");
			return undefined;
		}
		var Register_3_ = Register_2_.hscroll;
		if (Register_3_ != undefined){
			var Register_6_ = Register_2_.scroll;
			var Register_5_ = Register_2_.background;
		}
		this.setFocus(Register_2_);
		var Register_4_ = Selection;
		Selection.setSelection(Register_4_.lastBeginIndex, Register_4_.lastEndIndex);
		if (Register_3_ != undefined){
			Register_2_.scroll = Register_6_;
			Register_2_.hscroll = Register_3_;
			Register_2_.background = Register_5_;
		}
	}
	function _onMouseDown(Void) {
		this.bDrawFocus = false;
		if (this.lastFocus != undefined){
			this.lastFocus.drawFocus(false);
		}
		mx.managers.SystemManager.idleFrames = 0;
		var Register_3_ = Selection;
		Register_3_.lastBeginIndex = Selection.getBeginIndex();
		Register_3_.lastEndIndex = Selection.getEndIndex();
		this.lastXMouse = _root._xmouse;
		this.lastYMouse = _root._ymouse;
	}
	function onMouseUp(Void) {
		if (this._visible){
			this.doLater(this, "mouseActivate");
		}
	}
	function handleEvent(e) {
		if (e.type == "reveal"){
			mx.managers.SystemManager.activate(this.form);
		} else {
			mx.managers.SystemManager.deactivate(this.form);
		}
	}
	static function enableFocusManagement() {
		if (!initialized){
			initialized = true;
			Object.registerClass("FocusManager", FocusManager);
			if (_root.focusManager == undefined){
				_root.createClassObject(FocusManager, "focusManager", mx.managers.DepthManager.highestDepth--);
			}
		}
	}
	static var symbolName = "FocusManager";
	static var symbolOwner = mx.managers.FocusManager;
	static var version = "2.0.0.360";
	var className = "FocusManager";
	var bNeedFocus = false;
	var bDrawFocus = false;
	var defaultPushButtonEnabled = true;
	var activated = true;
	static var initialized = false;
	static var UIObjectExtensionsDependency = mx.core.ext.UIObjectExtensions;
}
