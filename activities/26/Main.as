package  {
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	
	
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
		private var qula:int;
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
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
			Main_Mc.x = stage.stageWidth / 2;
			Main_Mc.y = stage.stageHeight / 2;
			Main_Mc.height = stage.stageHeight / 1.3;
			Main_Mc.scaleX = Main_Mc.scaleY;
			colorBox = new ColortransMove();
			colorBox.width = colorBox.width / 2;
			colorBox.height = colorBox.height / 2;
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
			
			
		}	
		
		private function closeBoxFunc(e:MouseEvent):void 
		{
			Main_Mc.picture.colortrans.visible = true;
			removeChild(colorBox);
			Mouse.show();
		}
		
		private function changePointClick(e:MouseEvent):void 
		{
			addChild(colorBox);
			Mouse.hide();
			Main_Mc.picture.colortrans.visible = false;
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);			
		}
		
		private function mouseMoveHandler(e:MouseEvent):void 
		{
			
			colorBox.x = e.stageX - colorBox.width / 2 //+ 20;
			colorBox.y = e.stageY - colorBox.height / 2 + 6;
		}
		private function goHome(e:MouseEvent):void
		{
			var jpg:Raghats = new Raghats(stage);			
		}	
		private function Destroy():void 
		{
			
			removeChild(ClassArr[randNumb]);
			ClassArr[randNumb] = null;
			Main_Mc.visible = false;
			Main_Mc.picture.closebox.removeEventListener(MouseEvent.MOUSE_DOWN, closeBoxFunc);
			Main_Mc.picture.TackePic.removeEventListener(MouseEvent.MOUSE_DOWN, goHome);
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
