package
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	import flash.geom.Rectangle;
	import flash.utils.setTimeout;
	
	public class Action extends MovieClip
	{
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		private var mainMc:MovieClip;
		private var old_X:Number;
		private var old_Y:Number;
		private var currentMc:MovieClip;
		
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
			mainMc.continueMc.addEventListener(MouseEvent.MOUSE_DOWN, destroy);
			mainMc.ornamentMc.visible = false;
			for (var i:int = 1; i <= 8; i++)
			{
				mainMc['obj_' + i].addEventListener(MouseEvent.MOUSE_DOWN, addOnTurningPoint)
			}
		}
		
		private function addOnTurningPoint(e:MouseEvent):void
		{
			currentMc = new MovieClip();
			currentMc = e.currentTarget as MovieClip;
			old_X = currentMc.x;
			old_Y = currentMc.y;
			currentMc.x = -413;
			currentMc.y = -191.5;
			var ratio:Number;
			
			if (currentMc.height > currentMc.width)
			{
				ratio = mainMc.turningPoint.height / currentMc.height;
			}
			else if (currentMc.width > currentMc.height)
			{
				ratio = mainMc.turningPoint.width / currentMc.width;
			}
			currentMc.scaleX = ratio;
			currentMc.scaleY = ratio;
			
			for (var i:int = 1; i <= 8; i++)
			{
				mainMc['obj_' + i].removeEventListener(MouseEvent.MOUSE_DOWN, addOnTurningPoint);
			}
			
			mainMc.deleteMc.addEventListener(MouseEvent.MOUSE_DOWN, deleteFromTurningPoint);
			mainMc.playMc.addEventListener(MouseEvent.MOUSE_DOWN, playOrnament);
		}
		
		private function playOrnament(e:MouseEvent):void
		{
			mainMc.ornamentMc.visible = true;
			mainMc.playMc.visible = false;
			mainMc.deleteMc.visible = false;
			mainMc.turningPoint.visible = false;
			mainMc.backGround.visible = false;
		}
		
		private function cloneMc():void
		{
			var mc:MovieClip = currentMc;
			mc.x += 25;
			mainMc.addChild(mc);
		}
		
		private function deleteFromTurningPoint(e:MouseEvent):void
		{
			currentMc.x = old_X;
			currentMc.y = old_Y;
			currentMc.scaleX = 1;
			currentMc.scaleY = 1;
			addObjects();
		}
		
		private function nextWithTimer():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
			destroy(null);
		}
		
		private function destroy(arg:*):void
		{
			mainMc.visible = false;
		
		}
	}

}
