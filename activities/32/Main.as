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
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		private var action:Action;
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
	
		    actionCall();
		}
		
		private function actionCall():void
		{
			mainMc.x = _stageWidth /2 ;
			mainMc.y = _stageHeight /2;
			mainMc.height = _stageHeight/1.5;
			mainMc.scaleX = mainMc.scaleY;
			
			action = new Action(_stageWidth, _stageHeight, mainMc);
			addChild(action);
			
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleTrue"));
			action.addEventListener(DataEvent.DATA , endOfGame);
		}
		private function endOfGame(e:DataEvent):void 
		{
			
				if (e.data == "endOfScene")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleFalse"));
				
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + qula.toString() ));
				
			}
		}
		
		
			
	}
	
}
