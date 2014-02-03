package
{
	
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	public class Stage_30 extends MovieClip
	{
		
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var allObjects:MovieClip;
		
		private var randomPlus:RandomPlus;
		private var soundControl:SoundControl;
		
		private var ChosenArrayIndex:int;
		private var ChosenElementIndex:int;
		var dadebuli_MC:MovieClip
		
		private var naturmortArray:Array;
		private var portArray:Array;
		private var peizajiArray:Array;
		

		
		private var masivebisArray:Array;
		
		private var nat_1:MovieClip;
		private var nat_2:MovieClip;
		private var nat_3:MovieClip;
		private var nat_4:MovieClip;
		private var nat_5:MovieClip;
		private var nat_6:MovieClip;
		private var nat_7:MovieClip;
		private var nat_8:MovieClip;
		private var nat_9:MovieClip;
		
		private var port_1:MovieClip;
		private var port_2:MovieClip;
		private var port_3:MovieClip;
		private var port_4:MovieClip;
		private var port_5:MovieClip;
		private var port_6:MovieClip;
		private var port_7:MovieClip;
		private var port_8:MovieClip;
		private var port_9:MovieClip;
		
		private var peizaji_1:MovieClip;
		private var peizaji_2:MovieClip;
		private var peizaji_3:MovieClip;
		private var peizaji_4:MovieClip;
		private var peizaji_5:MovieClip;
		private var peizaji_6:MovieClip;
		private var peizaji_7:MovieClip;
		private var peizaji_8:MovieClip;
		private var peizaji_9:MovieClip;
		
		public function Stage_30(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			allFunc();
		}
		
		private function allFunc():void
		{
			
			addStage();
			
			nat_1 = new Nat_1();
			nat_2 = new Nat_2();
			nat_3 = new Nat_3();
			nat_4 = new Nat_4();
			nat_5 = new Nat_5();
			nat_6 = new Nat_6();
			nat_7 = new Nat_7();
			nat_8 = new Nat_8();
			nat_9 = new Nat_9();
			
			port_1 = new Port_1();
			port_2 = new Port_2();
			port_3 = new Port_3();
			port_4 = new Port_4();
			port_5 = new Port_5();
			port_6 = new Port_6();
			port_7 = new Port_7();
			port_8 = new Port_8();
			port_9 = new Port_9();
			
			peizaji_1 = new Peizaji_1();
			peizaji_2 = new Peizaji_2();
			peizaji_3 = new Peizaji_3();
			peizaji_4 = new Peizaji_4();
			peizaji_5 = new Peizaji_5();
			peizaji_6 = new Peizaji_6();
			peizaji_7 = new Peizaji_7();
			peizaji_8 = new Peizaji_8();
			peizaji_9 = new Peizaji_9();
			
			
			naturmortArray = [nat_1, nat_2, nat_3, nat_4, nat_5, nat_6, nat_7, nat_8, nat_9];
			portArray = [port_1, port_2, port_3, port_4, port_5, port_6, port_7, port_8, port_9];
			peizajiArray = [peizaji_1, peizaji_2, peizaji_3, peizaji_4, peizaji_5, peizaji_6, peizaji_7, peizaji_8, peizaji_9];
			
			masivisArcheva();
		}
		
		private function masivisArcheva():void
		{
			masivebisArray = [naturmortArray, portArray, peizajiArray]
			
			randomPlus = new RandomPlus(2);
			ChosenArrayIndex = randomPlus.getNum();
			trace(ChosenArrayIndex)
			
			allObjects.nat_button_mc.addEventListener(MouseEvent.CLICK, InCorrectFunc);
			allObjects.port_button_mc.addEventListener(MouseEvent.CLICK, InCorrectFunc);
			allObjects.peizaji_button_mc.addEventListener(MouseEvent.CLICK, InCorrectFunc);
			
			if (ChosenArrayIndex == 0)
			{
				allObjects.nat_button_mc.removeEventListener(MouseEvent.CLICK, InCorrectFunc);
				allObjects.nat_button_mc.addEventListener(MouseEvent.CLICK, correctFunc);
			}
			else if (ChosenArrayIndex == 1)
			{
				allObjects.port_button_mc.removeEventListener(MouseEvent.CLICK, InCorrectFunc);
				allObjects.port_button_mc.addEventListener(MouseEvent.CLICK, correctFunc);
			}
			else if (ChosenArrayIndex == 2)
			{
				allObjects.peizaji_button_mc.removeEventListener(MouseEvent.CLICK, InCorrectFunc);
				allObjects.peizaji_button_mc.addEventListener(MouseEvent.CLICK, correctFunc);
			}
			
			ChooseElement(masivebisArray[ChosenArrayIndex])
		}
		
		private function correctFunc(e:MouseEvent):void
		{
			TweenMax.to(e.currentTarget, 1, {glowFilter: {color: 0x91e600, alpha: 1, blurX: 30, blurY: 30, remove: true}});
			CorrecteFunc();
		}
		
		private function InCorrectFunc(e:MouseEvent):void
		{
			TweenMax.to(e.currentTarget, 1, {glowFilter: {color: 0xff0000, alpha: 1, blurX: 30, blurY: 30, remove: true}});
			FalseFunc();
		}
		
		private function ChooseElement(archeuliMasivi):void
		{
			randomPlus = new RandomPlus(8);
			ChosenElementIndex = randomPlus.getNum();
			archeuliMasivi[ChosenElementIndex].x = _stageWidth / 2 - archeuliMasivi[ChosenElementIndex].width / 2;
			archeuliMasivi[ChosenElementIndex].y = _stageHeight / 2 - archeuliMasivi[ChosenElementIndex].height / 1.5;
			
			if (archeuliMasivi[ChosenElementIndex].height > 300)
			{
				archeuliMasivi[ChosenElementIndex].height = 300
				archeuliMasivi[ChosenElementIndex].scaleX = archeuliMasivi[ChosenElementIndex].scaleY;
				archeuliMasivi[ChosenElementIndex].x = _stageWidth / 2 - archeuliMasivi[ChosenElementIndex].width / 2;
				archeuliMasivi[ChosenElementIndex].y = _stageHeight / 2 - archeuliMasivi[ChosenElementIndex].height / 1.5;
				trace("daapatarava")
			}
			trace("ELEMENTIS SIMAGLE >>" + archeuliMasivi[ChosenElementIndex].height)
			trace("BG SIMAGLE >>" + allObjects.bg_mc.height)
			
			addChild(archeuliMasivi[ChosenElementIndex])
			
			dadebuli_MC = archeuliMasivi[ChosenElementIndex]
			trace(dadebuli_MC)
		}
		
		private function addStage():void
		{
			allObjects = new AllObjects();
			addChild(allObjects);
			allObjects.x = _stageWidth / 2;
			allObjects.y = _stageHeight / 2;
			allObjects.height = _stageHeight / 1.5;
			allObjects.scaleX = allObjects.scaleY;
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
		
		}
		
		private function destroy():void
		{
			TweenMax.killAll();
			
			if (allObjects)
			{
				
				allObjects.nat_button_mc.removeEventListener(MouseEvent.CLICK, InCorrectFunc);
				allObjects.port_button_mc.removeEventListener(MouseEvent.CLICK, InCorrectFunc);
				allObjects.peizaji_button_mc.removeEventListener(MouseEvent.CLICK, InCorrectFunc);
				
				removeChild(allObjects);
				allObjects = null;
				
				removeChild(dadebuli_MC)
				dadebuli_MC = null;
			}
			
			exit(null)
		}
		
		private function exit(e:*):void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame"));
			trace(dispatchEvent);
		}
		
		private function CorrecteFunc()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			setTimeout(destroy, 1500)
		}
		
		private function FalseFunc()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("error.mp3", 1);
			addChild(soundControl);
			soundControl.soundPlay();
		}
	
	}

}
