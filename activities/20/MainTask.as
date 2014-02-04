package
{
	
	import com.greensock.motionPaths.MotionPath;
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	
	public class MainTask extends MovieClip
	{
		private var mainObjects:MovieClip;
		
		private var kvadrati:MovieClip;
		private var martkutxedi:MovieClip;
		private var samkutxedi:MovieClip;
		private var rkali:MovieClip;
		private var wre:MovieClip;
		
		private var kvadrati1:MovieClip;
		private var martkutxedi1:MovieClip;
		private var samkutxedi1:MovieClip;
		private var rkali1:MovieClip;
		private var wre1:MovieClip;
		
		private var witeli:MovieClip;
		private var witeliG:MovieClip;
		private var vardisferi:MovieClip;
		private var yvigetliG:MovieClip;
		private var stafilosferi:MovieClip;
		private var yviteli:MovieClip;
		private var lurjiM:MovieClip;
		private var lurji:MovieClip;
		private var cisferi:MovieClip;
		
		private var objectsArray:Array;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		private var colorArr:Array;
		private var colorTranform:ColorTransform;
		private var currentMc:MovieClip;
		private var counter:Number = 0;
		public function MainTask(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (mainObjects)
			{
				removeChild(mainObjects);
				mainObjects = null;
			}
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		
		private function addObjects():void
		{
			setTimeout(butVisible,5)
			mainObjects = new MainObjects();
			mainObjects.x = _stageWidth / 2;
			mainObjects.y = _stageHeight / 2;
			mainObjects.alpha = 0;
			addChild(mainObjects);
			TweenMax.to(mainObjects, 1, {alpha: 1});
			mainObjects.height = _stageHeight / 1.5;
			mainObjects.scaleX = mainObjects.scaleY;
			colorTranform = new ColorTransform();
			
			///////////////////////////////////////////
			kvadrati = mainObjects.kvadrati;
			martkutxedi = mainObjects.martkutxedi;
			samkutxedi = mainObjects.samkutxedi;
			rkali = mainObjects.rkali;
			wre = mainObjects.wre;
			//////////////////////////////////////////
			witeli = mainObjects.colors.witeli;
			witeliG = mainObjects.colors.witeliG;
			vardisferi = mainObjects.colors.vardisferi;
			yvigetliG = mainObjects.colors.yvigetliG;
			stafilosferi = mainObjects.colors.stafilosferi;
			yviteli = mainObjects.colors.yviteli;
			lurjiM = mainObjects.colors.lurjiM;
			lurji = mainObjects.colors.lurji;
			cisferi = mainObjects.colors.cisferi;
			//////////////////////////////////////////
			colorArr = [witeli, witeliG, vardisferi, yvigetliG, stafilosferi, yviteli, lurjiM, lurji, cisferi];
			objectsArray = [kvadrati, martkutxedi, samkutxedi, rkali, wre];
			for (var j:int = 0; j < colorArr.length; j++)
			{
				colorArr[j].addEventListener(MouseEvent.MOUSE_DOWN, changeColor);
			}
			for (var i:int = 0; i < objectsArray.length; i++)
			{
				objectsArray[i].buttonMode = true;
				objectsArray[i].addEventListener(MouseEvent.MOUSE_DOWN, addToScene);
			}
			mainObjects.takePhoto.addEventListener(MouseEvent.MOUSE_DOWN, takePhotoFunc);
			mainObjects.zoomIn.addEventListener(MouseEvent.MOUSE_DOWN, zoomInFunc);
			mainObjects.zoomOut.addEventListener(MouseEvent.MOUSE_DOWN, zoomOutFunc);
		}
		
		private function zoomOutFunc(e:MouseEvent):void 
		{
			for (var i:int = 1; i <=counter; i++) 
			{
				mainObjects.board.getChildAt(i).scaleX = 1;
				mainObjects.board.getChildAt(i).scaleY = 1;
			}
		
		}
		
		private function zoomInFunc(e:MouseEvent):void 
		{
			for (var i:int = 1; i <=counter; i++) 
			{
				mainObjects.board.getChildAt(i).scaleX = 1.5;
				mainObjects.board.getChildAt(i).scaleY = 1.5;
			}
		}
		
		private function butVisible():void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
		}
		
		private function changeColor(e:MouseEvent):void
		{
			trace(e.currentTarget.name)
			switch (e.currentTarget.name)
			{
				case 'witeli': 
					colorTranform.color = 0xE12229;
					break;
				case 'witeliG': 
					colorTranform.color = 0xEB5157;
					break;
				case 'vardisferi': 
					colorTranform.color = 0xF47E82;
					break;
				case 'yvigetliG': 
					colorTranform.color = 0xFFD186;
					break;
				case 'stafilosferi': 
					colorTranform.color = 0xFF5A19;
					break;
				case 'yviteli': 
					colorTranform.color = 0xFFB12A;
					break;
				case 'lurjiM':
					colorTranform.color = 0x170C66;
					break;
				case 'cisferi': 
					colorTranform.color = 0x43CEF0;
					break;
				case 'lurji':
					colorTranform.color = 0x0072C0;
					break;
			}
			currentMc.transform.colorTransform = colorTranform;
		}
		
		private function addToScene(e:MouseEvent):void
		{
			counter++;
			switch (e.currentTarget)
			{
				case kvadrati: 
					kvadrati1 = new Kvadrati();
					mainObjects.board.addChild(kvadrati1);
					coordinateMc(kvadrati1);
					kvadrati1.addEventListener(MouseEvent.MOUSE_DOWN, startDragFunc)
					kvadrati1.addEventListener(MouseEvent.MOUSE_UP, stopDragFunc);
					break;
				case martkutxedi: 
					martkutxedi1 = new Martkutxedi();
					mainObjects.board.addChild(martkutxedi1);
					coordinateMc(martkutxedi1);
					martkutxedi1.addEventListener(MouseEvent.MOUSE_DOWN, startDragFunc)
					martkutxedi1.addEventListener(MouseEvent.MOUSE_UP, stopDragFunc);
					break;
				case samkutxedi: 
					samkutxedi1 = new Samkutxedi();
					mainObjects.board.addChild(samkutxedi1);
					coordinateMc(samkutxedi1);
					samkutxedi1.addEventListener(MouseEvent.MOUSE_DOWN, startDragFunc)
					samkutxedi1.addEventListener(MouseEvent.MOUSE_UP, stopDragFunc);
					break;
				case rkali: 
					rkali1 = new Rkali();
					mainObjects.board.addChild(rkali1);
					coordinateMc(rkali1);
					rkali1.addEventListener(MouseEvent.MOUSE_DOWN, startDragFunc)
					rkali1.addEventListener(MouseEvent.MOUSE_UP, stopDragFunc);
					break;
				case wre: 
					wre1 = new Wre();
					mainObjects.board.addChild(wre1);
					coordinateMc(wre1);
					wre1.addEventListener(MouseEvent.MOUSE_DOWN, startDragFunc)
					wre1.addEventListener(MouseEvent.MOUSE_UP, stopDragFunc);
					break;
			
			}
			
		}
		
		private function takePhotoFunc(e:MouseEvent):void
		{
			var scr:Raghats = new Raghats(stage);
			scr.addEventListener(DataEvent.DATA, scrListener);
			//addChild(scr);
		}
		
		private function scrListener(e:DataEvent):void
		{
			if (e.data == "sheinaxa")
			{
				setTimeout(function()
					{
						dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame"));
						destroy(null);
					}, 1000);
			}
		
		}
		
		private function coordinateMc(mc:MovieClip):void
		{
			mc.x = mouseX-_stageWidth/2;
			mc.y = mouseY-_stageHeight/2;
		}
		
		private function startDragFunc(e:MouseEvent):void
		{
			currentMc = e.currentTarget as MovieClip;
			e.currentTarget.startDrag();
		}
		
		private function stopDragFunc(e:MouseEvent):void
		{
			e.currentTarget.stopDrag();
		}
	}

}
