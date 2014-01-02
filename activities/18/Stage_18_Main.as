package  {
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	
	public class Main extends MovieClip {
		
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var zgarbi:Zgarbi_Class;
		private var stage_49:Stage_49;
		private var timerC:TimerClass;
		private var qula:int;
		
		public function Main() 
		{
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(ev:Event):void
		{
			if (stage)
			{
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			removeEventListener(Event.ADDED_TO_STAGE, init)
			callGames();
		}
		
		private function callGames():void
		{
			_stageHeight = stage.stageHeight;
			_stageWidth = stage.stageWidth;
			zgarbi = new Zgarbi_Class(_stageWidth, _stageHeight );
			stage_49 = new Stage_49(_stageWidth, _stageHeight);
			addChild(zgarbi);
			
			zgarbi.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
			stage_49.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
		}
		
		private function beforeStage(ev:DataEvent):void
		{
			if (ev.data == "movrchi")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleTrue"));
				timerC = new TimerClass();
				addChild(timerC);
				timerC.x = _stageWidth - timerC.width;
				timerC.y =  timerC.height;
				
				addChild(stage_49);
			}
			
			if (ev.data == "endOfScene")
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
