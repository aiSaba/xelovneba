package
{
	
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	public class Stage_18_V2 extends MovieClip
	{
		
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var allObjects:MovieClip;
		private var randomPlus:RandomPlus;
		private var soundControl:SoundControl;
		private var StagesArray:Array;
		private var StageRandomIndex:int;
		private var correctCounter:int;
		private var oldStageRandomIndex:int;
		
		private var stage_1:MovieClip;
		private var stage_2:MovieClip;
		private var stage_3:MovieClip;
		private var stage_4:MovieClip;
		private var stage_5:MovieClip;
		private var stage_6:MovieClip;
		private var stage_7:MovieClip;
		private var stage_8:MovieClip;
		private var stage_9:MovieClip;
		
		

		
		public function Stage_18_V2(_stageWidth:Number = 1024, _stageHeight:Number = 768)
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
			stage_1 = new Stage_1();
			stage_2 = new Stage_2();
			stage_3 = new Stage_3();
			stage_4 = new Stage_4();
			stage_5 = new Stage_5();
			stage_6 = new Stage_6();
			stage_7 = new Stage_7();
			stage_8 = new Stage_8();
			stage_9 = new Stage_9();
			
			StagesArray = [stage_1, stage_2, stage_3, stage_4, stage_5, stage_6, stage_7, stage_8, stage_9]
			
			addStageRandomly();
			
		}
		
		private function getRandomIndex ():void
		{
			oldStageRandomIndex = StageRandomIndex;
			trace ("oldStageRandomIndex: " + oldStageRandomIndex)
			
			
			randomPlus = new RandomPlus(8);
			StageRandomIndex = randomPlus.getNum();
			trace ("StageRandomIndex: " + StageRandomIndex)
			
			if (oldStageRandomIndex == StageRandomIndex)
			{

				getRandomIndex();
			}
		}
		
		private function addStageRandomly():void
		{
			
				getRandomIndex();
			

			addChild(StagesArray[StageRandomIndex]);
			StagesArray[StageRandomIndex].x = _stageWidth / 2;
			StagesArray[StageRandomIndex].y = _stageHeight / 2;
			StagesArray[StageRandomIndex].height = _stageHeight / 1.5;
			StagesArray[StageRandomIndex].scaleX = StagesArray[StageRandomIndex].scaleY;
			
			addListeners();
			
			StagesArray[StageRandomIndex].Incorrect_mc_1.textBox.alpha = 0;
			StagesArray[StageRandomIndex].Incorrect_mc_2.textBox.alpha = 0;
			StagesArray[StageRandomIndex].Incorrect_mc_3.textBox.alpha = 0;
			StagesArray[StageRandomIndex].correct_mc.textBox.alpha = 0;
		}
		
		private function IncorrectFunc (e:MouseEvent):void
		{
			showTextFunc(e);
		TweenMax.to(e.currentTarget, 1, { glowFilter: { color: 0xff0000, alpha: 1, blurX: 30, blurY: 30, remove: true }} );
			FalseFunc();
		}
		
		private function correctFunc (e:MouseEvent):void
		{
			showTextFunc(e);
			TweenMax.to(e.currentTarget, 1, { glowFilter: { color: 0x91e600, alpha: 1, blurX: 30, blurY: 30, remove: true }} );
			CorrecteFunc();
		}
		
		
		private function addListeners ():void
		{
			StagesArray[StageRandomIndex].Incorrect_mc_1.addEventListener (MouseEvent.MOUSE_DOWN, IncorrectFunc)
			StagesArray[StageRandomIndex].Incorrect_mc_2.addEventListener (MouseEvent.MOUSE_DOWN, IncorrectFunc)
			StagesArray[StageRandomIndex].Incorrect_mc_3.addEventListener (MouseEvent.MOUSE_DOWN, IncorrectFunc)
			StagesArray[StageRandomIndex].correct_mc.addEventListener (MouseEvent.MOUSE_DOWN, correctFunc)
			
			StagesArray[StageRandomIndex].Incorrect_mc_1.addEventListener (MouseEvent.MOUSE_UP, hideTextFunc)
			StagesArray[StageRandomIndex].Incorrect_mc_2.addEventListener (MouseEvent.MOUSE_UP, hideTextFunc)
			StagesArray[StageRandomIndex].Incorrect_mc_3.addEventListener (MouseEvent.MOUSE_UP, hideTextFunc)
			StagesArray[StageRandomIndex].correct_mc.addEventListener (MouseEvent.MOUSE_UP, hideTextFunc)
			
			
			StagesArray[StageRandomIndex].Incorrect_mc_1.buttonMode = true;
			StagesArray[StageRandomIndex].Incorrect_mc_2.buttonMode = true;
			StagesArray[StageRandomIndex].Incorrect_mc_3.buttonMode = true;
			StagesArray[StageRandomIndex].correct_mc.buttonMode = true;
		}
	
		
		private function CorrecteFunc()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			
			correctCounter++
			if (correctCounter == 3)
			{
				ClapFunc();
				setTimeout(destroy, 1500)
				exit(null)
				return
			}
			setTimeout(destroy, 500)
			setTimeout(allFunc, 501)
			
			
		}
		
		
		
		private function showTextFunc(e:MouseEvent):void
		{
			TweenLite.to(e.currentTarget.textBox, 0.5, {alpha: 1});
		}
		
		private function hideTextFunc(e:MouseEvent):void
		{
			setTimeout(gaaqre, 1500, e.currentTarget)
		}
		
		private function gaaqre(Target):void
		{
			
			TweenLite.to(Target.textBox, 0.5, {alpha: 0});
		}
		
		private function FalseFunc()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("error.mp3", 1);
			addChild(soundControl);
			soundControl.soundPlay();
		}
		
				
			private function ClapFunc()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("clap.mp3", 1);
			addChild(soundControl);
			soundControl.soundPlay();
		}
		
		private function destroy ():void
		{
			StagesArray[StageRandomIndex].Incorrect_mc_1.removeEventListener (MouseEvent.MOUSE_DOWN, IncorrectFunc)
			StagesArray[StageRandomIndex].Incorrect_mc_2.removeEventListener (MouseEvent.MOUSE_DOWN, IncorrectFunc)
			StagesArray[StageRandomIndex].Incorrect_mc_3.removeEventListener (MouseEvent.MOUSE_DOWN, IncorrectFunc)
			StagesArray[StageRandomIndex].correct_mc.removeEventListener (MouseEvent.MOUSE_DOWN, correctFunc)
			
			removeChild(StagesArray[StageRandomIndex]);
			StagesArray[StageRandomIndex] = null;
			
			
		}
		
		private function exit(e:*):void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
			trace(dispatchEvent)
		}
		
	}

}
