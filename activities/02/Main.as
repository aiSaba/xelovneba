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
	public class Main extends MovieClip
	{
		private var _stageHeight;
		private var _stageWidth;
		
		private var makeColorsClass:MakeColorsClass;
		
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
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"))
			callMakeColorsClass();
		}
		
		private function callMakeColorsClass():void
		{
			makeColorsClass = new MakeColorsClass(_stageHeight, _stageWidth, mainObjects_mc);
			addChild(makeColorsClass);
			
			makeColorsClass.addEventListener(DataEvent.DATA, endOfGame);
		}
		
		private function endOfGame(e:DataEvent):void
		{
			if (e.data == "endOfStage")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
				var qula:Number = new Number();
				qula = 5;
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + qula.toString()));
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
			}
		}
	
	}

}