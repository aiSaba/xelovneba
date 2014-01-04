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
		private var arcArray:Array;
		
		private var RandomIndexArray:Array;
		
		private var NatRandom_1:int;
		private var ArcRandom:int;
		private var NatRandom_3:int;
		private var NatRandom_4:int;
		
		private var nat_1:MovieClip;
		private var nat_2:MovieClip;
		private var nat_3:MovieClip;
		private var nat_4:MovieClip;
		private var nat_5:MovieClip;
		private var nat_6:MovieClip;
		private var nat_7:MovieClip;
		private var nat_8:MovieClip;
		private var nat_9:MovieClip;
		
		private var arc_1:MovieClip;
		private var arc_2:MovieClip;
		private var arc_3:MovieClip;
		private var arc_4:MovieClip;
		private var arc_5:MovieClip;
		private var arc_6:MovieClip;
		private var arc_7:MovieClip;
		private var arc_8:MovieClip;
		private var arc_9:MovieClip;
		
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
			
			arc_1 = new Arc_1();
			arc_2 = new Arc_2();
			arc_3 = new Arc_3();
			arc_4 = new Arc_4();
			arc_5 = new Arc_5();
			arc_6 = new Arc_6();
			arc_7 = new Arc_7();
			arc_8 = new Arc_8();
			arc_9 = new Arc_9();
			
			naturmortArray = [nat_1, nat_2, nat_3, nat_4, nat_5, nat_6, nat_7, nat_8, nat_9]
			arcArray = [arc_1, arc_2, arc_3, arc_4, arc_5, arc_6, arc_7, arc_8, arc_9]
			
			randomPlus = new RandomPlus(8);
			NatRandom_1 = randomPlus.getNum();
			trace (NatRandom_1)
			
			randomPlus = new RandomPlus(8);
			ArcRandom = randomPlus.getNum();
			trace (ArcRandom)
			
			randomPlus = new RandomPlus(8);
			NatRandom_3 = randomPlus.getNum();
			trace (NatRandom_3)
			
			randomPlus = new RandomPlus(8);
			NatRandom_4 = randomPlus.getNum();
			trace (NatRandom_4)
			
			addObject(NatRandom_1, ArcRandom, NatRandom_3, NatRandom_4);
			
		}
		

		private function addObject(RandomIndex_1, RandomIndex_2, RandomIndex_3, RandomIndex_4):void
		{
			RandomIndexArray = [RandomIndex_1, RandomIndex_2, RandomIndex_3, RandomIndex_4]
			
			for (var i:int = 0; i < RandomIndexArray.length; i++ )
			{
			naturmortArray[RandomIndexArray[i]].x = _stageWidth / 2 + allObjects.Xpos_mc.x +20 ;
			naturmortArray[RandomIndexArray[i]].y = _stageHeight / 2 - 14.5;
			naturmortArray[RandomIndexArray[i]].height = 207.75 //_stageHeight / 4.5;
			naturmortArray[RandomIndexArray[i]].scaleX = naturmortArray[RandomIndexArray[i]].scaleY;
			trace (naturmortArray[RandomIndexArray[i]].x)
			addChild (naturmortArray[RandomIndexArray[i]])
			trace ("dado" + i)
			}
			
			
		}

		
		private function addStage():void
		{
			allObjects = new AllObjects();
			addChild(allObjects);
			allObjects.x = _stageWidth / 2;
			allObjects.y = _stageHeight / 2;
			allObjects.height = _stageHeight / 1.5;
			allObjects.scaleX = allObjects.scaleY;
			allObjects.Xpos_mc.visible = false;
		}
		

	
	}

}
