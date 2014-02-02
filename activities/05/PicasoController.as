package  {
	
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class PicasoController extends MovieClip 
	{
		//private var controller:MovieClip;
		private var paintQali:PaintQali;
		private var paintDNature:PaintDNaturmorti;
		private var paintNatyre:PaintNatrumorti
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		
		public function PicasoController() 
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
			qaliPaint.visible = false;
			dNaturmortiPaint.visible = false;			
			naturmortiPaint.visible = false;
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleTrue"));
			controller.qali.addEventListener(MouseEvent.MOUSE_DOWN, addQaliHandler)
			controller.didinature.addEventListener(MouseEvent.MOUSE_DOWN, addDNHandler)
			controller.naturmorti.addEventListener(MouseEvent.MOUSE_DOWN, addMeezoveHandler)			
		}
		
		private function addQaliHandler(e:MouseEvent):void 
		{
			controller.visible = false;
			qaliPaint.visible = true;
			paintQali = new PaintQali(_stageWidth, _stageHeight, qaliPaint);
			addChild(paintQali);
			paintQali.addEventListener(DataEvent.DATA, backToManu);
		}
		
		private function addDNHandler(e:MouseEvent):void 
		{
			
		
			
			controller.visible = false;
			dNaturmortiPaint.visible = true;
			
			
			paintDNature = new PaintDNaturmorti(_stageWidth, _stageHeight, dNaturmortiPaint);
		
			addChild(paintDNature);
			paintDNature.addEventListener(DataEvent.DATA, backToManu);
		}
		
		private function backToManu(e:DataEvent):void 
		{
			if (e.data == "MovrchiQals")
			{
				controller.visible = true;
				qaliPaint.visible = false;
				removeChild(paintQali)
				paintQali = null;
			}
			if (e.data == "MovrchiDN")
			{
				controller.visible = true;
				dNaturmortiPaint.visible = false;
				removeChild(paintDNature)
				paintDNature = null;
			}
			if (e.data == "MovrchiN")
			{
				controller.visible = true;
				naturmortiPaint.visible = false;
				removeChild(paintNatyre)
				paintNatyre = null;
			}
			
		}
		
		private function addMeezoveHandler(e:MouseEvent):void 
		{
			controller.visible = false;
			naturmortiPaint.visible = true;
			paintNatyre = new PaintNatrumorti(_stageWidth, _stageHeight, naturmortiPaint);
			addChild(paintNatyre);
			paintNatyre.addEventListener(DataEvent.DATA, backToManu);
		}	
		
	}
	
}

