package cn.bdconsulting.www.event
{
	import flash.events.Event;
	
	public class BdcInitializeEvent extends Event
	{
		public static const INITIALIZE_EVENT : String = "initializeEvent"
		
		public function BdcInitializeEvent()
		{
			super(INITIALIZE_EVENT);
		}
	}
}