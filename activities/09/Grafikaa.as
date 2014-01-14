﻿package  
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	import flash.events.DataEvent;
	
	
	public class Grafikaa extends MovieClip {
		
		private var grafika:MovieClip;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var textArray:Array;
		private var objectArray:Array;
		private var soundControl:SoundControl;
		
		public function Grafikaa(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			YvelaferiFunc();
		}
		private function YvelaferiFunc(): void
		
		{
			grafika = new Grafika();
			addChild(grafika);
			grafika.x = _stageWidth / 2;
			grafika.y = _stageHeight / 2;
			grafika.height = _stageHeight/1.5;
			grafika.scaleX = grafika.scaleY;
			
			
			grafika.akvareli.addEventListener(MouseEvent.MOUSE_DOWN, Func1);
			grafika.sangina.addEventListener(MouseEvent.MOUSE_DOWN, Func2);
			grafika.pencil.addEventListener(MouseEvent.MOUSE_DOWN, Func3);
			grafika.pasteli.addEventListener(MouseEvent.MOUSE_DOWN, Func4);
			grafika.guashi.addEventListener(MouseEvent.MOUSE_DOWN, Func5);
			grafika.funjebi_Zeti.addEventListener(MouseEvent.MOUSE_DOWN, Func6);
			grafika.paper.addEventListener(MouseEvent.MOUSE_DOWN, Func7);
			
			grafika.next_button_mc.addEventListener (MouseEvent.CLICK , destroy)
			
			textArray = [grafika.text_Pasteli,grafika.text_Paper, grafika.text_Funjebi_Zeti, grafika.text_Guashi, grafika.text_Akvareli, grafika.text_Sangina, grafika.text_Pencil]
			
		}
		
		private function destroy (e:MouseEvent):void
		{
			if (grafika)
			{
				grafika.akvareli.removeEventListener(MouseEvent.MOUSE_DOWN, Func1);
				grafika.sangina.removeEventListener(MouseEvent.MOUSE_DOWN, Func2);
				grafika.pencil.removeEventListener(MouseEvent.MOUSE_DOWN, Func3);
				grafika.pasteli.removeEventListener(MouseEvent.MOUSE_DOWN, Func4);
				grafika.guashi.removeEventListener(MouseEvent.MOUSE_DOWN, Func5);
				grafika.funjebi_Zeti.removeEventListener(MouseEvent.MOUSE_DOWN, Func6);
				grafika.paper.removeEventListener(MouseEvent.MOUSE_DOWN, Func7);
				
				removeChild (grafika)
				grafika = null;
			}
			exit(null)
		}
		
			private function exit(e:*):void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
			trace(dispatchEvent)
		}
		
		
		
		private function Func1 (MouseEvent):void
		{
			grafika.text_Akvareli.visible = true;
			waitFunc();
			
			
		}
		private function Func2 (MouseEvent):void
		{
			grafika.text_Sangina.visible = true;
			waitFunc();
		}
		private function Func3 (MouseEvent):void
		{
			grafika.text_Pencil.visible = true;
			waitFunc();
		}
		private function Func4 (MouseEvent):void
		{
			grafika.text_Pasteli.visible = true;
			waitFunc();
		}
		private function Func5 (MouseEvent):void
		{
			grafika.text_Guashi.visible = true;
			waitFunc();
		}
		private function Func6 (MouseEvent):void
		{
			grafika.text_Funjebi_Zeti.visible = true;
			waitFunc();
		}
		private function Func7 (MouseEvent):void
		{
			grafika.text_Paper.visible = true;
			waitFunc();
		}
		private function waitFunc():void
		{
			
			
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			
			grafika.akvareli.removeEventListener(MouseEvent.MOUSE_DOWN, Func1);
			grafika.sangina.removeEventListener(MouseEvent.MOUSE_DOWN, Func2);
			grafika.pencil.removeEventListener(MouseEvent.MOUSE_DOWN, Func3);
			grafika.pasteli.removeEventListener(MouseEvent.MOUSE_DOWN, Func4);
			grafika.guashi.removeEventListener(MouseEvent.MOUSE_DOWN, Func5);
			grafika.funjebi_Zeti.removeEventListener(MouseEvent.MOUSE_DOWN, Func6);
			grafika.paper.removeEventListener(MouseEvent.MOUSE_DOWN, Func7);
			
			setTimeout(next, 1500);
		}
		private function next ():void
		{	
			
			for (var i:int = 0; i < textArray.length; i++)
			{
				textArray[i].visible = false;
				
			}
			
			YvelaferiFunc();
			
		}
		
	}
	
}