package
{
	
	import fl.motion.easing.Back;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Mouse;
	
	public class Draw extends MovieClip
	{
		private var drawing:Boolean;
		private var bowl:MovieClip;
		private var mc:MovieClip;
		
		private var pointer:MovieClip;
		
		public function Draw(mc:MovieClip)
		{
			this.mc = mc;
			this.mask = mc.moonMask;
			addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);
		}
		
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		var startPointer:Point
		
		private function addObjects():void
		{
	
			Main._stage.addEventListener(MouseEvent.MOUSE_DOWN, startDrawing);
			Main._stage.addEventListener(MouseEvent.MOUSE_MOVE, draw);
			Main._stage.addEventListener(MouseEvent.MOUSE_UP, stopDrawing);
			mc.takePhotoMc.addEventListener(MouseEvent.MOUSE_DOWN, scrFunc);
			//mc.continueMc.addEventListener(MouseEvent.MOUSE_DOWN, nextFunc);
			drawing = false;
		}
		
		public function clearStage():void 
		{
			graphics.clear();
		}
		
		private function scrFunc(e:MouseEvent):void
		{
			var scr:Raghats = new Raghats(stage);
		}
		
		private function draw(ev:MouseEvent):void
		{
			if (drawing)
			{
				graphics.lineTo(mouseX, mouseY);
			}
		} // end Draw
		
		public function startDrawing(event:MouseEvent):void
		{
			graphics.lineStyle(3, 0x000000);
			graphics.moveTo(mouseX, mouseY);
			drawing = true;
		
		} // end startDrawing
		
		public function stopDrawing(event:MouseEvent):void
		{
			drawing = false;
		}
	
	}

}
