package  {
	
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class Controller extends MovieClip 
	{
		//private var controller:MovieClip;
		private var paintFlower:PaintFlower;
		private var paintRoom:PaintRoom;
		private var paintPortrate:PaintPortrait
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
			room.visible = false;
			autoportrait.visible = false;			
			sunFlower.visible = false;
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleTrue"));
			controller.portrate.addEventListener(MouseEvent.MOUSE_DOWN, addQaliHandler)
			controller.room.addEventListener(MouseEvent.MOUSE_DOWN, addDNHandler)
			controller.flower.addEventListener(MouseEvent.MOUSE_DOWN, addMeezoveHandler)
			controller.next.addEventListener(MouseEvent.MOUSE_DOWN, endGame);
		}
		
		private function addQaliHandler(e:MouseEvent):void 
		{
			controller.visible = false;
			autoportrait.visible = true;
			paintPortrate = new PaintPortrait(_stageWidth, _stageHeight, autoportrait);
			addChild(paintPortrate);
			paintPortrate.addEventListener(DataEvent.DATA, backToManu);
		}
		
		private function addDNHandler(e:MouseEvent):void 
		{
			controller.visible = false;
			room.visible = true;
			paintRoom = new PaintRoom(_stageWidth, _stageHeight, room);
			addChild(paintRoom);
			paintRoom.addEventListener(DataEvent.DATA, backToManu);
		}
		
		private function backToManu(e:DataEvent):void 
		{
			if (e.data == "MovrchiRoom")
			{
				controller.visible = true;
				room.visible = false;
				removeChild(paintRoom)
				paintRoom = null;
			}
			if (e.data == "MovrchiPortrate")
			{
				controller.visible = true;
				autoportrait.visible = false;
				removeChild(paintPortrate)
				paintPortrate = null;
			}
			if (e.data == "MovrchiFlower")
			{
				controller.visible = true;
				sunFlower.visible = false;
				removeChild(paintFlower)
				paintFlower = null;
			}
			
		}
			
		
		private function addMeezoveHandler(e:MouseEvent):void 
		{
			controller.visible = false;
			sunFlower.visible = true;
			paintFlower = new PaintFlower(_stageWidth, _stageHeight, sunFlower);
			addChild(paintFlower);
			paintFlower.addEventListener(DataEvent.DATA, backToManu);
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


