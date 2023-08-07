dynamic class mx.styles.CSSStyleDeclaration
{
	var _tf;
	function CSSStyleDeclaration() {
	}
	function __getTextFormat(tf, bAll) {
		var Register_5_ = false;
		if (this._tf != undefined){
			var Register_2_ = undefined;
			for (Register_2_ in mx.styles.StyleManager.TextFormatStyleProps) {
				if (bAll || mx.styles.StyleManager.TextFormatStyleProps[Register_2_]){
					if (tf[Register_2_] == undefined){
						var Register_3_ = this._tf[Register_2_];
						if (Register_3_ != undefined){
							tf[Register_2_] = Register_3_;
						} else {
							Register_5_ = true;
						}
					}
				}
			}
		} else {
			Register_5_ = true;
		}
		return Register_5_;
	}
	function getStyle(styleProp) {
		var Register_2_ = this[styleProp];
		var Register_3_ = mx.styles.StyleManager.getColorName(Register_2_);
		return Register_3_ == undefined ? Register_2_ : Register_3_;
	}
	static function classConstruct() {
		mx.styles.CSSTextStyles.addTextStyles(CSSStyleDeclaration.prototype, true);
		return true;
	}
	static var classConstructed = CSSStyleDeclaration.classConstruct();
	static var CSSTextStylesDependency = mx.styles.CSSTextStyles;
}
