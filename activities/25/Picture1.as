package
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.ui.Mouse;
	
	public class Picture1 extends MovieClip
	{		
		private var color:ColorTransform;
		private var arr:Array;
		private var Main_Mc;
		private var Box;
		public function Picture1(Main_Mc,Box)
		{
			this.Box = Box;
			this.Main_Mc = Main_Mc;
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, Destroy)
		}
		
		private function Destroy(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, Destroy);
		
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler();
		}
		
		private function initHandler():void
		{	
			Main_Mc.picture2.visible = false;
			Main_Mc.picture3.visible = false;
			Main_Mc.picture4.visible = false;
			Main_Mc.picture5.visible = false;
			Main_Mc.picture6.visible = false;
			for (var i:int = 1; i <= 16; i++) 
			{
				Main_Mc.picture.hot['color'+i].addEventListener(MouseEvent.MOUSE_DOWN, changeColor);
			}
			arr = [1,0xE12229,0xEB5157,0xF47E82,0xFAABAD,0xFF5A19, 0xFF7C4C, 0xFF9D7B, 0xFFBEA7,0xFF9400,0xFFAB41,0xFFBF75,0xFFD5A4,0xFFB12A,0xFFC15B,0xFFD186,0xFFEFD8];
			color = new ColorTransform();
			Main_Mc.picture1.background.addEventListener(MouseEvent.MOUSE_DOWN, objColors);
			Main_Mc.picture1.chiqa1.addEventListener(MouseEvent.MOUSE_DOWN, objColors);
			Main_Mc.picture1.chiqa2.addEventListener(MouseEvent.MOUSE_DOWN, objColors);
			Main_Mc.picture1.chiqa3.addEventListener(MouseEvent.MOUSE_DOWN, objColors);
			Main_Mc.picture1.skami.addEventListener(MouseEvent.MOUSE_DOWN, objColors);
			Main_Mc.picture1.tefshi2.addEventListener(MouseEvent.MOUSE_DOWN, objColors);
			Main_Mc.picture1.sufra.addEventListener(MouseEvent.MOUSE_DOWN, objColors);
			Main_Mc.picture1.limoni1.addEventListener(MouseEvent.MOUSE_DOWN, objColors);
			Main_Mc.picture1.limoni2.addEventListener(MouseEvent.MOUSE_DOWN, objColors);
			Main_Mc.picture1.tefshi.addEventListener(MouseEvent.MOUSE_DOWN, objColors);
			Main_Mc.picture1.xili.addEventListener(MouseEvent.MOUSE_DOWN, objColors);
			Main_Mc.picture1.xili2.addEventListener(MouseEvent.MOUSE_DOWN, objColors);
			Main_Mc.picture1.ragac.addEventListener(MouseEvent.MOUSE_DOWN, objColors);
		}
		
		private function objColors(e:MouseEvent):void 
		{
			if (Main_Mc.picture.colortrans.visible == false)
			{
				e.currentTarget.transform.colorTransform = color;
			}		
		}
		
		private function changeColor(e:MouseEvent):void
		{
			var colorName:String = e.currentTarget.name;
			color.color = arr[colorName.substr(5, 2)];
			colors()
		}
		private function colors():void
		{
			Box.choosedColor.transform.colorTransform = color;
		}
	}

}
