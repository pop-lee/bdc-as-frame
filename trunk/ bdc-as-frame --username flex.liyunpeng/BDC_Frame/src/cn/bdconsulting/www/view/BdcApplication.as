package cn.bdconsulting.www.view
{
	import cn.bdconsulting.www.event.BdcInitializeEvent;
	
	import flash.display.Stage;
	import flash.events.Event;

	public class BdcApplication extends BdcContainer
	{
		private static var _application : Stage;
		
		public function BdcApplication()
		{
			this.addEventListener(Event.ADDED_TO_STAGE,addToStageHandle);
		}
		
		protected function init() : void
		{
		}
		
		public static function get application() : Stage
		{
			return _application;
		}
		
		private function addToStageHandle(event : Event) : void
		{
			_application = stage;
			this.width = stage.stageWidth;
			this.height = stage.stageHeight;
			init();
//			this.dispatchEvent(new BdcInitializeEvent());
		}
	}
}