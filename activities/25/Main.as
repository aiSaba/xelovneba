package  {
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class Main extends MovieClip {
		
		private var ClassArr:Array
		private var p1:Picture1;
		private var p2:Picture2;
		private var p3:Picture3;
		private var p4:Picture4;
		private var p5:Picture5;
		private var p6:Picture6;
		
		private var old_X:Number;
		private var old_Y:Number;
		private var colorBox:MovieClip;
		private var randNumb:Number;
		public function Main() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler();
		}
		
		private function initHandler():void 
		{
			colorBox = new ColortransMove();
			p1 = new Picture1(Main_Mc,colorBox);
			p2 = new Picture2(Main_Mc,colorBox);
			p3 = new Picture3(Main_Mc,colorBox);
			p4 = new Picture4(Main_Mc,colorBox);
			p5 = new Picture5(Main_Mc,colorBox);
			p6 = new Picture6(Main_Mc,colorBox);
			
			ClassArr = [p1, p2, p3, p4, p5, p6]
			randNumb = Math.round(Math.random() * 5);
			addChild(ClassArr[randNumb]);
			Main_Mc.picture.colortrans.addEventListener(MouseEvent.MOUSE_DOWN, changePointClick);
			old_X = Main_Mc.picture.closebox.x;
			old_Y = Main_Mc.picture.closebox.y;
			Main_Mc.picture.closebox.addEventListener(MouseEvent.MOUSE_DOWN, closeBoxFunc);
			Main_Mc.picture.TackePic.addEventListener(MouseEvent.MOUSE_DOWN, goHome);
			Main_Mc.picture.gagrdzeleba.addEventListener(MouseEvent.MOUSE_DOWN, EndOfGame);			
		}
		
		private function EndOfGame(e:MouseEvent):void 
		{			
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "EndOfGame"))
			Destroy();
		}
		
		private function closeBoxFunc(e:MouseEvent):void 
		{
			Main_Mc.picture.colortrans.visible = true;
			removeChild(colorBox);
		}
		
		private function changePointClick(e:MouseEvent):void 
		{
			addChild(colorBox);
			Main_Mc.picture.colortrans.visible = false;
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);			
		}
		
		private function mouseMoveHandler(e:MouseEvent):void 
		{			
			colorBox.x = e.stageX - colorBox.width / 2 + 18;
			colorBox.y = e.stageY - colorBox.height / 2 + 15;
		}
		private function goHome(e:MouseEvent):void
		{
			var jpg:Raghats = new Raghats(stage);
			jpg.addEventListener(DataEvent.DATA, jpgListener);
			
		}
		
		private function jpgListener(e:DataEvent):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "EndOfGame"))
			Destroy()
		}
		private function Destroy():void 
		{
			
			removeChild(ClassArr[randNumb]);
			ClassArr[randNumb] = null;
			Main_Mc.visible = false;
			Main_Mc.picture.closebox.removeEventListener(MouseEvent.MOUSE_DOWN, closeBoxFunc);
			Main_Mc.picture.TackePic.removeEventListener(MouseEvent.MOUSE_DOWN, goHome);
			Main_Mc.picture.gagrdzeleba.removeEventListener(MouseEvent.MOUSE_DOWN, EndOfGame);
			Main_Mc.picture.colortrans.addEventListener(MouseEvent.MOUSE_DOWN, changePointClick);
			if (colorBox)
			{
				
				stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
				removeChild(colorBox)
				colorBox = null;
			}
			
		}
		
	}
	
}
