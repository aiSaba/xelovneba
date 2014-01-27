package
{
	
	import com.greensock.motionPaths.MotionPath;
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	
	public class MainTask extends MovieClip
	{
		private var all:MovieClip;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function MainTask(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (all)
			{
				removeChild(all);
				all = null;
			}
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		
		private function addObjects():void
		{
			all = new All();
			all.x = _stageWidth / 2;
			all.y = _stageHeight / 2;
			all.height = _stageHeight / 1.5;
			all.scaleX = all.scaleY;
			addChild(all);
			for (var i:int = 1; i <= 13; i++)
			{
				all['obj_' + i].addEventListener(MouseEvent.MOUSE_DOWN, cloneFunc);		
			}
			all.takePhoto.addEventListener(MouseEvent.MOUSE_DOWN, takePhotoFunc);
		}
		
		private function stopDragFunc(e:MouseEvent):void
		{
			e.currentTarget.stopDrag();
		}
		
		private function startDragFunc(e:MouseEvent):void
		{
			e.currentTarget.startDrag();
		}
		
		private function cloneFunc(e:MouseEvent):void
		{
			var mc:MovieClip;
			switch (e.currentTarget.name)
			{
				case 'obj_1': 
					mc = new Obj_1();
					break;
				case 'obj_2':
					mc = new Obj_2();
					break;
				case 'obj_3': 
					mc = new Obj_3();
					break;
				case 'obj_4': 
					mc = new Obj_4();
					break;
				case 'obj_5': 
					mc = new Obj_5();
					break;
				case 'obj_6': 
					mc = new Obj_6();
					break;
				case 'obj_7':
					mc = new Obj_7();
					break;
				case 'obj_8': 
					mc = new Obj_8();
					break;
				case 'obj_9': 
					mc = new Obj_9();
					break;
				case 'obj_10': 
					mc = new Obj_10();
					break;
				case 'obj_11': 
					mc = new Obj_11();
					break;
				case 'obj_12': 
					mc = new Obj_12();
					break;
				case 'obj_13': 
					mc = new Obj_13();
					break;
			}
			mc.addEventListener(MouseEvent.MOUSE_DOWN, startDragFunc);
			mc.addEventListener(MouseEvent.MOUSE_UP, stopDragFunc);
			coordinateMc(mc);
			all.addChild(mc);
		}
		
		private function takePhotoFunc(e:MouseEvent):void
		{
			var scr:Raghats = new Raghats(stage);
			scr.addEventListener(DataEvent.DATA, scrListener);
		}
		
		private function scrListener(e:DataEvent):void
		{
			if (e.data == "sheinaxa")
			{
				setTimeout(function()
					{
						dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame"));
						destroy(null);
					}, 1000);
			}
		}
		
		private function coordinateMc(mc:MovieClip):void
		{
			mc.x = mouseX - _stageWidth/2;
			mc.y = mouseY-_stageHeight/2;
		}
	
	}

}
