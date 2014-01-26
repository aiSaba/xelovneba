package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	import flash.utils.setTimeout;
	
	public class Action extends MovieClip {
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		private var mainMc:MovieClip;
		private var draw:Draw;
		
		
		public function Action(_stageHeight, _stageWidth, mainMc)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			this.mainMc = mainMc;			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		
		private function addObjects():void
		{
			
			 draw = new Draw(mainMc);
			addChild(draw);
			mainMc.continueMc.addEventListener(MouseEvent.MOUSE_DOWN, destroy);
			
		}
		
		private function nextWithTimer():void
		{
				
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
				destroy(null);
		}
		
		private function destroy(arg:*):void
		{
			draw.clearStage();
			mainMc.visible = false;
			
		}	
	}
	
}
