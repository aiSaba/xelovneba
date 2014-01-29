package  
{
	
	import flash.display.MovieClip;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	import flash.events.DataEvent;
	
	public class GraficsObject extends MovieClip
	{
		
		private var soundControl:SoundControl;
		private var Igrafics:MovieClip;
		private var IpicsGrap:MovieClip;
		private var IIpicsGrap:MovieClip;
		private var IIIpicsGrap:MovieClip;
		private var currentStage:int;
		
		private var _stageWidth:Number;
		private var _stageHeight:Number;		
		
		public function GraficsObject(_stageWidth:Number = 1024, _stageHeight:Number = 768)
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
			Igrafics = new IGrafics();
			addChild(Igrafics);
			Igrafics.x = _stageWidth / 2;
			Igrafics.y = _stageHeight / 2 ;
			Igrafics.height = _stageHeight/1.5;
			Igrafics.scaleX = Igrafics.scaleY;
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
			Igrafics.stage_frame_box.visible=false
			pirveliStage();
			
			
			
			currentStage = 0;
		}
		
		
		
		
		private function pirveliStage(_stageWidth:Number = 1024, _stageHeight:Number = 768):void
		{	
			currentStage = 1;
			IpicsGrap = new IPicsGrap();
			addChild(IpicsGrap);
			IpicsGrap.x =  _stageWidth / 2;
			IpicsGrap.y = _stageHeight / 2;
			IpicsGrap.height = _stageHeight/1.5;
			IpicsGrap.scaleX = IpicsGrap.scaleY;
			
			Igrafics.button_Back.addEventListener(MouseEvent.MOUSE_DOWN, BackFunc);
			Igrafics.button_Next.addEventListener(MouseEvent.MOUSE_DOWN, NextFunc);
			
			IpicsGrap.Grafic_1.addEventListener(MouseEvent.MOUSE_DOWN, showFunc_1);
			IpicsGrap.Grafic_2.addEventListener(MouseEvent.MOUSE_DOWN, showFunc_2);
			IpicsGrap.Grafic_3.addEventListener(MouseEvent.MOUSE_DOWN, showFunc_3);
			IpicsGrap.Grafic_1_show.button_Exit.addEventListener(MouseEvent.MOUSE_DOWN, nonshowFunc_1);
			IpicsGrap.Grafic_2_show.button_Exit.addEventListener(MouseEvent.MOUSE_DOWN, nonshowFunc_2);
			IpicsGrap.Grafic_3_show.button_Exit.addEventListener(MouseEvent.MOUSE_DOWN, nonshowFunc_3);
			

			
		}
		

		
		
		private function showFunc_1(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			IpicsGrap.Grafic_1_show.visible = true;
		}
		private function nonshowFunc_1(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			IpicsGrap.Grafic_1_show.visible = false;
		}
		private function showFunc_2(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			IpicsGrap.Grafic_2_show.visible = true;
		}
		private function nonshowFunc_2(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			IpicsGrap.Grafic_2_show.visible = false;
		}
		private function showFunc_3(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			IpicsGrap.Grafic_3_show.visible = true;
		}
		private function nonshowFunc_3(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			IpicsGrap.Grafic_3_show.visible = false;
		}
		private function BackFunc(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("error.mp3", 1);
			addChild(soundControl);
			soundControl.soundPlay();
		}
		private function NextFunc(MouseEvent):void 
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			
			removeChild(IpicsGrap);
			removeButton1();
			
			
		}
		private function removeButton1():void
		{
			Igrafics.button_Back.removeEventListener(MouseEvent.MOUSE_DOWN, BackFunc);
			Igrafics.button_Next.removeEventListener(MouseEvent.MOUSE_DOWN, NextFunc);
			varStage_2();
		}
		
		private function varStage_2():void
		{
			
			currentStage = 2;
			
			IIpicsGrap = new IIPicsGrap();
			addChild(IIpicsGrap);
			IIpicsGrap.x =  _stageWidth / 2;
			IIpicsGrap.y = _stageHeight / 2;
			IIpicsGrap.height = _stageHeight/1.5;
			IIpicsGrap.scaleX = IIpicsGrap.scaleY;
			
			
			
			IIpicsGrap._Grafic_1.addEventListener(MouseEvent.MOUSE_DOWN, _showFunc_1);
			IIpicsGrap._Grafic_2.addEventListener(MouseEvent.MOUSE_DOWN, _showFunc_2);
			IIpicsGrap._Grafic_3.addEventListener(MouseEvent.MOUSE_DOWN, _showFunc_3);
			IIpicsGrap.Grafic_1_show.button_Exit.addEventListener(MouseEvent.MOUSE_DOWN, _nonshowFunc_1);
			IIpicsGrap.Grafic_2_show.button_Exit.addEventListener(MouseEvent.MOUSE_DOWN, _nonshowFunc_2);
			IIpicsGrap.Grafic_3_show.button_Exit.addEventListener(MouseEvent.MOUSE_DOWN, _nonshowFunc_3);
			
			Igrafics.button_Back.addEventListener(MouseEvent.MOUSE_DOWN, BackFunc2);
			Igrafics.button_Next.addEventListener(MouseEvent.MOUSE_DOWN, NextFunc2);
			

		}
		
		private function _showFunc_1(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			IIpicsGrap.Grafic_1_show.visible = true;
		}
		private function _nonshowFunc_1(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			IIpicsGrap.Grafic_1_show.visible = false;
		}
		private function _showFunc_2(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			IIpicsGrap.Grafic_2_show.visible = true;
		}
		private function _nonshowFunc_2(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			IIpicsGrap.Grafic_2_show.visible = false;
		}
		private function _showFunc_3(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			IIpicsGrap.Grafic_3_show.visible = true;
		}
		private function _nonshowFunc_3(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			IIpicsGrap.Grafic_3_show.visible = false;
		}
		private function BackFunc2(Event):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			
			removeChild(IIpicsGrap);
			removeButton2();
		}
		private function removeButton2():void
		{
			Igrafics.button_Back.removeEventListener(MouseEvent.MOUSE_DOWN, BackFunc2);
			Igrafics.button_Next.removeEventListener(MouseEvent.MOUSE_DOWN, NextFunc2);
			pirveliStage();
		}
		
		private function NextFunc2(MouseEvent):void 
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			
			removeChild(IIpicsGrap);
			removeButton3();
			
		}
		
		private function removeButton3():void
		{
			Igrafics.button_Back.removeEventListener(MouseEvent.MOUSE_DOWN, BackFunc2);
			Igrafics.button_Next.removeEventListener(MouseEvent.MOUSE_DOWN, NextFunc2);
			mesameStage();
		}
		private function mesameStage():void
		{
			currentStage = 3;
			IIIpicsGrap = new IIIPicsGrap();
			addChild(IIIpicsGrap);
			IIIpicsGrap.x =  _stageWidth / 2;
			IIIpicsGrap.y = _stageHeight / 2;
			IIIpicsGrap.height = _stageHeight/1.5;
			IIIpicsGrap.scaleX = IIIpicsGrap.scaleY;
			
			IIIpicsGrap._3Grafic_1.addEventListener(MouseEvent.MOUSE_DOWN, _3showFunc_1);
			IIIpicsGrap._3Grafic_2.addEventListener(MouseEvent.MOUSE_DOWN, _3showFunc_2);
			IIIpicsGrap._3Grafic_3.addEventListener(MouseEvent.MOUSE_DOWN, _3showFunc_3);
			
			IIIpicsGrap.Grafic_1_show.button_Exit.addEventListener(MouseEvent.MOUSE_DOWN, _3nonshowFunc_1);
			IIIpicsGrap.Grafic_2_show.button_Exit.addEventListener(MouseEvent.MOUSE_DOWN, _3nonshowFunc_2);
			IIIpicsGrap.Grafic_3_show.button_Exit.addEventListener(MouseEvent.MOUSE_DOWN, _3nonshowFunc_3);
			
			Igrafics.button_Back.addEventListener(MouseEvent.MOUSE_DOWN, BackFunc3);
			Igrafics.button_Next.addEventListener(MouseEvent.MOUSE_DOWN, NextFunc3);
			
			
			

		}
		
		
		
		private function _3showFunc_1(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			IIIpicsGrap.Grafic_1_show.visible = true;
		}
		private function _3nonshowFunc_1(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			IIIpicsGrap.Grafic_1_show.visible = false;
		}
		private function _3showFunc_2(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			IIIpicsGrap.Grafic_2_show.visible = true;
		}
		private function _3nonshowFunc_2(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			IIIpicsGrap.Grafic_2_show.visible = false;
		}
		private function _3showFunc_3(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			IIIpicsGrap.Grafic_3_show.visible = true;
		}
		private function _3nonshowFunc_3(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			IIIpicsGrap.Grafic_3_show.visible = false;
		}
		
		
		
		private function BackFunc3(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			
			removeChild(IIIpicsGrap);
			removeButton4();
		}
		private function removeButton4():void
		{

			varStage_2();
			Igrafics.button_Back.removeEventListener(MouseEvent.MOUSE_DOWN, BackFunc3);
			Igrafics.button_Next.removeEventListener(MouseEvent.MOUSE_DOWN, NextFunc3);
		}
		
		private function NextFunc3(MouseEvent):void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("error.mp3", 1);
			addChild(soundControl);
			soundControl.soundPlay();
		}
	}
}