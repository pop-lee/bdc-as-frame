package cn.bdconsulting.www.view
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.errors.IOError;
	import flash.errors.IllegalOperationError;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.system.System;
	import flash.text.TextField;
	import flash.utils.describeType;
	
	/**
	 * @author LiYunpeng
	 */	
	public class BdcSprite extends Sprite
	{
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
		
//		private var _backgroundImageLoader : Loader = new Loader();
		
		private var _backgroundImageResource : Class;
		
		private var _useBackGroundImage : Boolean = false;
		
		private var _backgroundAlpha : Number = 1;
		
//		private var _backgroundMovieClip : MovieClip = new MovieClip();
		
		public function BdcSprite()
		{
			super();
			init();
		}
		
		private function init() : void
		{
//			_backgroundImageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadBackgroundImage);
//			super.addChild(_backgroundMovieClip);
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
		
		public function set backgroundImage(value : *) : void
		{
//			if(value is String) {
//				_backgroundImageLoader.load(new URLRequest(value));
//			} else if(value is Bitmap) {
//				backgroundBitmap(value);
//			}
//			else if(value is MovieClip) {
//				_backgroundMovieClip = value;
//				(value as MovieClip).
//			}
			if(value is Class) {
				backgroundBitmap(value);
			}
		}
		
//		public function get backgroundImage() : Bitmap
//		{
//			return _backgroundImage;
//		}
		
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
			
			if(_useBackGroundImage)
				drawBackgroundImage(getImage().bitmapData);
			else
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
		
		public function drawBackgroundImage(bitmapData : BitmapData) : void
		{
			this.graphics.clear();
			this.graphics.beginBitmapFill(bitmapData);
			this.graphics.drawRect(0,0,bitmapData.width,bitmapData.height);
			this.graphics.endFill();
			
			System.gc();
//			bitmapData.dispose();
		}
		
//		private function loadBackgroundImage(event : Event) : void
//		{
//			backgroundBitmap(_backgroundImageLoader.content as Bitmap);
//		}
		
		private function backgroundBitmap(bitmap : Class) : void
		{
			_backgroundImageResource = bitmap;
			_useBackGroundImage = true;
			updateDisplayList(_width,_height);
		}
		
		private function getImage() : Bitmap
		{
			var cls : * = new _backgroundImageResource();
			var bitmap : Bitmap = new Bitmap();
			if(cls is Bitmap) {
				bitmap = cls;
			} else if(cls is MovieClip) {
//				var bitmapData : BitmapData = new BitmapData(cls.width,330,true,0x0) ;
//				bitmapData.draw(cls,new Matrix(),null,null,new Rectangle(0,0,cls.width,cls.height));
//				bitmap = new Bitmap(bitmapData);
				trace((cls as MovieClip).getChildAt(0));
				bitmap = (cls as MovieClip).getChildAt(0) as Bitmap;
			} else if(cls is BitmapData) {
				bitmap = new Bitmap(cls);
			}
			return bitmap;
		}
	}
}