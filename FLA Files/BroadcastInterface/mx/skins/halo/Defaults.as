dynamic class mx.skins.halo.Defaults
{
	var beginGradientFill, beginFill, moveTo, lineTo, curveTo, endFill;
	function Defaults() {
	}
	static function setThemeDefaults() {
		var Register_2_ = _global.style;
		Register_2_.themeColor = 8453965;
		Register_2_.disabledColor = 8684164;
		Register_2_.modalTransparency = 0;
		Register_2_.filled = true;
		Register_2_.stroked = true;
		Register_2_.strokeWidth = 1;
		Register_2_.strokeColor = 0;
		Register_2_.fillColor = 16777215;
		Register_2_.repeatInterval = 35;
		Register_2_.repeatDelay = 500;
		Register_2_.fontFamily = "_sans";
		Register_2_.fontSize = 12;
		Register_2_.selectionColor = 13500353;
		Register_2_.rollOverColor = 14942166;
		Register_2_.useRollOver = true;
		Register_2_.backgroundDisabledColor = 14540253;
		Register_2_.selectionDisabledColor = 14540253;
		Register_2_.selectionDuration = 200;
		Register_2_.openDuration = 250;
		Register_2_.borderStyle = "inset";
		Register_2_.color = 734012;
		Register_2_.textSelectedColor = 24371;
		Register_2_.textRollOverColor = 2831164;
		Register_2_.textDisabledColor = 16777215;
		Register_2_.vGridLines = true;
		Register_2_.hGridLines = false;
		Register_2_.vGridLineColor = 6710886;
		Register_2_.hGridLineColor = 6710886;
		Register_2_.headerColor = 15395562;
		Register_2_.indentation = 17;
		Register_2_.folderOpenIcon = "TreeFolderOpen";
		Register_2_.folderClosedIcon = "TreeFolderClosed";
		Register_2_.defaultLeafIcon = "TreeNodeIcon";
		Register_2_.disclosureOpenIcon = "TreeDisclosureOpen";
		Register_2_.disclosureClosedIcon = "TreeDisclosureClosed";
		Register_2_.popupDuration = 150;
		Register_2_.todayColor = 6710886;
		Register_2_ = (_global.styles.ScrollSelectList = new mx.styles.CSSStyleDeclaration());
		Register_2_.backgroundColor = 16777215;
		Register_2_.borderColor = 13290186;
		Register_2_.borderStyle = "inset";
		Register_2_ = (_global.styles.ComboBox = new mx.styles.CSSStyleDeclaration());
		Register_2_.borderStyle = "inset";
		Register_2_ = (_global.styles.NumericStepper = new mx.styles.CSSStyleDeclaration());
		Register_2_.textAlign = "center";
		Register_2_ = (_global.styles.RectBorder = new mx.styles.CSSStyleDeclaration());
		Register_2_.borderColor = 14015965;
		Register_2_.buttonColor = 7305079;
		Register_2_.shadowColor = 15658734;
		Register_2_.highlightColor = 12897484;
		Register_2_.shadowCapColor = 14015965;
		Register_2_.borderCapColor = 9542041;
		var Register_4_ = new Object();
		Register_4_.borderColor = 16711680;
		Register_4_.buttonColor = 16711680;
		Register_4_.shadowColor = 16711680;
		Register_4_.highlightColor = 16711680;
		Register_4_.shadowCapColor = 16711680;
		Register_4_.borderCapColor = 16711680;
		mx.core.UIComponent.prototype.origBorderStyles = Register_4_;
		var Register_3_ = undefined;
		Register_3_ = (_global.styles.TextInput = new mx.styles.CSSStyleDeclaration());
		Register_3_.backgroundColor = 16777215;
		Register_3_.borderStyle = "inset";
		_global.styles.TextArea = _global.styles.TextInput;
		Register_3_ = (_global.styles.Window = new mx.styles.CSSStyleDeclaration());
		Register_3_.borderStyle = "default";
		Register_3_ = (_global.styles.windowStyles = new mx.styles.CSSStyleDeclaration());
		Register_3_.fontWeight = "bold";
		Register_3_ = (_global.styles.dataGridStyles = new mx.styles.CSSStyleDeclaration());
		Register_3_.fontWeight = "bold";
		Register_3_ = (_global.styles.Alert = new mx.styles.CSSStyleDeclaration());
		Register_3_.borderStyle = "alert";
		Register_3_ = (_global.styles.ScrollView = new mx.styles.CSSStyleDeclaration());
		Register_3_.borderStyle = "inset";
		Register_3_ = (_global.styles.View = new mx.styles.CSSStyleDeclaration());
		Register_3_.borderStyle = "none";
		Register_3_ = (_global.styles.ProgressBar = new mx.styles.CSSStyleDeclaration());
		Register_3_.color = 11187123;
		Register_3_.fontWeight = "bold";
		Register_3_ = (_global.styles.AccordionHeader = new mx.styles.CSSStyleDeclaration());
		Register_3_.fontWeight = "bold";
		Register_3_.fontSize = "11";
		Register_3_ = (_global.styles.Accordion = new mx.styles.CSSStyleDeclaration());
		Register_3_.borderStyle = "solid";
		Register_3_.backgroundColor = 16777215;
		Register_3_.borderColor = 9081738;
		Register_3_.headerHeight = 22;
		Register_3_.marginLeft = Register_3_.marginRight = Register_3_.marginTop = Register_3_.marginBottom = -1;
		Register_3_.verticalGap = -1;
		Register_3_ = (_global.styles.DateChooser = new mx.styles.CSSStyleDeclaration());
		Register_3_.borderColor = 9542041;
		Register_3_.headerColor = 16777215;
		Register_3_ = (_global.styles.CalendarLayout = new mx.styles.CSSStyleDeclaration());
		Register_3_.fontSize = 10;
		Register_3_.textAlign = "right";
		Register_3_.color = 2831164;
		Register_3_ = (_global.styles.WeekDayStyle = new mx.styles.CSSStyleDeclaration());
		Register_3_.fontWeight = "bold";
		Register_3_.fontSize = 11;
		Register_3_.textAlign = "center";
		Register_3_.color = 2831164;
		Register_3_ = (_global.styles.TodayStyle = new mx.styles.CSSStyleDeclaration());
		Register_3_.color = 16777215;
		Register_3_ = (_global.styles.HeaderDateText = new mx.styles.CSSStyleDeclaration());
		Register_3_.fontSize = 12;
		Register_3_.fontWeight = "bold";
		Register_3_.textAlign = "center";
	}
	function drawRoundRect(x, y, w, h, r, c, alpha, rot, gradient, ratios) {
		if (typeof(r) == "object"){
			var Register_I_ = r.br;
			var Register_G_ = r.bl;
			var Register_F_ = r.tl;
			var Register_A_ = r.tr;
		} else {
			Register_I_ = Register_G_ = Register_F_ = Register_A_ = r;
		}
		if (typeof(c) == "object"){
			if (typeof(alpha) != "object"){
				var Register_9_ = [alpha, alpha];
			} else {
				Register_9_ = alpha;
			}
			if (ratios == undefined){
				ratios = [0, 255];
			}
			var Register_E_ = h * 0.7;
			if (typeof(rot) != "object"){
				var Register_B_ = {matrixType:"box", x:-Register_E_, y:Register_E_, w:w * 2, h:h * 4, r:rot * 0.017453292519943299};
			} else {
				Register_B_ = rot;
			}
			if (gradient == "radial"){
				this.beginGradientFill("radial", c, Register_9_, ratios, Register_B_);
			} else {
				this.beginGradientFill("linear", c, Register_9_, ratios, Register_B_);
			}
		} else if (c != undefined){
			this.beginFill(c, alpha);
		}
		r = Register_I_;
		var Register_D_ = (r - r * 0.70710678118654702);
		var Register_C_ = (r - r * 0.41421356237309498);
		this.moveTo((x + w), ((y + h) - r));
		this.lineTo((x + w), ((y + h) - r));
		this.curveTo((x + w), ((y + h) - Register_C_), ((x + w) - Register_D_), ((y + h) - Register_D_));
		this.curveTo(((x + w) - Register_C_), (y + h), ((x + w) - r), (y + h));
		r = Register_G_;
		Register_D_ = (r - r * 0.70710678118654702);
		Register_C_ = (r - r * 0.41421356237309498);
		this.lineTo((x + r), (y + h));
		this.curveTo((x + Register_C_), (y + h), (x + Register_D_), ((y + h) - Register_D_));
		this.curveTo(x, ((y + h) - Register_C_), x, ((y + h) - r));
		r = Register_F_;
		Register_D_ = (r - r * 0.70710678118654702);
		Register_C_ = (r - r * 0.41421356237309498);
		this.lineTo(x, (y + r));
		this.curveTo(x, (y + Register_C_), (x + Register_D_), (y + Register_D_));
		this.curveTo((x + Register_C_), y, (x + r), y);
		r = Register_A_;
		Register_D_ = (r - r * 0.70710678118654702);
		Register_C_ = (r - r * 0.41421356237309498);
		this.lineTo(((x + w) - r), y);
		this.curveTo(((x + w) - Register_C_), y, ((x + w) - Register_D_), (y + Register_D_));
		this.curveTo((x + w), (y + Register_C_), (x + w), (y + r));
		this.lineTo((x + w), ((y + h) - r));
		if (c != undefined){
			this.endFill();
		}
	}
	static function classConstruct() {
		mx.core.ext.UIObjectExtensions.Extensions();
		Defaults.setThemeDefaults();
		mx.core.UIObject.prototype.drawRoundRect = Defaults.prototype.drawRoundRect;
		return true;
	}
	static var classConstructed = Defaults.classConstruct();
	static var CSSStyleDeclarationDependency = mx.styles.CSSStyleDeclaration;
	static var UIObjectExtensionsDependency = mx.core.ext.UIObjectExtensions;
	static var UIObjectDependency = mx.core.UIObject;
}
