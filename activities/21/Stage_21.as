package
{
	
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	public class Stage_21 extends MovieClip
	{
		
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var allObjects:MovieClip;
		
		private var randomPlus:RandomPlus;
		private var soundControl:SoundControl;
		
		private var ChosenArrayIndex:int;
		private var ChosenElementIndex:int;
		var dadebuli_MC:MovieClip
		
		private var arcArray:Array;
		private var graphArray:Array;
		private var qandArray:Array;
		private var perweraArray:Array;
		
		private var masivebisArray:Array;
		
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
		
		private var qand_1:MovieClip;
		private var qand_2:MovieClip;
		private var qand_3:MovieClip;
		private var qand_4:MovieClip;
		private var qand_5:MovieClip;
		private var qand_6:MovieClip;
		private var qand_7:MovieClip;
		private var qand_8:MovieClip;
		private var qand_9:MovieClip;
		
		private var perwera_1:MovieClip;
		private var perwera_2:MovieClip;
		private var perwera_3:MovieClip;
		private var perwera_4:MovieClip;
		private var perwera_5:MovieClip;
		private var perwera_6:MovieClip;
		private var perwera_7:MovieClip;
		private var perwera_8:MovieClip;
		private var perwera_9:MovieClip;
		
		public function Stage_21(_stageWidth:Number = 1024, _stageHeight:Number = 768)
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
			
			qand_1 = new Qand_1();
			qand_2 = new Qand_2();
			qand_3 = new Qand_3();
			qand_4 = new Qand_4();
			qand_5 = new Qand_5();
			qand_6 = new Qand_6();
			qand_7 = new Qand_7();
			qand_8 = new Qand_8();
			qand_9 = new Qand_9();
			
			perwera_1 = new Perwera_1();
			perwera_2 = new Perwera_2();
			perwera_3 = new Perwera_3();
			perwera_4 = new Perwera_4();
			perwera_5 = new Perwera_5();
			perwera_6 = new Perwera_6();
			perwera_7 = new Perwera_7();
			perwera_8 = new Perwera_8();
			perwera_9 = new Perwera_9();
			
			arcArray = [arc_1, arc_2, arc_3, arc_4, arc_5, arc_6, arc_7, arc_8, arc_9];
			graphArray = [graph_1, graph_2, graph_3, graph_4, graph_5, graph_6, graph_7, graph_8, graph_9];
			qandArray = [qand_1, qand_2, qand_3, qand_4, qand_5, qand_6, qand_7, qand_8, qand_9];
			perweraArray = [perwera_1, perwera_2, perwera_3, perwera_4, perwera_5, perwera_6, perwera_7, perwera_8, perwera_9];
			
			masivisArcheva();
		}
		
		private function masivisArcheva():void
		{
			masivebisArray = [arcArray, graphArray, qandArray, perweraArray]
			
			randomPlus = new RandomPlus(3);
			ChosenArrayIndex = randomPlus.getNum();
			trace(ChosenArrayIndex)
			
			allObjects.arc_button_mc.addEventListener(MouseEvent.CLICK, InCorrectFunc);
			allObjects.graphic_button_mc.addEventListener(MouseEvent.CLICK, InCorrectFunc);
			allObjects.qandakeba_button_mc.addEventListener(MouseEvent.CLICK, InCorrectFunc);
			allObjects.perwera_button_mc.addEventListener(MouseEvent.CLICK, InCorrectFunc);
			
			if (ChosenArrayIndex == 0)
			{
				allObjects.arc_button_mc.removeEventListener(MouseEvent.CLICK, InCorrectFunc);
				allObjects.arc_button_mc.addEventListener(MouseEvent.CLICK, correctFunc);
			}
			else if (ChosenArrayIndex == 1)
			{
				allObjects.graphic_button_mc.removeEventListener(MouseEvent.CLICK, InCorrectFunc);
				allObjects.graphic_button_mc.addEventListener(MouseEvent.CLICK, correctFunc);
			}
			else if (ChosenArrayIndex == 2)
			{
				allObjects.qandakeba_button_mc.removeEventListener(MouseEvent.CLICK, InCorrectFunc);
				allObjects.qandakeba_button_mc.addEventListener(MouseEvent.CLICK, correctFunc);
			}
			else if (ChosenArrayIndex == 3)
			{
				allObjects.perwera_button_mc.removeEventListener(MouseEvent.CLICK, InCorrectFunc);
				allObjects.perwera_button_mc.addEventListener(MouseEvent.CLICK, correctFunc);
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
			
			if (archeuliMasivi[ChosenElementIndex].height > 400)
			{
				archeuliMasivi[ChosenElementIndex].height = 350
				archeuliMasivi[ChosenElementIndex].scaleX = archeuliMasivi[ChosenElementIndex].scaleY;
				archeuliMasivi[ChosenElementIndex].x = _stageWidth / 2 - archeuliMasivi[ChosenElementIndex].width / 2;
				archeuliMasivi[ChosenElementIndex].y = _stageHeight / 2 - archeuliMasivi[ChosenElementIndex].height / 1.5;
				trace("daapatarava")
			}
			addChild(archeuliMasivi[ChosenElementIndex])
			
			dadebuli_MC = archeuliMasivi[ChosenElementIndex]
			//var heli:Helicopter = new Helicopter();
			
			//var dadebuli_MC:archeuliMasivi[ChosenElementIndex] = new archeuliMasivi[ChosenElementIndex]();
			
			//dadebuli_MC = addChild(archeuliMasivi[ChosenElementIndex])
			
			trace(dadebuli_MC)
		}
		
		private function addStage():void
		{
			setTimeout(butVis,5)
			allObjects = new AllObjects();
			addChild(allObjects);
			allObjects.x = _stageWidth / 2;
			allObjects.y = _stageHeight / 2;
			allObjects.height = _stageHeight / 1.5;
			allObjects.scaleX = allObjects.scaleY;
		}
		
		private function butVis():void 
		{
			trace("inc")
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
		}
		
		private function destroy():void
		{
			TweenMax.killAll();
			
			if (allObjects)
			{
				
				allObjects.arc_button_mc.removeEventListener(MouseEvent.CLICK, InCorrectFunc);
				allObjects.graphic_button_mc.removeEventListener(MouseEvent.CLICK, InCorrectFunc);
				allObjects.qandakeba_button_mc.removeEventListener(MouseEvent.CLICK, InCorrectFunc);
				allObjects.perwera_button_mc.removeEventListener(MouseEvent.CLICK, InCorrectFunc);
				
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
