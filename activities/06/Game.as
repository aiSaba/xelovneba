package
{
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	
	public class Game extends MovieClip
	{
		
		private var pikasoArr:Array;
		private var pirosmaniArr:Array;
		private var randPlus:RandomPlus;
		private var PikasoX:Array;
		private var PirosmaniX:Array;
		private var timerC:TimerClass;
		private var qula:int;
		
		public function Game()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initGame();
		}
		
		private function initGame():void
		{
			
			Pirosmani_Mc.visible = false;
			Pikaso_Mc.visible = false;
			var Arr:Array = [Pirosmani_Mc, Pikaso_Mc];
			
			Arr[Math.round(Math.random() * 1)].visible = true;
			
			pirosmaniArr = [Pikaso_Mc.pirosmani3, Pikaso_Mc.pikaso, Pikaso_Mc.pirosmani2, Pikaso_Mc.pirosmani1];
			
			PirosmaniX = [-388.05, -166.95, 93.2, 351.75]
			pikasoArr = [Pirosmani_Mc.pikaso1, Pirosmani_Mc.pikaso2, Pirosmani_Mc.pirosmani, Pirosmani_Mc.pikaso3];			
			PikasoX = [-136.5,98.05,345.35,-360.75];
			Shuffle();
			
			for (var i:int = 0; i < pirosmaniArr.length; i++)
			{
				pirosmaniArr[i].addEventListener(MouseEvent.MOUSE_DOWN, FindPikaso);
				pikasoArr[i].addEventListener(MouseEvent.MOUSE_DOWN, FindPirosmani);
			}
			timerC = new TimerClass();
			addChild(timerC);
			dispatchEvent(new DataEvent(DataEvent.DATA , false , false, "ButtonVisibleTrue"));
			timerC.x = stage.stageWidth - timerC.width;
			timerC.y =  timerC.height;
		
		}
		
		private function Shuffle():void
		{
			randPlus = new RandomPlus(3);
			if (Pikaso_Mc.visible)
			{
				
				for (var i:int = 0; i < pirosmaniArr.length; i++)
				{
					var numb:Number = randPlus.getNum();
					pirosmaniArr[i].x = PirosmaniX[numb];
				}
			}
			else if (Pirosmani_Mc.visible)
			{
				
				for (var j:int = 0; j <pikasoArr.length ; j++) 
				{
					var numb1:Number = randPlus.getNum();					
					pikasoArr[j].x = PikasoX[numb1];
				}
			}
		
		}
		
		private function FindPirosmani(e:MouseEvent):void
		{
			if (e.currentTarget.name == "pirosmani")
			{
				var sound1:SoundControl = new SoundControl();
				sound1.loadSound("correct.mp3", 1);
				sound1.soundPlay();
				setTimeout(endOfGame, 2000);
			}
			else
			{
				var sound:SoundControl = new SoundControl();
				sound.loadSound("error.mp3", 1);
				sound.soundPlay();
			}
		}
		
		private function FindPikaso(e:MouseEvent):void
		{
			if (e.currentTarget.name == "pikaso")
			{
				var sound1:SoundControl = new SoundControl();
				sound1.loadSound("correct.mp3", 1);
				sound1.soundPlay();
				setTimeout(endOfGame, 2000);
			}
			else
			{
				var sound:SoundControl = new SoundControl();
				sound.loadSound("error.mp3", 1);
				sound.soundPlay();
			}
		}
		private function endOfGame():void
		{
			Pirosmani_Mc.visible = false;
			Pikaso_Mc.visible = false;
			back_Mc.visible = false;
			dispatchEvent(new DataEvent(DataEvent.DATA , false , false, "ButtonVisibleFalse"));
			qula = timerC.returnQula();
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + qula.toString() ));
			removeChild(timerC);
		}
		public function TimerStop():void
		{			
			timerC.pauseTimer();				
		}
		public function TimerResume():void
		{			
			timerC.resumeTimer();				
		}
	
	}

}
