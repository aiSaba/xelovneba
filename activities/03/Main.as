package  {
	
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.display.Loader;
	
	
	
	
	public class Main extends MovieClip {
		
		private var _stageHeight;
		private var _stageWidth;
		private var warmColorsClass:WarmColorsClass;
		private var timerC:TimerClass;
		private var qula:int;
		
		public function Main() 
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
	
		    warmColorsCall();
		}
		
		private function warmColorsCall():void
		{
			warmColourMc.x = _stageWidth /2 ;
			warmColourMc.y = _stageHeight /2;
			warmColourMc.height = _stageHeight/1.5;
			warmColourMc.scaleX = warmColourMc.scaleY;
			
			warmColorsClass = new WarmColorsClass(_stageWidth, _stageHeight, warmColourMc);
			addChild(warmColorsClass);
			
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleTrue"));
			timerC = new TimerClass();
			addChild(timerC);
			timerC.x = _stageWidth - timerC.width;
			timerC.y =  timerC.height;
			warmColorsClass.addEventListener(DataEvent.DATA , endOfGame);
		}
		private function endOfGame(e:DataEvent):void 
		{
			
				if (e.data == "endOfScene")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleFalse"));
				qula = timerC.returnQula();
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + qula.toString() ));
				removeChild(timerC);
				
			
			}
		}
		
		public function TimerStop():void
		{			
			timerC.pauseTimer();				
		}
		public function TimerResume():void
		{			
			timerC.resumeTimer();				
		}
			
	}
	
}
