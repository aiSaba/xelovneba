﻿package  {
	
	import flash.display.MovieClip;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	import flash.events.DataEvent;
	
	public class Saxelosno1 extends MovieClip
	{
		
		private var saxelosno:MovieClip;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var currentTarget:Array;
		private	var objectsArray:Array;
		private var soundControl:SoundControl;
		
		
		public function Saxelosno1(_stageWidth:Number = 1024, _stageHeight:Number = 768)
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
			saxelosno = new Saxelosno();
			addChild(saxelosno);
			saxelosno.x = _stageWidth / 2;
			saxelosno.y = _stageHeight / 2;
			saxelosno.height = _stageHeight/1.5;
			saxelosno.scaleX = saxelosno.scaleY;
			
			saxelosno.next_button_mc.addEventListener (MouseEvent.MOUSE_DOWN , destroy1);
			
			objectsArray = [ saxelosno.mc_Funji_Zeti , saxelosno.mc_Pasteli , saxelosno.mc_Akva , saxelosno.mc_Pencil ,  saxelosno.mc_Funji ,  saxelosno.mc_Guashi ,  saxelosno.mc_oil ,  saxelosno.mc_Sangina , saxelosno.mc_Molberti , saxelosno.mc_Tilo , saxelosno.mc_Paper , saxelosno.mc_Palitra ]
			
			
			for (var i:int = 0; i < objectsArray.length; i++)
			{
				objectsArray[i].addEventListener(MouseEvent.MOUSE_DOWN, tiloFunc);
				objectsArray[i].textbox_mc.visible = false;
 				
			}
		}
		private function tiloFunc (e:MouseEvent):void
		{
				CorrectFunc(); 
				e.currentTarget.textbox_mc.visible = true ;
				setTimeout(next, 2000, e.currentTarget.textbox_mc);	
		}
			
private function CorrectFunc():void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay()
			
		}
		
		private function destroy1 (e:MouseEvent):void
		{
			e.currentTarget.removeEventListener(MouseEvent.MOUSE_DOWN, tiloFunc);
			
			removeChild (saxelosno);
			saxelosno = null;
			
			exit(null)
		}
		
		private function exit(e:*):void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
			trace(dispatchEvent);
		}
		
		private function next (target):void
		{	
				target.visible = false;
		}
	}
}