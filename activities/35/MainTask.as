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
	import flash.ui.Mouse;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	
	public class MainTask extends MovieClip
	{
		private var all:MovieClip;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		private var counter:Number = 0;
		private var oldObj_1X:Number;
		private var oldObj_1Y:Number;
		private var oldObj_2X:Number;
		private var oldObj_2Y:Number;
		private var oldObj_3X:Number;
		private var oldObj_3Y:Number;
		private var oldObj_4X:Number;
		private var oldObj_4Y:Number;
		
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
			all = new All2();
			all.x = _stageWidth / 2;
			all.y = _stageHeight / 2;
			all.height = _stageHeight / 2;
			all.scaleX = all.scaleY;
			for (var i:int = 1; i <= 4; i++)
			{
				all['obj_' + i].addEventListener(MouseEvent.MOUSE_DOWN, startDragFunc);
				all['obj_' + i].addEventListener(MouseEvent.MOUSE_UP, stopDragFunc);
			}
			//save old Cooordinates
			oldObj_1X = all.obj_1.x;
			oldObj_1Y = all.obj_1.y;
			oldObj_2X = all.obj_2.x;
			oldObj_2Y = all.obj_2.y;
			oldObj_3X = all.obj_3.x;
			oldObj_3Y = all.obj_3.y;
			oldObj_4X = all.obj_4.x;
			oldObj_4Y = all.obj_4.y;
			
			all.obj_1.x = -325;
			all.obj_1.y = 130;
			all.obj_2.x = -95;
			all.obj_2.y = 175;
			all.obj_3.x = 100;
			all.obj_3.y = 165;
			all.obj_4.x = 335;
			all.obj_4.y = 165;
			addChild(all);
		}
		
		private function stopDragFunc(e:MouseEvent):void
		{
			e.currentTarget.stopDrag();
			hitZoneCheck(e);
		}
		
		private function startDragFunc(e:MouseEvent):void
		{
			e.currentTarget.startDrag();
		}
		
		private function hitZoneCheck(e:MouseEvent):void
		{
			switch (e.currentTarget.name)
			{
				case 'obj_1': 
					counter++;
					if (e.currentTarget.x > oldObj_1X - 30 && oldObj_1X + 30 > e.currentTarget.x)
						if (e.currentTarget.y > oldObj_1Y - 30 && oldObj_1Y + 30 > e.currentTarget.y)
						{
							e.currentTarget.x = oldObj_1X;
							e.currentTarget.y = oldObj_1Y;
							e.currentTarget.removeEventListener(MouseEvent.MOUSE_DOWN, startDragFunc);
						}
					break;
				case 'obj_2': 
					counter++;
					if (e.currentTarget.x > oldObj_2X - 30 && oldObj_2X + 30 > e.currentTarget.x)
						if (e.currentTarget.y > oldObj_2Y - 30 && oldObj_2Y + 30 > e.currentTarget.y)
						{
							e.currentTarget.x = oldObj_2X;
							e.currentTarget.y = oldObj_2Y;
							e.currentTarget.removeEventListener(MouseEvent.MOUSE_DOWN, startDragFunc);
						}
					break;
				case 'obj_3': 
					counter++;
					if (e.currentTarget.x > oldObj_3X - 30 && oldObj_3X + 30 > e.currentTarget.x)
						if (e.currentTarget.y > oldObj_3Y - 30 && oldObj_3Y + 30 > e.currentTarget.y)
						{
							e.currentTarget.x = oldObj_3X;
							e.currentTarget.y = oldObj_3Y;
							e.currentTarget.removeEventListener(MouseEvent.MOUSE_DOWN, startDragFunc);
						}
					break;
				case 'obj_4': 
					counter++;
					if (e.currentTarget.x > oldObj_4X - 30 && oldObj_4X + 30 > e.currentTarget.x)
						if (e.currentTarget.y > oldObj_4Y - 30 && oldObj_4Y + 30 > e.currentTarget.y)
						{
							e.currentTarget.x = oldObj_4X;
							e.currentTarget.y = oldObj_4Y;
							e.currentTarget.removeEventListener(MouseEvent.MOUSE_DOWN, startDragFunc);
						}
					break;
			}
			if (counter == 4)
			{
				setTimeout(sentData, 1000);
			}
		}

		
		private function sentData():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame"));
			destroy(null);
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
	
	}

}
