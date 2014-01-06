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
		private var graphArray:Array;
		private var portArray:Array;
		private var FinalArray:Array = new Array();;
		
		private var RandomArray:Array;
		private var RandomIndexArray:Array;
		
		private var NatRandom:int;
		private var ArcRandom:int;
		private var GraphRandom:int;
		private var PortRandom:int;
		private var FirstRandom:int;
		private var SecondRandom:int;
		private var FirstRandomObject:int;
		private var SecondRandomObject:int;
		
		
		
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
		
		
		private var graph_1:MovieClip;
		private var graph_2:MovieClip;
		private var graph_3:MovieClip;
		private var graph_4:MovieClip;
		private var graph_5:MovieClip;
		private var graph_6:MovieClip;
		private var graph_7:MovieClip;
		private var graph_8:MovieClip;
		private var graph_9:MovieClip;
		
		
		private var port_1:MovieClip;
		private var port_2:MovieClip;
		private var port_3:MovieClip;
		private var port_4:MovieClip;
		private var port_5:MovieClip;
		private var port_6:MovieClip;
		private var port_7:MovieClip;
		private var port_8:MovieClip;
		private var port_9:MovieClip;
		
		
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
			
			
			graph_1 = new Graph_1();
			graph_2 = new Graph_2();
			graph_3 = new Graph_3();
			graph_4 = new Graph_4();
			graph_5 = new Graph_5();
			graph_6 = new Graph_6();
			graph_7 = new Graph_7();
			graph_8 = new Graph_8();
			graph_9 = new Graph_9();
			
			port_1 = new Port_1();
			port_2 = new Port_2();
			port_3 = new Port_3();
			port_4 = new Port_4();
			port_5 = new Port_5();
			port_6 = new Port_6();
			port_7 = new Port_7();
			port_8 = new Port_8();
			port_9 = new Port_9();
			
			naturmortArray = [nat_1, nat_2, nat_3, nat_4, nat_5, nat_6, nat_7, nat_8, nat_9];
			arcArray = [arc_1, arc_2, arc_3, arc_4, arc_5, arc_6, arc_7, arc_8, arc_9];
			graphArray = [graph_1, graph_2, graph_3, graph_4, graph_5, graph_6, graph_7, graph_8, graph_9];
			portArray = [port_1, port_2, port_3, port_4, port_5, port_6, port_7, port_8, port_9];
			
			randomPlus = new RandomPlus(8);
			NatRandom = randomPlus.getNum();
			
			
			randomPlus = new RandomPlus(8);
			ArcRandom = randomPlus.getNum();
			
			
			randomPlus = new RandomPlus(8);
			GraphRandom = randomPlus.getNum();
			
			
			randomPlus = new RandomPlus(8);
			PortRandom = randomPlus.getNum();
			
			First_SecondMIx();
			
			choosingFunc(FirstRandom, SecondRandom);

			
			addObject(FinalArray[0], FinalArray[1], FinalArray[2], FinalArray[3]);
			//addObject(NatRandom, ArcRandom, GraphRandom, PortRandom);
			
		}
		
		private function First_SecondMIx ():void
		{
			////  masivebis asarevad....
			randomPlus = new RandomPlus(3);
			FirstRandom = randomPlus.getNum();
			trace  (FirstRandom)
			
			randomPlus = new RandomPlus(3);
			SecondRandom = randomPlus.getNum();
			trace (SecondRandom)
			/////
			
			if (FirstRandom == SecondRandom)
			{
				First_SecondMIx();
			}
			
		}
		
		
		// irchevs    4 masividan romeli   2 is elementebi daideba ekranze

		private function  choosingFunc (FirstArray , SecondArray):void
		
		{
			RandomArray = [naturmortArray, arcArray, graphArray, portArray]
			
			for (var i:int = 0; i < 3; i++ )
			{
			randomPlus = new RandomPlus(8);
			FirstRandomObject = randomPlus.getNum();
			FinalArray.push (RandomArray [FirstArray][FirstRandomObject])
			trace (FinalArray)
			}
			
			FinalArray.push (RandomArray [SecondArray][SecondRandom])
			
			trace (FinalArray)
			// FinalArray aris is rac bolos unda daidos...
			
		}
		
		

		/// function romelsac gadaecema  4  mc , itvlis da  kribavs suratebis zomebs (mxolod x gerdzis(width), radgan y mudmivia)  , jams  adarebs   charchos zomas da debs im shemtxvevashi tu eteva.
		private function addObject(RandomIndex_1, RandomIndex_2, RandomIndex_3, RandomIndex_4):void
		{
			RandomIndexArray = [RandomIndex_1, RandomIndex_2, RandomIndex_3, RandomIndex_4]
			
			for (var i:int = 0; i < RandomIndexArray.length; i++ )
			{
				
				
				
			RandomIndexArray[i].x = _stageWidth / 2 + allObjects.Xpos_mc.x +30 ;
			if (i > 0)
			{
			RandomIndexArray[i].x = RandomIndexArray[i-1].x  + RandomIndexArray[i-1].width + 30
			}
			
			RandomIndexArray[i].y = _stageHeight / 2 - 14.5;
			RandomIndexArray[i].height = 207.75 //_stageHeight / 4.5;
			RandomIndexArray[i].scaleX = RandomIndexArray[i].scaleY;
			addChild(RandomIndexArray[i])
				if (RandomIndexArray[0].width + RandomIndexArray[1].width + RandomIndexArray[2].width + RandomIndexArray[3].width + 4*30  > allObjects.Fullwidth.width)
				{
					
/*					
			FinalArray.length = 0
					
			First_SecondMIx();
			
			choosingFunc(FirstRandom, SecondRandom);

			addObject(FinalArray[0], FinalArray[1], FinalArray[2], FinalArray[3]);*/
			
					
					
					
					trace ("AR ETEVAAAAAAA")
				}
				else
				{
				addChild(RandomIndexArray[i])
				}
			
			
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
