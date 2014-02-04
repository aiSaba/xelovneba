package  
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	import flash.events.DataEvent;
	
	
	public class Ferweraa extends MovieClip {
		
		private var ferwera:MovieClip;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var textArray:Array;
		private var soundControl:SoundControl;
		
		public function Ferweraa()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			YvelaferiFunc();
		}
		private function YvelaferiFunc(): void
		
		{
			_stageWidth = stage.stageWidth;
			_stageHeight = stage.stageHeight;
			ferwera = new Ferwera();
			addChild(ferwera);
			ferwera.x = _stageWidth / 2;
			ferwera.y = _stageHeight / 2;
			ferwera.height = _stageHeight/1.5;
			ferwera.scaleX = ferwera.scaleY;
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
			
			ferwera.Funji_Zeti.addEventListener(MouseEvent.MOUSE_DOWN, Func1);
			ferwera.Zeti.addEventListener(MouseEvent.MOUSE_DOWN, Func2);
			ferwera.Molberti.addEventListener(MouseEvent.MOUSE_DOWN, Func3);
			ferwera.Palitra.addEventListener(MouseEvent.MOUSE_DOWN, Func4);
			ferwera.Tilo.addEventListener(MouseEvent.MOUSE_DOWN, Func5);
			
			
			
			textArray = [ferwera.text_Funji_Zeti, ferwera.text_Zeti, ferwera.text_Molberti, ferwera.text_Palitra, ferwera.text_Tilo]
			
			
			
		}
		

		
		private function Func1 (MouseEvent):void
		{
			ferwera.text_Funji_Zeti.visible = true;
			
			waitFunc();
		}
		private function Func2 (MouseEvent):void
		{
			ferwera.text_Zeti.visible = true;
			waitFunc();
		}
		private function Func3 (MouseEvent):void
		{
			ferwera.text_Molberti.visible = true;
			waitFunc();
		}
		private function Func4 (MouseEvent):void
		{
			ferwera.text_Palitra.visible = true;
			waitFunc();
		}
		private function Func5 (MouseEvent):void
		{
			ferwera.text_Tilo.visible = true;
			waitFunc();
		}
		

		
		private function waitFunc():void
		{
			
			
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			
			ferwera.Funji_Zeti.removeEventListener(MouseEvent.MOUSE_DOWN, Func1);
			ferwera.Zeti.removeEventListener(MouseEvent.MOUSE_DOWN, Func2);
			ferwera.Molberti.removeEventListener(MouseEvent.MOUSE_DOWN, Func3);
			ferwera.Palitra.removeEventListener(MouseEvent.MOUSE_DOWN, Func4);
			ferwera.Tilo.removeEventListener(MouseEvent.MOUSE_DOWN, Func5);

			
			
			
			setTimeout(next, 1000);
		}
		private function next ():void
		{	
			
			for (var i:int = 0; i < textArray.length; i++)
			{
				textArray[i].visible = false;
				
			}
				removeChild (ferwera)
				ferwera = null;
			
			YvelaferiFunc();
			
		}
		
	}
	
}
