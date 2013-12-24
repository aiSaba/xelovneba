package  {
	
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class Controller extends MovieClip 
	{
		//private var controller:MovieClip;
		private var paintWomen:PaintWoman;
		private var paintAngels:PaintAngels;
		private var paintPortrate:PaintPortrate
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		
		public function Controller() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			initController()
		}
		
		private function initController():void 
		{
			_stageWidth = stage.stageWidth;
			_stageHeight = stage.stageHeight;
			
			controller.x =_stageWidth / 2;
			controller.y = _stageHeight / 2;
			womanpaint.visible = false;
			portratePaint.visible = false;			
			angelsPaint.visible = false;
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleTrue"));
			controller.portreti.addEventListener(MouseEvent.MOUSE_DOWN, addQaliHandler)
			controller.angels.addEventListener(MouseEvent.MOUSE_DOWN, addDNHandler)
			controller.qali.addEventListener(MouseEvent.MOUSE_DOWN, addMeezoveHandler)
			controller.next.addEventListener(MouseEvent.MOUSE_DOWN, endGame);
		}
		
		private function addQaliHandler(e:MouseEvent):void 
		{
			controller.visible = false;
			portratePaint.visible = true;
			paintPortrate = new PaintPortrate(_stageWidth, _stageHeight, portratePaint);
			addChild(paintPortrate);
			paintPortrate.addEventListener(DataEvent.DATA, backToManu);
		}
		
		private function addDNHandler(e:MouseEvent):void 
		{
			controller.visible = false;
			angelsPaint.visible = true;
			paintAngels = new PaintAngels(_stageWidth, _stageHeight, angelsPaint);
			addChild(paintAngels);
			paintAngels.addEventListener(DataEvent.DATA, backToManu);
		}
		
		private function backToManu(e:DataEvent):void 
		{
			if (e.data == "MovrchiAngels")
			{
				controller.visible = true;
				angelsPaint.visible = false;
				removeChild(paintAngels)
				paintAngels = null;
			}
			if (e.data == "MovrchiPortrate")
			{
				controller.visible = true;
				portratePaint.visible = false;
				removeChild(paintPortrate)
				paintPortrate = null;
			}
			if (e.data == "MovrchiWoman")
			{
				controller.visible = true;
				womanpaint.visible = false;
				removeChild(paintWomen)
				paintWomen = null;
			}
			
		}
			
		
		private function addMeezoveHandler(e:MouseEvent):void 
		{
			controller.visible = false;
			womanpaint.visible = true;
			paintWomen = new PaintWoman(_stageWidth, _stageHeight, womanpaint);
			addChild(paintWomen);
			paintWomen.addEventListener(DataEvent.DATA, backToManu);
		}
		
		private function endGame(e:MouseEvent):void
		{
			controller.visible = false;
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleFalse"));
			var qula:Number = new Number();
			qula = 5;
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + qula.toString() ));
			
		}
	}
	
}

