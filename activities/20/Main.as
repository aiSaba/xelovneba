package 
{
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.display.Loader;
	
	/**
	 * ...
	 * @author ... nika
	 */
	public class  Main extends MovieClip
	{
		private var _stageHeight;
		private var _stageWidth;
		
		private var mainTask:MainTask;
		
		public function Main():void
		{
			if (stage)
			{
				stage.scaleMode = StageScaleMode.NO_SCALE;
			    stage.align = StageAlign.TOP_LEFT;
			}
			
			addEventListener(Event.ADDED_TO_STAGE, init);		
		}
		private function init(event:Event):void
	    {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_stageHeight = stage.stageHeight;
			_stageWidth = stage.stageWidth;
			
		    callMainTaskClass();
		}
		
		private function callMainTaskClass():void 
		{			
			mainTask = new MainTask(_stageHeight, _stageWidth);
			addChild(mainTask);
			
			mainTask.addEventListener(DataEvent.DATA , endOfGame);
		}
		
		private function endOfGame(e:DataEvent):void 
		{
			if (e.data.indexOf("endOfGame") != -1)
			{
				trace("mevida eventi");
				dispatchEvent(new DataEvent(DataEvent.DATA , false , false, "endOfGame"));
			}
			if (e.data == "ButtonVisibleFalse")
			{
				trace("visible false");
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
			}
			if (e.data == "ButtonVisibleTrue")
			{
				trace("visible true");
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
			}
		}
		
	}
	
}