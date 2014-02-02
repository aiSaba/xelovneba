package  {
	
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class PaintController extends MovieClip 
	{
		//private var startButtons:MovieClip;
		private var paintZebra:PaintZebra;
		private var paintFishMan:PaintFishMan;
		private var paintMeezoveClass:PaintMeezove
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		
		public function PaintController() 
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
			
			startButtons.x =_stageWidth / 2;
			startButtons.y = _stageHeight / 2;
			zebraPaint.visible = false;
			fishManPaint.visible = false;
			trace(meezovePaint);
			meezovePaint.visible = false;
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleTrue"));
			startButtons.zebrabutton.addEventListener(MouseEvent.MOUSE_DOWN, addZebraHandler)
			startButtons.fishmanbutton.addEventListener(MouseEvent.MOUSE_DOWN, addManHandler)
			startButtons.meezovebutton.addEventListener(MouseEvent.MOUSE_DOWN, addMeezoveHandler)			
		}
		
		private function addZebraHandler(e:MouseEvent):void 
		{
			startButtons.visible = false;
			zebraPaint.visible = true;
			paintZebra = new PaintZebra(_stageWidth, _stageHeight, zebraPaint);
			addChild(paintZebra);
			paintZebra.addEventListener(DataEvent.DATA, backToManu);
		}
		
		private function addManHandler(e:MouseEvent):void 
		{
			startButtons.visible = false;
			fishManPaint.visible = true;
			paintFishMan = new PaintFishMan(_stageWidth, _stageHeight, fishManPaint);
			addChild(paintFishMan);
			paintFishMan.addEventListener(DataEvent.DATA, backToManu);
		}
		
		private function addMeezoveHandler(e:MouseEvent):void 
		{
			startButtons.visible = false;
			meezovePaint.visible = true;
			paintMeezoveClass = new PaintMeezove(_stageWidth, _stageHeight, meezovePaint);
			addChild(paintMeezoveClass);
			paintMeezoveClass.addEventListener(DataEvent.DATA, backToManu);
		}
		private function backToManu(e:DataEvent):void 
		{
			trace(e.data)
			if (e.data == "MovrchiZebras")
			{
				startButtons.visible = true;
				zebraPaint.visible = false;
				removeChild(paintZebra)
				paintZebra = null;
			}
			if (e.data == "MovrchiFishMans")
			{
				startButtons.visible = true;
				fishManPaint.visible = false;
				removeChild(paintFishMan)
				paintFishMan = null;
			}
			if (e.data == "MovrchiMeezoves")
			{
				startButtons.visible = true;
				meezovePaint.visible = false;
				removeChild(paintMeezoveClass)
				paintMeezoveClass = null;
			}
			
		}
	}
	
}
