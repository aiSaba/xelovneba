package
{
	
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	public class Stage_18 extends MovieClip
	{
		
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		
		public function Stage_18(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			allFunc();
		}
		
		private function allFunc():void
		{
			
			addStage();
			
			
		}
		
		
		private function addStage():void
		{
			allObjects = new AllObjects();
			addChild(allObjects);
			allObjects.x = _stageWidth / 2;
			allObjects.y = _stageHeight / 2;
			allObjects.height = _stageHeight / 1.5;
			allObjects.scaleX = allObjects.scaleY;
			allObjects.Xpos_mc.visible = false;
		}
	
	}

}
