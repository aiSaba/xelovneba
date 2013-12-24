
package
{
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import com.greensock.*;
	import flash.ui.Mouse;
	
	public class PaintMeezove extends MovieClip
	{
		private var meezovePaint:MovieClip;
		private var color:ColorTransform;
		private var count:Number = 0;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var old_X:Number;
		private var old_Y:Number;
		
		public function PaintMeezove(_stageWidth, _stageHeight, meezovePaint)
		{
			this._stageWidth = _stageWidth;
			this._stageHeight = _stageHeight;
			this.meezovePaint = meezovePaint;
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler();
		}
		
		private function initHandler():void
		{
			
			meezovePaint.x = _stageWidth / 2;
			meezovePaint.y = _stageHeight / 2;
			meezovePaint.height = _stageHeight/1.2;
			meezovePaint.scaleX = meezovePaint.scaleY;
			
			color = new ColorTransform();
			color.color = 0xFFFFFF;
			
			meezovePaint.sky.transform.colorTransform = color;
			
			meezovePaint.tani.transform.colorTransform = color;
			
			meezovePaint.land.transform.colorTransform = color;
			
			meezovePaint.winsafari.transform.colorTransform = color;
			
			meezovePaint.joxi.transform.colorTransform = color;
			
			meezovePaint.short.transform.colorTransform = color;
			
			meezovePaint.coat.transform.colorTransform = color;
			
			meezovePaint.hat.transform.colorTransform = color;
			
			meezovePaint.wveri.transform.colorTransform = color;
			
			meezovePaint.shoes.transform.colorTransform = color;
			
			old_X = meezovePaint.closebox.x;
			old_Y = meezovePaint.closebox.y;
			meezovePaint.closebox.addEventListener(MouseEvent.MOUSE_DOWN, closeBoxFunc);
			
			////Palitra////////////////////////////////////////////////////////////////////
			
			//*************************************************************************//
			meezovePaint.palitr.yellow.addEventListener(MouseEvent.CLICK, ColorsTrans)
			meezovePaint.palitr.red.addEventListener(MouseEvent.CLICK, ColorsTrans)
			meezovePaint.palitr.blue.addEventListener(MouseEvent.CLICK, ColorsTrans)
			meezovePaint.palitr.orange.addEventListener(MouseEvent.CLICK, ColorsTrans)
			meezovePaint.palitr.green.addEventListener(MouseEvent.CLICK, ColorsTrans)
			meezovePaint.palitr.purple.addEventListener(MouseEvent.CLICK, ColorsTrans)
			meezovePaint.palitr.white.addEventListener(MouseEvent.CLICK, ColorsTrans)
			meezovePaint.palitr.lightgray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			meezovePaint.palitr.gray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			meezovePaint.palitr.black.addEventListener(MouseEvent.CLICK, ColorsTrans)
			//*************************************************************************//
			/////////////////////////////////////////////////////////////////////////////
			
			meezovePaint.tani.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*tani
			meezovePaint.sky.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*sky	
			meezovePaint.land.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*land
			meezovePaint.winsafari.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*winsafari
			meezovePaint.joxi.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*joxi
			meezovePaint.short.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*short
			meezovePaint.coat.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*coat
			meezovePaint.hat.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*hat
			meezovePaint.wveri.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*wveri
			meezovePaint.shoes.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*shoes
			meezovePaint.palitr.alpha = 0;
			meezovePaint.palitrbutton.addEventListener(MouseEvent.MOUSE_DOWN, ShowPalitr);
			//addEventListener(MouseEvent.MOUSE_MOVE, changePoint);
			meezovePaint.paintbox.addEventListener(MouseEvent.MOUSE_DOWN, changePointClick);
			meezovePaint.takepoto.addEventListener(MouseEvent.MOUSE_DOWN, goHome)
		}
		
		private function closeBoxFunc(e:MouseEvent):void
		{
			trace("asd")
			meezovePaint.paintbox.x = old_X;
			meezovePaint.paintbox.y = old_Y;
			trace(old_X);
			trace(old_Y);
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		private function changePointClick(e:MouseEvent):void
		{
			
			//Mouse.hide();
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		private function mouseMoveHandler(ev:MouseEvent):void
		{
			meezovePaint.paintbox.x = ev.stageX - meezovePaint.width / 2// - meezovePaint.paintbox.paintcolor.width;
			meezovePaint.paintbox.y = ev.stageY - meezovePaint.height / 2// -  meezovePaint.paintbox.paintcolor.height/2 ;
		}
		
		private function goHome(e:MouseEvent):void
		{
			var jpg:Raghats = new Raghats(stage);
			jpg.addEventListener(DataEvent.DATA, jpgListener);
			
		}
		
		private function jpgListener(e:DataEvent):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "MovrchiMeezoves"));
		}
		private function ChangePictureColor(e:MouseEvent):void
		{
			if (e.currentTarget.name == "sky")
			{
				meezovePaint.sky.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "tani")
			{
				meezovePaint.tani.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "land")
			{
				meezovePaint.land.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "winsafari")
			{
				meezovePaint.winsafari.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "joxi")
			{
				meezovePaint.joxi.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "short")
			{
				meezovePaint.short.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "coat")
			{
				meezovePaint.coat.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "hat")
			{
				meezovePaint.hat.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "wveri")
			{
				meezovePaint.wveri.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "shoes")
			{
				meezovePaint.shoes.transform.colorTransform = color;
			}
		
		}
		
		private function changePoint(e:MouseEvent):void
		{
			//meezovePaint.paintbox.x = mouseX;
			//	meezovePaint.paintbox.y = mouseY;
		}
		
		private function ColorsTrans(e:MouseEvent):void
		{
			if (e.currentTarget.name == "orange")
			{
				color = new ColorTransform();
				color.color = 0xF27B01;
				colors();
				
			}
			if (e.currentTarget.name == "blue")
			{
				color = new ColorTransform();
				color.color = 0x1572F8;
				colors();
			}
			
			if (e.currentTarget.name == "red")
			{
				color = new ColorTransform();
				color.color = 0xF93015;
				colors();
			}
			if (e.currentTarget.name == "yellow")
			{
				color = new ColorTransform();
				color.color = 0xF9CA15;
				colors();
			}
			if (e.currentTarget.name == "green")
			{
				color = new ColorTransform();
				color.color = 0x00B32C;
				colors();
			}
			if (e.currentTarget.name == "purple")
			{
				color = new ColorTransform();
				color.color = 0xA23DBF;
				colors();
			}
			if (e.currentTarget.name == "white")
			{
				color = new ColorTransform();
				color.color = 0xE3E3F3;
				colors();
			}
			if (e.currentTarget.name == "lightgray")
			{
				color = new ColorTransform();
				color.color = 0xB3B3CE;
				colors();
			}
			if (e.currentTarget.name == "gray")
			{
				color = new ColorTransform();
				color.color = 0x70697E;
				colors();
			}
			if (e.currentTarget.name == "black")
			{
				color = new ColorTransform();
				color.color = 0x330000;
				colors();
			}
		
		}
		
		private function colors():void
		{
			meezovePaint.palitr.colors.transform.colorTransform = color;
			meezovePaint.paintbox.paintcolor.transform.colorTransform = color;
		}
		
		private function ShowPalitr(e:MouseEvent):void
		{
			if (count == 0)
			{
				TweenMax.to(meezovePaint.palitr, 1, {alpha: 1});
				count++;
			}
			else if (count == 1)
			{
				TweenMax.to(meezovePaint.palitr, 1, {alpha: 0});
				count--;
			}
		}
	
	}

}

