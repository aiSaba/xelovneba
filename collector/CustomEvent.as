package  
{
	import flash.events.Event;
	/**
	 * ...
	 * @author mirian
	 */
	public class CustomEvent extends Event  
	{
		public static const DATA: String = "data";
		public static const MESSAGE: String = "message";
		public static const SOME_EVENT: String = "someevent";
		public var data: Object;
		
		public function CustomEvent(type:String, data: Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data = data;
		}
		 override public function clone():Event
		{
			return new CustomEvent (type, data, bubbles, cancelable);
		}

		
	}

}


