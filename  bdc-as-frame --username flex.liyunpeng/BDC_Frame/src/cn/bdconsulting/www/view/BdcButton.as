package cn.bdconsulting.www.view
{
	import flash.events.MouseEvent;

	/**
	 * 
	 * @author LiYunpeng
	 */	
	public class BdcButton extends BdcSprite
	{
		private var _btnLabel : BdcLabel;
		
		public function BdcButton()
		{
			super();
			init();
		}
		
		private function init() : void
		{
//			_btnLabel = new BdcLabel();
//			label = "button";
//			addChild(_btnLabel);
		}
		
		public function set label(_text : String) : void
		{
//			_btnLabel.text = _text;
		}
		
	}
}