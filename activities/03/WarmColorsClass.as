package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	import flash.utils.setTimeout;
	
	public class WarmColorsClass extends MovieClip {
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		private var warmColourMc:MovieClip;
		private var warmArr:Array;
		private var coldArr:Array;
		private var old_X:Number;
		private var old_Y:Number;
		private static var current:Object;
		private var conteiners:Array;
		private var currentHitObjectWarm:MovieClip;
		private var currentHitObjectCold:MovieClip;
		private var nextStageCounter:Number = 0;
		
		public function WarmColorsClass(_stageHeight, _stageWidth, warmColourMc)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			this.warmColourMc = warmColourMc;			
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
			
			
			warmArr = [warmColourMc.warm_1, warmColourMc.warm_2];
			coldArr = [warmColourMc.cold_1, warmColourMc.cold_2];
			
			
			
			conteiners = [warmColourMc.warm_3cont,  warmColourMc.warm_4cont, warmColourMc.warm_1cont, warmColourMc.warm_2cont];
			for (var i:int = 0; i < warmArr.length; i++ )
			{
				warmArr[i].addEventListener(MouseEvent.MOUSE_DOWN, myStartDrag);
				coldArr[i].addEventListener(MouseEvent.MOUSE_DOWN, myStartDrag);
				
				warmArr[i].addEventListener(MouseEvent.MOUSE_UP, myStopDrag);
				coldArr[i].addEventListener(MouseEvent.MOUSE_UP, myStopDrag);
			}
		}
		
		private function myStartDrag(ev:MouseEvent):void
		{
			current = ev.currentTarget;
			old_X = current.x;
			old_Y = current.y;
			ev.currentTarget.startDrag();
			hitTestFunc(null);
		}
		
		private function myStopDrag(ev:MouseEvent):void
		{
			ev.currentTarget.stopDrag();
			hitTestFunc_1(null);
		}
		
		private function hitTestFunc(ev:Event):void
		{
			
		}
		
		private function hitTestFunc_1(ev:MouseEvent):void
		{
			if (current == warmArr[0] || current == warmArr[1])
			{
				if (current.hitTestObject(conteiners[0]))
				{	
					//current.mouseEnabled = false;
					if (currentHitObjectWarm == conteiners[0])
					{
						TweenMax.to(current, 0.2, {x: old_X, y: old_Y});
						return;
					}
					
					currentHitObjectWarm = conteiners[0];
					trace("1")
					//current.removeEventListener(MouseEvent.MOUSE_DOWN, myStartDrag); 
					current.x = conteiners[0].x;
					current.y = conteiners[0].y;
					old_X = current.x;
					old_Y = current.y;
					
					nextStageCounter++;
					nextStageFunc();
				}
			
				
				if (current.hitTestObject(conteiners[1]))
				{
					//current.mouseEnabled = false;
					if (currentHitObjectWarm == conteiners[1])
					{
						TweenMax.to(current, 0.2, {x: old_X, y: old_Y});
						return;
					}
					
					currentHitObjectWarm = conteiners[1];
					trace("2")
					//current.removeEventListener(MouseEvent.MOUSE_DOWN, myStartDrag); 
					current.x = conteiners[1].x;
					current.y = conteiners[1].y;
					old_X = current.x;
					old_Y = current.y;
					
					nextStageCounter++;
					nextStageFunc();
				}
				else
				{
					TweenMax.to(current, 0.2, {x: old_X, y: old_Y});
				}
			}
			
			
			if (current == coldArr[0] || current == coldArr[1])
			{
				if (current.hitTestObject(conteiners[2]))
				{
					//current.mouseEnabled = false;
					if (currentHitObjectCold == conteiners[2])
					{
						TweenMax.to(current, 0.2, {x: old_X, y: old_Y});
						return;
					}
					
					currentHitObjectCold = conteiners[2];
					trace("3")
					//current.removeEventListener(MouseEvent.MOUSE_DOWN, myStartDrag); 
					current.x = conteiners[2].x;
					current.y = conteiners[2].y;
					old_X = current.x;
					old_Y = current.y;
					
					nextStageCounter++;
					nextStageFunc();
				}
			
				
			
				if (current.hitTestObject(conteiners[3]))
				{
					//current.mouseEnabled = false;
					if (currentHitObjectCold == conteiners[3])
					{
						TweenMax.to(current, 0.2, {x: old_X, y: old_Y});
						return;
					}
					
					currentHitObjectCold = conteiners[3];
					trace("4")
					//current.removeEventListener(MouseEvent.MOUSE_DOWN, myStartDrag); 
					current.x = conteiners[3].x;
					current.y = conteiners[3].y;
					old_X = current.x;
					old_Y = current.y;
					nextStageCounter++;
					nextStageFunc();
				}	
				else
				{
					TweenMax.to(current, 0.2, {x: old_X, y: old_Y});
				}
			}
		}
		
		private function nextStageFunc():void
		{
			if (nextStageCounter == 4)
			{
				var soundControl = new SoundControl();
				addChild(soundControl);
				soundControl.loadSound("clap.mp3", 1);
				soundControl.soundPlay();
				setTimeout(nextWithTimer, 3500)
			}
		}
		
		
		private function nextWithTimer():void
		{
				
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
				destroy(null);
		}
		
		private function destroy(event:Event):void
		{
			warmColourMc.visible = false;
			
			for (var i:int = 0; i < warmArr.length; i++ )
			{
				warmArr[i].removeEventListener(MouseEvent.MOUSE_DOWN, myStartDrag);
				coldArr[i].removeEventListener(MouseEvent.MOUSE_DOWN, myStartDrag);
				
				warmArr[i].removeEventListener(MouseEvent.MOUSE_UP, myStopDrag);
				coldArr[i].removeEventListener(MouseEvent.MOUSE_UP, myStopDrag);
			}
		}

		
		
		
	}
	
}
