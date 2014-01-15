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
		
		private var stage_1:MovieClip;
		private var stage_2:MovieClip;
		private var stage_3:MovieClip;
		private var stage_4:MovieClip;
		private var stage_5:MovieClip;
		

		
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
			
			StagesArray = [stage_1, stage_2, stage_3, stage_4, stage_5]
			
			addStageRandomly();
			
		}
		
		private function addStageRandomly():void
		{
			
			randomPlus = new RandomPlus(4);
			StageRandomIndex = randomPlus.getNum();
			

			addChild(StagesArray[StageRandomIndex]);
			StagesArray[StageRandomIndex].x = _stageWidth / 2;
			StagesArray[StageRandomIndex].y = _stageHeight / 2;
			StagesArray[StageRandomIndex].height = _stageHeight / 1.5;
			StagesArray[StageRandomIndex].scaleX = StagesArray[StageRandomIndex].scaleY;
			
			addListeners();
		}
		
		private function IncorrectFunc (e:MouseEvent):void
		{
			
		TweenMax.to(e.currentTarget, 1, { glowFilter: { color: 0xff0000, alpha: 1, blurX: 30, blurY: 30, remove: true }} );
			FalseFunc();
		}
		
		private function correctFunc (e:MouseEvent):void
		{
			
			TweenMax.to(e.currentTarget, 1, { glowFilter: { color: 0x91e600, alpha: 1, blurX: 30, blurY: 30, remove: true }} );
			CorrecteFunc();
		}
		
		
		private function addListeners ():void
		{
			StagesArray[StageRandomIndex].Incorrect_mc_1.addEventListener (MouseEvent.MOUSE_DOWN, IncorrectFunc)
			StagesArray[StageRandomIndex].Incorrect_mc_2.addEventListener (MouseEvent.MOUSE_DOWN, IncorrectFunc)
			StagesArray[StageRandomIndex].Incorrect_mc_3.addEventListener (MouseEvent.MOUSE_DOWN, IncorrectFunc)
			StagesArray[StageRandomIndex].correct_mc.addEventListener (MouseEvent.MOUSE_DOWN, correctFunc)
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
		
		private function destroy ():void
		{
			StagesArray[StageRandomIndex].Incorrect_mc_1.removeEventListener (MouseEvent.MOUSE_DOWN, IncorrectFunc)
			StagesArray[StageRandomIndex].Incorrect_mc_2.removeEventListener (MouseEvent.MOUSE_DOWN, IncorrectFunc)
			StagesArray[StageRandomIndex].Incorrect_mc_3.removeEventListener (MouseEvent.MOUSE_DOWN, IncorrectFunc)
			StagesArray[StageRandomIndex].correct_mc.removeEventListener (MouseEvent.MOUSE_DOWN, correctFunc)
			
			removeChild(StagesArray[StageRandomIndex]);
			StagesArray[StageRandomIndex] = null;
			
			exit(null)
		}
		
		private function exit(e:*):void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
			trace(dispatchEvent)
		}
		
	}

}
