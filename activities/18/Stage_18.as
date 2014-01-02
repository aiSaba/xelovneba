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
		private var allObjects:MovieClip;
		private var randomPlus:RandomPlus;
		private var soundControl:SoundControl;
		private var naturmortArray:Array;

		
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
			naturmortArray = [allObjects.nat_1, allObjects.nat_2, allObjects.nat_3, allObjects.nat_4, allObjects.nat_5, allObjects.nat_6, allObjects.nat_7, allObjects.nat_8, allObjects.nat_9]
			
			for (var i:int = 0; i < naturmortArray.length; i++ )
			{
				naturmortArray[i].y = -14, 5
			}
			
			
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
			for (var i:int = 0; i < naturmortArray.length; i++ )
			{
				addChild(naturmortArray[i])
			}
		}
		

	
	}

}
