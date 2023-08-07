dynamic class mx.skins.halo.FocusRect extends mx.skins.SkinElement
{
	var boundingBox_mc, _yscale, _xscale, clear, beginFill, drawRoundRect, endFill, _visible;
	function FocusRect() {
		super();
		this.boundingBox_mc._visible = false;
		this.boundingBox_mc._width = this.boundingBox_mc._height = 0;
	}
	function draw(o) {
		o.adjustFocusRect();
	}
	function setSize(w, h, r, a, rectCol) {
		this._xscale = this._yscale = 100;
		this.clear();
		if (typeof(r) == "object"){
			r.br = r.br > 2 ? (r.br - 2) : 0;
			r.bl = r.bl > 2 ? (r.bl - 2) : 0;
			r.tr = r.tr > 2 ? (r.tr - 2) : 0;
			r.tl = r.tl > 2 ? (r.tl - 2) : 0;
			this.beginFill(rectCol, a * 0.3);
			this.drawRoundRect(0, 0, w, h, r);
			this.drawRoundRect(2, 2, (w - 4), (h - 4), r);
			this.endFill();
			r.br = r.br > 1 ? (r.br + 1) : 0;
			r.bl = r.bl > 1 ? (r.bl + 1) : 0;
			r.tr = r.tr > 1 ? (r.tr + 1) : 0;
			r.tl = r.tl > 1 ? (r.tl + 1) : 0;
			this.beginFill(rectCol, a * 0.3);
			this.drawRoundRect(1, 1, (w - 2), (h - 2), r);
			r.br = r.br > 1 ? (r.br - 1) : 0;
			r.bl = r.bl > 1 ? (r.bl - 1) : 0;
			r.tr = r.tr > 1 ? (r.tr - 1) : 0;
			r.tl = r.tl > 1 ? (r.tl - 1) : 0;
			this.drawRoundRect(2, 2, (w - 4), (h - 4), r);
			this.endFill();
		} else {
			var Register_5_ = undefined;
			if (r != 0){
				Register_5_ = (r - 2);
			} else {
				Register_5_ = 0;
			}
			this.beginFill(rectCol, a * 0.3);
			this.drawRoundRect(0, 0, w, h, r);
			this.drawRoundRect(2, 2, (w - 4), (h - 4), Register_5_);
			this.endFill();
			this.beginFill(rectCol, a * 0.3);
			if (r != 0){
				Register_5_ = (r - 2);
				r = (r - 1);
			} else {
				Register_5_ = 0;
				r = 0;
			}
			this.drawRoundRect(1, 1, (w - 2), (h - 2), r);
			this.drawRoundRect(2, 2, (w - 4), (h - 4), Register_5_);
			this.endFill();
		}
	}
	function handleEvent(e) {
		if (e.type == "unload"){
			this._visible = true;
		} else if (e.type == "resize"){
			e.target.adjustFocusRect();
		} else if (e.type == "move"){
			e.target.adjustFocusRect();
		}
	}
	static function classConstruct() {
		mx.core.UIComponent.prototype.drawFocus = function (focused) {
			var Register_2_ = this._parent.focus_mc;
			if (!focused){
				Register_2_._visible = false;
				this.removeEventListener("unload", Register_2_);
				this.removeEventListener("move", Register_2_);
				this.removeEventListener("resize", Register_2_);
			} else {
				if (Register_2_ == undefined){
					Register_2_ = this._parent.createChildAtDepth("FocusRect", mx.managers.DepthManager.kTop);
					Register_2_.tabEnabled = false;
					this._parent.focus_mc = Register_2_;
				} else {
					Register_2_._visible = true;
				}
				Register_2_.draw(this);
				if (Register_2_.getDepth() < this.getDepth()){
					Register_2_.setDepthAbove(this);
				}
				this.addEventListener("unload", Register_2_);
				this.addEventListener("move", Register_2_);
				this.addEventListener("resize", Register_2_);
			}
		}
		mx.core.UIComponent.prototype.adjustFocusRect = function () {
			var Register_2_ = this.getStyle("themeColor");
			if (Register_2_ == undefined){
				Register_2_ = 8453965;
			}
			var Register_3_ = this._parent.focus_mc;
			Register_3_.setSize((this.width + 4), (this.height + 4), 0, 100, Register_2_);
			Register_3_.move((this.x - 2), (this.y - 2));
		}
		TextField.prototype.drawFocus = mx.core.UIComponent.prototype.drawFocus;
		TextField.prototype.adjustFocusRect = mx.core.UIComponent.prototype.adjustFocusRect;
		FocusRect.prototype.drawRoundRect = mx.skins.halo.Defaults.prototype.drawRoundRect;
		return true;
	}
	static var classConstructed = FocusRect.classConstruct();
	static var DefaultsDependency = mx.skins.halo.Defaults;
	static var UIComponentDependency = mx.core.UIComponent;
}
