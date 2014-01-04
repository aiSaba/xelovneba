package
{
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	public class Stage_18 extends MovieClip
	{
		
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var allObjects:MovieClip;
		private var randomPlus:RandomPlus;
		private var soundControl:SoundControl;
		private var naturmortArray:Array;
		
		private var NatRandom:int;
		
		private var nat_i:MovieClip;
		private var	Nat_i:MovieClip;
		private var nat_1:MovieClip;
		private var nat_2:MovieClip;
		private var nat_3:MovieClip;
		private var nat_4:MovieClip;
		private var nat_5:MovieClip;
		private var nat_6:MovieClip;
		private var nat_7:MovieClip;
		private var nat_8:MovieClip;
		private var nat_9:MovieClip;
		
		public function Stage_18(_stageWidth:Number = 1024, _stageHeight:Number = 768)
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

			/*for (var i:int = 0; i < naturmortArray.length; i++ )
			{
				naturmortArray[i].y = -14, 5
			}*/
			
			
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
			
			naturmortArray = [nat_1, nat_2, nat_3, nat_4, nat_5, nat_6, nat_7, nat_8, nat_9]
			
			randomPlus = new RandomPlus(8);
			NatRandom = randomPlus.getNum();
			trace (NatRandom)
			
				
			naturmortArray[NatRandom].x = _stageWidth / 2;
			naturmortArray[NatRandom].y = _stageHeight / 2;
			naturmortArray[NatRandom].height = _stageHeight / 4.5;
			naturmortArray[NatRandom].scaleX = naturmortArray[NatRandom].scaleY;
			
			addChild (naturmortArray[NatRandom])
		}
		

		

		
		private function addStage():void
		{
			allObjects = new AllObjects();
			addChild(allObjects);
			allObjects.x = _stageWidth / 2;
			allObjects.y = _stageHeight / 2;
			allObjects.height = _stageHeight / 1.5;
			allObjects.scaleX = allObjects.scaleY;
		}
		

	
	}

}
