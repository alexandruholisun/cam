dynamic class mx.core.ext.UIObjectExtensions
{
	function UIObjectExtensions() {
	}
	static function addGeometry(tf, ui) {
		tf.addProperty("width", ui.__get__width, null);
		tf.addProperty("height", ui.__get__height, null);
		tf.addProperty("left", ui.__get__left, null);
		tf.addProperty("x", ui.__get__x, null);
		tf.addProperty("top", ui.__get__top, null);
		tf.addProperty("y", ui.__get__y, null);
		tf.addProperty("right", ui.__get__right, null);
		tf.addProperty("bottom", ui.__get__bottom, null);
		tf.addProperty("visible", ui.__get__visible, ui.__set__visible);
	}
	static function Extensions() {
		if (bExtended == true){
			return true;
		}
		bExtended = true;
		var Register_4_ = mx.core.UIObject.prototype;
		var Register_8_ = mx.skins.SkinElement.prototype;
		UIObjectExtensions.addGeometry(Register_8_, Register_4_);
		mx.events.UIEventDispatcher.initialize(Register_4_);
		var Register_C_ = mx.skins.ColoredSkinElement;
		mx.styles.CSSTextStyles.addTextStyles(Register_4_);
		var Register_5_ = MovieClip.prototype;
		Register_5_.getTopLevel = Register_4_.getTopLevel;
		Register_5_.createLabel = Register_4_.createLabel;
		Register_5_.createObject = Register_4_.createObject;
		Register_5_.createClassObject = Register_4_.createClassObject;
		Register_5_.createEmptyObject = Register_4_.createEmptyObject;
		Register_5_.destroyObject = Register_4_.destroyObject;
		Register_5_.__getTextFormat = Register_4_.__getTextFormat;
		Register_5_._getTextFormat = Register_4_._getTextFormat;
		Register_5_.getStyleName = Register_4_.getStyleName;
		Register_5_.getStyle = Register_4_.getStyle;
		var Register_6_ = TextField.prototype;
		UIObjectExtensions.addGeometry(Register_6_, Register_4_);
		Register_6_.addProperty("enabled", function () {return this.__enabled;}, function (x) {this.__enabled = x;this.invalidateStyle();});
		Register_6_.move = Register_8_.move;
		Register_6_.setSize = Register_8_.setSize;
		Register_6_.invalidateStyle = function () {
			this.invalidateFlag = true;
		}
		Register_6_.draw = function () {
			if (this.invalidateFlag){
				this.invalidateFlag = false;
				var Register_2_ = this._getTextFormat();
				this.setTextFormat(Register_2_);
				this.setNewTextFormat(Register_2_);
				this.embedFonts = Register_2_.embedFonts == true;
				if (this.__text != undefined){
					if (this.text == ""){
						this.text = this.__text;
					}
					delete this.__text;
				}
				this._visible = true;
			}
		}
		Register_6_.setColor = function (color) {
			this.textColor = color;
		}
		Register_6_.getStyle = Register_5_.getStyle;
		Register_6_.__getTextFormat = Register_4_.__getTextFormat;
		Register_6_.setValue = function (v) {
			this.text = v;
		}
		Register_6_.getValue = function () {
			return this.text;
		}
		Register_6_.addProperty("value", function () {return this.getValue();}, function (v) {this.setValue(v);});
		Register_6_._getTextFormat = function () {
			var Register_2_ = this.stylecache.tf;
			if (Register_2_ != undefined){
				return Register_2_;
			}
			Register_2_ = new TextFormat();
			this.__getTextFormat(Register_2_);
			this.stylecache.tf = Register_2_;
			if (this.__enabled == false){
				if (this.enabledColor == undefined){
					var Register_4_ = this.getTextFormat();
					this.enabledColor = Register_4_.color;
				}
				var Register_3_ = this.getStyle("disabledColor");
				Register_2_.color = Register_3_;
			} else if (this.enabledColor != undefined){
				if (Register_2_.color == undefined){
					Register_2_.color = this.enabledColor;
				}
			}
			return Register_2_;
		}
		Register_6_.getPreferredWidth = function () {
			this.draw();
			return (this.textWidth + 4);
		}
		Register_6_.getPreferredHeight = function () {
			this.draw();
			return (this.textHeight + 4);
		}
		TextFormat.prototype.getTextExtent2 = function (s) {
			var Register_3_ = _root._getTextExtent;
			if (Register_3_ == undefined){
				_root.createTextField("_getTextExtent", -2, 0, 0, 1000, 100);
				Register_3_ = _root._getTextExtent;
				Register_3_._visible = false;
			}
			_root._getTextExtent.text = s;
			var Register_4_ = this.align;
			this.align = "left";
			_root._getTextExtent.setTextFormat(this);
			this.align = Register_4_;
			return {width:Register_3_.textWidth, height:Register_3_.textHeight};
		}
		if (_global.style == undefined){
			_global.style = new mx.styles.CSSStyleDeclaration();
			_global.cascadingStyles = true;
			_global.styles = new Object();
			_global.skinRegistry = new Object();
			_global.origWidth = Stage.width;
			_global.origHeight = Stage.height;
		}
		_root.addProperty("width", function () {return Stage.width;}, null);
		_root.addProperty("height", function () {return Stage.height;}, null);
		return true;
	}
	static var bExtended = false;
	static var UIObjectExtended = UIObjectExtensions.Extensions();
	static var UIObjectDependency = mx.core.UIObject;
	static var SkinElementDependency = mx.skins.SkinElement;
	static var CSSTextStylesDependency = mx.styles.CSSTextStyles;
	static var UIEventDispatcherDependency = mx.events.UIEventDispatcher;
}
