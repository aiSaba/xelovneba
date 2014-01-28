package
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	
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
				Main_Mc.picture.cold['color'+i].addEventListener(MouseEvent.MOUSE_DOWN, changeColor);
			}
			arr = [1,0x170C66,0x4A4186,0x7873A5,0xA7A2C4,0x292D96, 0x575AAC, 0x8384C1, 0xACAFD6,0x0072C0,0x008ECC,0x2AACDA,0x83C7E6,0x00ADE5,0x00BDEA,0x43CEF0,0x8FDEF4];
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
