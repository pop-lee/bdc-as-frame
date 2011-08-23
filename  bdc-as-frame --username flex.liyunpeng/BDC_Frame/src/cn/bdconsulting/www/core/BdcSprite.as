package cn.bdconsulting.www.core
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.errors.IllegalOperationError;
	import flash.geom.Rectangle;
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	
	/**
	 * @author LiYunpeng
	 */	
	public class BdcSprite extends Sprite
	{
		private var rect : Rectangle = new Rectangle();
		
		private var _scaleX : Number = 1;
		
		private var _scaleY : Number = 1;
		
		private var _parentWidth : Number = 0;
		
		private var _parentHeight : Number = 0;
		
		private var _width : Number = 0;
		
		private var _height : Number = 0;
		
		private var _percentWidth : Number = 0;
		
		private var _percentHeight : Number = 0;
		
		private var _isPercentWidth : Boolean = false;
		private var _isPercentHeight : Boolean = false;
		
		private var _backgroundColor : uint = 0xffffff;
		
		private var _backgroundImage : BitmapData;
		
		private var _useBackGroundImage : Boolean = false;
		
		private var _backgroundAlpha : Number = 1;
		
		public function BdcSprite()
		{
			super();
		}
		
		private function init() : void
		{
		}
		
		public function set parentWidth(value : Number) : void
		{
			_parentWidth = value;
			if(_isPercentWidth) {
				width = _parentWidth * _percentWidth / 100;
				_isPercentWidth = true;
			}
			updateDisplayList(_width,_height);
		}
		public function set parentHeight(value : Number) : void
		{
			_parentHeight = value;
			if(_isPercentHeight) {
				height = _parentHeight * _percentHeight /100;
				_isPercentHeight = true;
			}
			updateDisplayList(_width,_height);
		}
		
		override public function set width(value : Number) : void
		{
			_width = value;
			_isPercentWidth = false;
			updateDisplayList(_width,_height);
		}
		override public function set height(value : Number) : void
		{
			_height = value;
			_isPercentHeight = false;
			updateDisplayList(_width,_height);
		}
		
		public function set percentWidth(value : Number) : void
		{
			_percentWidth = value;
			width = _parentWidth * _percentWidth / 100;
			_isPercentWidth = true;
			updateDisplayList(_width,_height);
		}
		public function set percentHeight(value : Number) : void
		{
			_percentHeight =value;
			height = _parentHeight * _percentHeight / 100;
			_isPercentHeight = true;
			updateDisplayList(_width,_height);
		}
		
		public function set backgroundColor(value : uint) : void
		{
			_backgroundColor = value;
			_useBackGroundImage = false;
			updateDisplayList(_width,_height);
		}
		
		public function set backgroundAlpha(value : Number) : void
		{
			_backgroundAlpha = value;
			updateDisplayList(_width,_height);
		}
		
		public function set backgroundImage(bitmap : BitmapData) : void
		{
			_backgroundImage = bitmap;
			_useBackGroundImage = true;
		}
		
		override public function get width() : Number
		{
			return _width;
		}
		override public function get height() : Number
		{
			return _height;
		}
		
		public function set top(value : Number) : void
		{
			this.y = value;
		}
		public function set bottom(value : Number) : void
		{
			this.y = this.parent.height - value;
		}
		public function set left(value : Number) : void
		{
			this.x = value;
		}
		public function set right(value : Number) : void
		{
			this.x = this.parent.width - value;
		}
		
		/**
		 * 为统一管理事件，统一在此处添加事件
		 */
		private function addEvent():void
		{
		}
		
		/**
		 * 为统一管理事件，统一在此处删除事件
		 */
		private function removeEvent():void
		{
		}
		
		/**
		 * 当页面发生变化的时候，以此方法来操作
		 */
		public function updateDisplayList(unscaledWidth:Number,
										  unscaledHeight:Number) : void
		{
			this.scaleX = _scaleX;
			this.scaleY = _scaleY;
			
			drawBackground(unscaledWidth,unscaledHeight);
		}
		
		private function drawBackground(unscaledWidth:Number,
										unscaledHeight:Number) : void
		{
			this.graphics.clear();
			this.graphics.beginFill(_backgroundColor,_backgroundAlpha);
			this.graphics.drawRect(0,0,unscaledWidth,unscaledHeight);
			this.graphics.endFill();
		}
		
		private function drawBackgroundImage(bitmap : BitmapData) : void
		{
			this.graphics.clear();
			this.graphics.beginBitmapFill(bitmap);
			this.graphics.drawRect(0,0,bitmap.width,bitmap.height);
			this.graphics.endFill();
		}
	}
}