package cn.bdconsulting.www.core
{
	import flash.events.Event;
	
	public class BdcLogEvent extends Event
	{
		public static const LOG_EVENT : String = "logEvent";
		
		public function BdcLogEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}