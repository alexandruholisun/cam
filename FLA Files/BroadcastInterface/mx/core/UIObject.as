dynamic class mx.core.UIObject extends MovieClip
{
	var _width, _height, _x, _y, _parent, _minHeight, _minWidth, _visible, dispatchEvent, _xscale, _yscale, methodTable, onEnterFrame, tfList, __width, __height, moveTo, lineTo, createTextField, buildDepthTable, findNextAvailableDepth, idNames, childrenCreated, _name, createAccessibilityImplementation, _endInit, validateNow, hasOwnProperty, initProperties, stylecache, className, ignoreClassStyleDeclaration, _tf, fontFamily, fontSize, color, marginLeft, marginRight, fontStyle, fontWeight, textAlign, textIndent, textDecoration, embedFonts, styleName, enabled;
	function UIObject() {
		super();
		this.constructObject();
	}
	function get width() {
		return this._width;
	}
	function get height() {
		return this._height;
	}
	function get left() {
		return this._x;
	}
	function get x() {
		return this._x;
	}
	function get top() {
		return this._y;
	}
	function get y() {
		return this._y;
	}
	function get right() {
		return (this._parent.width - (this._x + this.width));
	}
	function get bottom() {
		return (this._parent.height - (this._y + this.height));
	}
	function getMinHeight(Void) {
		return this._minHeight;
	}
	function setMinHeight(h) {
		this._minHeight = h;
	}
	function get minHeight() {
		return this.getMinHeight();
	}
	function set minHeight(h) {
		this.setMinHeight(h);
	}
	function getMinWidth(Void) {
		return this._minWidth;
	}
	function setMinWidth(w) {
		this._minWidth = w;
	}
	function get minWidth() {
		return this.getMinWidth();
	}
	function set minWidth(w) {
		this.setMinWidth(w);
	}
	function setVisible(x, noEvent) {
		if (x != this._visible){
			this._visible = x;
			if (noEvent != true){
				this.dispatchEvent({type:(x ? "reveal" : "hide")});
			}
		}
	}
	function get visible() {
		return this._visible;
	}
	function set visible(x) {
		this.setVisible(x, false);
	}
	function get scaleX() {
		return this._xscale;
	}
	function set scaleX(x) {
		this._xscale = x;
	}
	function get scaleY() {
		return this._yscale;
	}
	function set scaleY(y) {
		this._yscale = y;
	}
	function doLater(obj, fn) {
		if (this.methodTable == undefined){
			this.methodTable = new Array();
		}
		this.methodTable.push({obj:obj, fn:fn});
		this.onEnterFrame = this.doLaterDispatcher;
	}
	function doLaterDispatcher(Void) {
		delete this.onEnterFrame;
		if (this.invalidateFlag){
			this.redraw();
		}
		var Register_3_ = this.methodTable;
		this.methodTable = new Array();
		if (Register_3_.length > 0){
			var Register_2_ = undefined;
			while ((Register_2_ = Register_3_.shift()) != undefined){
				Register_2_.obj[Register_2_.fn]();
			}
		}
	}
	function cancelAllDoLaters(Void) {
		delete this.onEnterFrame;
		this.methodTable = new Array();
	}
	function invalidate(Void) {
		this.invalidateFlag = true;
		this.onEnterFrame = this.doLaterDispatcher;
	}
	function invalidateStyle(Void) {
		this.invalidate();
	}
	function redraw(bAlways) {
		if (this.invalidateFlag || bAlways){
			this.invalidateFlag = false;
			var Register_2_ = undefined;
			for (Register_2_ in this.tfList) {
				this.tfList[Register_2_].draw();
			}
			this.draw();
			this.dispatchEvent({type:"draw"});
		}
	}
	function draw(Void) {
	}
	function move(x, y, noEvent) {
		var Register_3_ = this._x;
		var Register_2_ = this._y;
		this._x = x;
		this._y = y;
		if (noEvent != true){
			this.dispatchEvent({type:"move", oldX:Register_3_, oldY:Register_2_});
		}
	}
	function setSize(w, h, noEvent) {
		var Register_2_ = this.__width;
		var Register_3_ = this.__height;
		this.__width = w;
		this.__height = h;
		this.size();
		if (noEvent != true){
			this.dispatchEvent({type:"resize", oldWidth:Register_2_, oldHeight:Register_3_});
		}
	}
	function size(Void) {
		this._width = this.__width;
		this._height = this.__height;
	}
	function drawRect(x1, y1, x2, y2) {
		this.moveTo(x1, y1);
		this.lineTo(x2, y1);
		this.lineTo(x2, y2);
		this.lineTo(x1, y2);
		this.lineTo(x1, y1);
	}
	function createLabel(name, depth, text) {
		this.createTextField(name, depth, 0, 0, 0, 0);
		var Register_2_ = this[name];
		Register_2_._color = textColorList;
		Register_2_._visible = false;
		Register_2_.__text = text;
		if (this.tfList == undefined){
			this.tfList = new Object();
		}
		this.tfList[name] = Register_2_;
		Register_2_.invalidateStyle();
		this.invalidate();
		Register_2_.styleName = this;
		return Register_2_;
	}
	function createObject(linkageName, id, depth, initobj) {
		return this.attachMovie(linkageName, id, depth, initobj);
	}
	function createClassObject(className, id, depth, initobj) {
		var Register_3_ = className.symbolName == undefined;
		if (Register_3_){
			Object.registerClass(className.symbolOwner.symbolName, className);
		}
		var Register_4_ = this.createObject(className.symbolOwner.symbolName, id, depth, initobj);
		if (Register_3_){
			Object.registerClass(className.symbolOwner.symbolName, className.symbolOwner);
		}
		return Register_4_;
	}
	function createEmptyObject(id, depth) {
		return this.createClassObject(UIObject, id, depth);
	}
	function destroyObject(id) {
		var Register_2_ = this[id];
		if (Register_2_.getDepth() < 0){
			var Register_4_ = this.buildDepthTable();
			var Register_5_ = this.findNextAvailableDepth(0, Register_4_, "up");
			var Register_3_ = Register_5_;
			Register_2_.swapDepths(Register_3_);
		}
		Register_2_.removeMovieClip();
		delete this[id];
	}
	function getSkinIDName(tag) {
		return this.idNames[tag];
	}
	function setSkin(tag, linkageName, initObj) {
		if (_global.skinRegistry[linkageName] == undefined){
			mx.skins.SkinElement.registerElement(linkageName, mx.skins.SkinElement);
		}
		return this.createObject(linkageName, this.getSkinIDName(tag), tag, initObj);
	}
	function createSkin(tag) {
		var Register_2_ = this.getSkinIDName(tag);
		this.createEmptyObject(Register_2_, tag);
		return this[Register_2_];
	}
	function createChildren(Void) {
	}
	function _createChildren(Void) {
		this.createChildren();
		this.childrenCreated = true;
	}
	function constructObject(Void) {
		if (this._name == undefined){
			return undefined;
		}
		this.init();
		this._createChildren();
		this.createAccessibilityImplementation();
		this._endInit();
		if (this.validateNow){
			this.redraw(true);
		} else {
			this.invalidate();
		}
	}
	function initFromClipParameters(Void) {
		var Register_4_ = false;
		var Register_2_ = undefined;
		for (Register_2_ in this.clipParameters) {
			if (this.hasOwnProperty(Register_2_)){
				Register_4_ = true;
				this[("def_" + Register_2_)] = this[Register_2_];
				delete this[Register_2_];
			}
		}
		if (Register_4_){
			for (Register_2_ in this.clipParameters) {
				var Register_3_ = this[("def_" + Register_2_)];
				if (Register_3_ != undefined){
					this[Register_2_] = Register_3_;
				}
			}
		}
	}
	function init(Void) {
		this.__width = this._width;
		this.__height = this._height;
		if (this.initProperties == undefined){
			this.initFromClipParameters();
		} else {
			this.initProperties();
		}
		if (_global.cascadingStyles == true){
			this.stylecache = new Object();
		}
	}
	function getClassStyleDeclaration(Void) {
		var Register_4_ = this;
		var Register_3_ = this.className;
		while (Register_3_ != undefined){
			if (this.ignoreClassStyleDeclaration[Register_3_] == undefined){
				if (_global.styles[Register_3_] != undefined){
					return _global.styles[Register_3_];
				}
			}
			Register_4_ = Register_4_.__proto__;
			Register_3_ = Register_4_.className;
		}
	}
	function setColor(color) {
	}
	function __getTextFormat(tf, bAll) {
		var Register_8_ = this.stylecache.tf;
		if (Register_8_ != undefined){
			var Register_3_ = undefined;
			for (Register_3_ in mx.styles.StyleManager.TextFormatStyleProps) {
				if (bAll || mx.styles.StyleManager.TextFormatStyleProps[Register_3_]){
					if (tf[Register_3_] == undefined){
						tf[Register_3_] = Register_8_[Register_3_];
					}
				}
			}
			return false;
		}
		var Register_6_ = false;
		for (var Register_3_ in mx.styles.StyleManager.TextFormatStyleProps) {
			if (bAll || mx.styles.StyleManager.TextFormatStyleProps[Register_3_]){
				if (tf[Register_3_] == undefined){
					var Register_5_ = this._tf[Register_3_];
					if (Register_5_ != undefined){
						tf[Register_3_] = Register_5_;
					} else {
						if (Register_3_ == "font" && this.fontFamily != undefined){
							tf[Register_3_] = this.fontFamily;
						} else {
							if (Register_3_ == "size" && this.fontSize != undefined){
								tf[Register_3_] = this.fontSize;
							} else {
								if (Register_3_ == "color" && this.color != undefined){
									tf[Register_3_] = this.color;
								} else {
									if (Register_3_ == "leftMargin" && this.marginLeft != undefined){
										tf[Register_3_] = this.marginLeft;
									} else {
										if (Register_3_ == "rightMargin" && this.marginRight != undefined){
											tf[Register_3_] = this.marginRight;
										} else {
											if (Register_3_ == "italic" && this.fontStyle != undefined){
												tf[Register_3_] = this.fontStyle == Register_3_;
											} else {
												if (Register_3_ == "bold" && this.fontWeight != undefined){
													tf[Register_3_] = this.fontWeight == Register_3_;
												} else {
													if (Register_3_ == "align" && this.textAlign != undefined){
														tf[Register_3_] = this.textAlign;
													} else {
														if (Register_3_ == "indent" && this.textIndent != undefined){
															tf[Register_3_] = this.textIndent;
														} else {
															if (Register_3_ == "underline" && this.textDecoration != undefined){
																tf[Register_3_] = this.textDecoration == Register_3_;
															} else {
																if (Register_3_ == "embedFonts" && this.embedFonts != undefined){
																	tf[Register_3_] = this.embedFonts;
																} else {
																	Register_6_ = true;
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		if (Register_6_){
			var Register_9_ = this.styleName;
			if (Register_9_ != undefined){
				if (typeof(Register_9_) != "string"){
					Register_6_ = Register_9_.__getTextFormat(tf, true, this);
				} else if (_global.styles[Register_9_] != undefined){
					Register_6_ = _global.styles[Register_9_].__getTextFormat(tf, true, this);
				}
			}
		}
		if (Register_6_){
			var Register_A_ = this.getClassStyleDeclaration();
			if (Register_A_ != undefined){
				Register_6_ = Register_A_.__getTextFormat(tf, true, this);
			}
		}
		if (Register_6_){
			if (_global.cascadingStyles){
				if (this._parent != undefined){
					Register_6_ = this._parent.__getTextFormat(tf, false);
				}
			}
		}
		if (Register_6_){
			Register_6_ = _global.style.__getTextFormat(tf, true, this);
		}
		return Register_6_;
	}
	function _getTextFormat(Void) {
		var Register_2_ = this.stylecache.tf;
		if (Register_2_ != undefined){
			return Register_2_;
		}
		Register_2_ = new TextFormat();
		this.__getTextFormat(Register_2_, true);
		this.stylecache.tf = Register_2_;
		if (this.enabled == false){
			var Register_3_ = this.getStyle("disabledColor");
			Register_2_.color = Register_3_;
		}
		return Register_2_;
	}
	function getStyleName(Void) {
		var Register_2_ = this.styleName;
		if (Register_2_ != undefined){
			if (typeof(Register_2_) != "string"){
				return Register_2_.getStyleName();
			} else {
				return Register_2_;
			}
		}
		if (this._parent != undefined){
			return this._parent.getStyleName();
		} else {
			return undefined;
		}
	}
	function getStyle(styleProp) {
		var Register_3_ = undefined;
		_global.getStyleCounter++;
		if (this[styleProp] != undefined){
			return this[styleProp];
		}
		var Register_6_ = this.styleName;
		if (Register_6_ != undefined){
			if (typeof(Register_6_) != "string"){
				Register_3_ = Register_6_.getStyle(styleProp);
			} else {
				var Register_7_ = _global.styles[Register_6_];
				Register_3_ = Register_7_.getStyle(styleProp);
			}
		}
		if (Register_3_ != undefined){
			return Register_3_;
		}
		var Register_7_ = this.getClassStyleDeclaration();
		if (Register_7_ != undefined){
			Register_3_ = Register_7_[styleProp];
		}
		if (Register_3_ != undefined){
			return Register_3_;
		}
		if (_global.cascadingStyles){
			if (mx.styles.StyleManager.isInheritingStyle(styleProp) || mx.styles.StyleManager.isColorStyle(styleProp)){
				var Register_5_ = this.stylecache;
				if (Register_5_ != undefined){
					if (Register_5_[styleProp] != undefined){
						return Register_5_[styleProp];
					}
				}
				if (this._parent != undefined){
					Register_3_ = this._parent.getStyle(styleProp);
				} else {
					Register_3_ = _global.style[styleProp];
				}
				if (Register_5_ != undefined){
					Register_5_[styleProp] = Register_3_;
				}
				return Register_3_;
			}
		}
		if (Register_3_ == undefined){
			Register_3_ = _global.style[styleProp];
		}
		return Register_3_;
	}
	static function mergeClipParameters(o, p) {
		for (var Register_3_ in p) {
			o[Register_3_] = p[Register_3_];
		}
		return true;
	}
	static var symbolName = "UIObject";
	static var symbolOwner = mx.core.UIObject;
	static var version = "2.0.0.360";
	static var textColorList = {color:1, disabledColor:1};
	var invalidateFlag = false;
	var lineWidth = 1;
	var lineColor = 0;
	var tabEnabled = false;
	var clipParameters = {visible:1, minHeight:1, minWidth:1, maxHeight:1, maxWidth:1, preferredHeight:1, preferredWidth:1};
}
