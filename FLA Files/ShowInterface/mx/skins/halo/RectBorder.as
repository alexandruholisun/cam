dynamic class mx.skins.halo.RectBorder extends mx.skins.RectBorder
{
	var offset, borderStyleName, getStyle, __borderMetrics, className, borderColorName, backgroundColorName, shadowColorName, highlightColorName, buttonColorName, clear, _color, drawRoundRect, beginFill, drawRect, endFill;
	function RectBorder() {
		super();
	}
	function init(Void) {
		this.borderWidths["default"] = 3;
		super.init();
	}
	function getBorderMetrics(Void) {
		if (this.offset == undefined){
			var Register_3_ = this.getStyle(this.borderStyleName);
			this.offset = this.borderWidths[Register_3_];
		}
		if (this.getStyle(this.borderStyleName) == "default" || this.getStyle(this.borderStyleName) == "alert"){
			this.__borderMetrics = {left:3, top:1, right:3, bottom:3};
			return this.__borderMetrics;
		}
		return super.getBorderMetrics();
	}
	function drawBorder(Void) {
		var Register_6_ = _global.styles[this.className];
		if (Register_6_ == undefined){
			Register_6_ = _global.styles.RectBorder;
		}
		var Register_5_ = this.getStyle(this.borderStyleName);
		var Register_7_ = this.getStyle(this.borderColorName);
		if (Register_7_ == undefined){
			Register_7_ = Register_6_[this.borderColorName];
		}
		var Register_8_ = this.getStyle(this.backgroundColorName);
		if (Register_8_ == undefined){
			Register_8_ = Register_6_[this.backgroundColorName];
		}
		var Register_G_ = this.getStyle("backgroundImage");
		if (Register_5_ != "none"){
			var Register_E_ = this.getStyle(this.shadowColorName);
			if (Register_E_ == undefined){
				Register_E_ = Register_6_[this.shadowColorName];
			}
			var Register_D_ = this.getStyle(this.highlightColorName);
			if (Register_D_ == undefined){
				Register_D_ = Register_6_[this.highlightColorName];
			}
			var Register_C_ = this.getStyle(this.buttonColorName);
			if (Register_C_ == undefined){
				Register_C_ = Register_6_[this.buttonColorName];
			}
			var Register_B_ = this.getStyle(this.borderCapColorName);
			if (Register_B_ == undefined){
				Register_B_ = Register_6_[this.borderCapColorName];
			}
			var Register_A_ = this.getStyle(this.shadowCapColorName);
			if (Register_A_ == undefined){
				Register_A_ = Register_6_[this.shadowCapColorName];
			}
		}
		this.offset = this.borderWidths[Register_5_];
		var Register_9_ = this.offset;
		var Register_3_ = this.width;
		var Register_4_ = this.height;
		this.clear();
		this._color = undefined;
		if (Register_5_ == "none"){
		} else if (Register_5_ == "inset"){
			this._color = this.colorList;
			this.draw3dBorder(Register_B_, Register_C_, Register_7_, Register_D_, Register_E_, Register_A_);
		} else if (Register_5_ == "outset"){
			this._color = this.colorList;
			this.draw3dBorder(Register_B_, Register_7_, Register_C_, Register_E_, Register_D_, Register_A_);
		} else if (Register_5_ == "alert"){
			var Register_F_ = this.getStyle("themeColor");
			this.drawRoundRect(0, 5, Register_3_, (Register_4_ - 5), 5, 6184542, 10);
			this.drawRoundRect(1, 4, (Register_3_ - 2), (Register_4_ - 5), 4, [6184542, 6184542], 10, 0, "radial");
			this.drawRoundRect(2, 0, (Register_3_ - 4), (Register_4_ - 2), 3, [0, 14342874], 100, 0, "radial");
			this.drawRoundRect(2, 0, (Register_3_ - 4), (Register_4_ - 2), 3, Register_F_, 50);
			this.drawRoundRect(3, 1, (Register_3_ - 6), (Register_4_ - 4), 2, 16777215, 100);
		} else if (Register_5_ == "default"){
			this.drawRoundRect(0, 5, Register_3_, (Register_4_ - 5), {tl:5, tr:5, br:0, bl:0}, 6184542, 10);
			this.drawRoundRect(1, 4, (Register_3_ - 2), (Register_4_ - 5), {tl:4, tr:4, br:0, bl:0}, [6184542, 6184542], 10, 0, "radial");
			this.drawRoundRect(2, 0, (Register_3_ - 4), (Register_4_ - 2), {tl:3, tr:3, br:0, bl:0}, [12897484, 11844796], 100, 0, "radial");
			this.drawRoundRect(3, 1, (Register_3_ - 6), (Register_4_ - 4), {tl:2, tr:2, br:0, bl:0}, 16777215, 100);
		} else if (Register_5_ == "dropDown"){
			this.drawRoundRect(0, 0, (Register_3_ + 1), Register_4_, {tl:4, tr:0, br:0, bl:4}, [13290186, 7895160], 100, -10, "linear");
			this.drawRoundRect(1, 1, (Register_3_ - 1), (Register_4_ - 2), {tl:3, tr:0, br:0, bl:3}, 16777215, 100);
		} else if (Register_5_ == "menuBorder"){
			Register_F_ = this.getStyle("themeColor");
			this.drawRoundRect(4, 4, (Register_3_ - 2), (Register_4_ - 3), 0, [6184542, 6184542], 10, 0, "radial");
			this.drawRoundRect(4, 4, (Register_3_ - 1), (Register_4_ - 2), 0, 6184542, 10);
			this.drawRoundRect(0, 0, (Register_3_ + 1), Register_4_, 0, [0, 14342874], 100, 250, "linear");
			this.drawRoundRect(0, 0, (Register_3_ + 1), Register_4_, 0, Register_F_, 50);
			this.drawRoundRect(2, 2, (Register_3_ - 3), (Register_4_ - 4), 0, 16777215, 100);
		} else if (Register_5_ == "comboNonEdit"){
		} else {
			this.beginFill(Register_7_);
			this.drawRect(0, 0, Register_3_, Register_4_);
			this.drawRect(1, 1, (Register_3_ - 1), (Register_4_ - 1));
			this.endFill();
			this._color = this.borderColorName;
		}
		if (Register_8_ != undefined){
			this.beginFill(Register_8_);
			this.drawRect(Register_9_, Register_9_, (this.width - Register_9_), (this.height - Register_9_));
			this.endFill();
		}
	}
	function draw3dBorder(c1, c2, c3, c4, c5, c6) {
		var Register_3_ = this.width;
		var Register_2_ = this.height;
		this.beginFill(c1);
		this.drawRect(0, 0, Register_3_, Register_2_);
		this.drawRect(1, 0, (Register_3_ - 1), Register_2_);
		this.endFill();
		this.beginFill(c2);
		this.drawRect(1, 0, (Register_3_ - 1), 1);
		this.endFill();
		this.beginFill(c3);
		this.drawRect(1, (Register_2_ - 1), (Register_3_ - 1), Register_2_);
		this.endFill();
		this.beginFill(c4);
		this.drawRect(1, 1, (Register_3_ - 1), 2);
		this.endFill();
		this.beginFill(c5);
		this.drawRect(1, (Register_2_ - 2), (Register_3_ - 1), (Register_2_ - 1));
		this.endFill();
		this.beginFill(c6);
		this.drawRect(1, 2, (Register_3_ - 1), (Register_2_ - 2));
		this.drawRect(2, 2, (Register_3_ - 2), (Register_2_ - 2));
		this.endFill();
	}
	static function classConstruct() {
		mx.core.ext.UIObjectExtensions.Extensions();
		_global.styles.rectBorderClass = RectBorder;
		_global.skinRegistry.RectBorder = true;
		return true;
	}
	static var symbolName = "RectBorder";
	static var symbolOwner = mx.skins.halo.RectBorder;
	static var version = "2.0.0.360";
	var borderCapColorName = "borderCapColor";
	var shadowCapColorName = "shadowCapColor";
	var colorList = {highlightColor:0, borderColor:0, buttonColor:0, shadowColor:0, borderCapColor:0, shadowCapColor:0};
	var borderWidths = {none:0, solid:1, inset:2, outset:2, alert:3, dropDown:2, menuBorder:2, comboNonEdit:2};
	static var classConstructed = RectBorder.classConstruct();
	static var UIObjectExtensionsDependency = mx.core.ext.UIObjectExtensions;
}
