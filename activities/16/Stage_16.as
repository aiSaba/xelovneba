﻿package
{
	
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	public class Stage_16 extends MovieClip
	{
		
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var allObjects:MovieClip;
		private var ObjectsArray:Array;
		
		public function Stage_16(_stageWidth:Number = 1024, _stageHeight:Number = 768)
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
			ObjectsArray = [allObjects.tixa_mc, allObjects.marmarilo_mc, allObjects.plastelini_mc, allObjects.xe_mc, allObjects.spilendzi_mc]
			
			for (var i:int = 0; i < ObjectsArray.length; i++)
			{
				
				ObjectsArray[i].textbox_mc.alpha = 0;
				ObjectsArray[i].buttonMode = true;
				ObjectsArray[i].addEventListener(MouseEvent.MOUSE_DOWN, showTextFunc)
				ObjectsArray[i].addEventListener(MouseEvent.MOUSE_UP, hideTextFunc)
			}
			
			allObjects.next_button.addEventListener (MouseEvent.CLICK , destroyCaller)
			allObjects.next_button.buttonMode = true;
		}
		
		private function destroyCaller(e:MouseEvent):void
		{
			destroy();
		}
		private function destroy():void
		{
			TweenMax.killAll();
			
			if (allObjects)
			{
				for (var i:int = 0; i < ObjectsArray.length; i++)
				{
					
					ObjectsArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, showTextFunc)
					ObjectsArray[i].removeEventListener(MouseEvent.MOUSE_UP, hideTextFunc)
				}
				removeChild(allObjects);
				allObjects = null;
			}
			
			exit(null)
		}
		
				private function exit(e:*):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
			trace (dispatchEvent)
		}
		
		private function showTextFunc(e:MouseEvent):void
		{
			TweenLite.to(e.currentTarget.textbox_mc, 0.5, {alpha: 1});
		}
		
		private function hideTextFunc(e:MouseEvent):void
		{
			setTimeout(gaaqre, 1500, e.currentTarget)
		}
		
		private function gaaqre(Target):void
		{
			
			TweenLite.to(Target.textbox_mc, 0.5, {alpha: 0});
		}
		
		private function addStage():void
		{
			allObjects = new AllObjects();
			addChild(allObjects);
			allObjects.x = _stageWidth / 2;
			allObjects.y = _stageHeight / 2;
			allObjects.height = _stageHeight / 1.5;
			allObjects.scaleX = allObjects.scaleY;
		
		}
	
	}

}