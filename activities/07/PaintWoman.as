package
{
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import com.greensock.*;
	
	public class PaintWoman extends MovieClip
	{
		private var womanpaint:MovieClip;
		private var color:ColorTransform;
		private var count:Number = 0;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var old_X:Number;
		private var old_Y:Number;
		
		public function PaintWoman(_stageWidth, _stageHeight, womanpaint)//_stageWidth, _stageHeight, womanpaint
		{
			this._stageWidth = _stageWidth;
			this._stageHeight = _stageHeight;
			this.womanpaint = womanpaint;
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler();
		}
		
		private function initHandler():void
		{
			
			womanpaint.x =_stageWidth / 2;
			womanpaint.y = _stageHeight / 2;
			womanpaint.height = _stageHeight/1.2;
			womanpaint.scaleX = womanpaint.scaleY;
			
			old_X = womanpaint.closebox.x;
			old_Y = womanpaint.closebox.y;
			womanpaint.closebox.addEventListener(MouseEvent.MOUSE_DOWN, closeBoxFunc);
			
			color = new ColorTransform();
			color.color = 0xFFFFFF
			
			
			//mivanichot feri
			womanpaint.floor.transform.colorTransform = color;
			womanpaint.land.transform.colorTransform = color;
			womanpaint.hair.transform.colorTransform = color;
			womanpaint.face.transform.colorTransform = color;
			womanpaint.horse.transform.colorTransform = color;
			womanpaint.suit1.transform.colorTransform = color;
			womanpaint.suit2.transform.colorTransform = color;
			womanpaint.suit3.transform.colorTransform = color;
			womanpaint.sky.transform.colorTransform = color;
			womanpaint.bodzebi.transform.colorTransform = color;
			womanpaint.gulsabnevi.transform.colorTransform = color;
			
			
			///
			
			womanpaint.palitr.yellow.addEventListener(MouseEvent.CLICK, ColorsTrans)
			womanpaint.palitr.red.addEventListener(MouseEvent.CLICK, ColorsTrans)
			womanpaint.palitr.blue.addEventListener(MouseEvent.CLICK, ColorsTrans)
			womanpaint.palitr.orange.addEventListener(MouseEvent.CLICK, ColorsTrans)
			womanpaint.palitr.green.addEventListener(MouseEvent.CLICK, ColorsTrans)
			womanpaint.palitr.purple.addEventListener(MouseEvent.CLICK, ColorsTrans)
			womanpaint.palitr.white.addEventListener(MouseEvent.CLICK, ColorsTrans)
			womanpaint.palitr.lightgray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			womanpaint.palitr.gray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			womanpaint.palitr.black.addEventListener(MouseEvent.CLICK, ColorsTrans)
			
			womanpaint.hair.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);//hat
			
			womanpaint.horse.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);//kashni
			womanpaint.face.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);//face			
			womanpaint.sky.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);//*shirt
			
			womanpaint.suit1.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);//*gili	
			womanpaint.suit2.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);//*gili
			womanpaint.suit3.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);//*gili
			womanpaint.gulsabnevi.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);//*gili
			
			womanpaint.bodzebi.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);//*wall
			womanpaint.land.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);//*land
			womanpaint.floor.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);//*land
			
			womanpaint.palitr.alpha = 0;
			womanpaint.palitrbutton.addEventListener(MouseEvent.MOUSE_DOWN, ShowPalitr);
			//addEventListener(MouseEvent.MOUSE_MOVE, changePoint);
			womanpaint.paintbox.addEventListener(MouseEvent.MOUSE_DOWN, changePointClick);
			womanpaint.takepoto.addEventListener(MouseEvent.MOUSE_DOWN, goHome)
		}
		
		private function closeBoxFunc(e:MouseEvent):void
		{
			
			womanpaint.paintbox.x = old_X;
			womanpaint.paintbox.y = old_Y;
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		private function changePointClick(e:MouseEvent):void
		{
			
			//Mouse.hide();
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		private function mouseMoveHandler(ev:MouseEvent):void
		{
			womanpaint.paintbox.x = ev.stageX - womanpaint.width/2  - 1.5 * womanpaint.paintbox.paintcolor.width;
			womanpaint.paintbox.y = ev.stageY - womanpaint.height/2 - womanpaint.paintbox.paintcolor.height/2;
		}
		private function goHome(e:MouseEvent):void
		{
			var jpg:Raghats = new Raghats(stage);
			jpg.addEventListener(DataEvent.DATA, jpgListener);
			
		}
		
		private function jpgListener(e:DataEvent):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "MovrchiWoman"))
		}
		private function ChangePictureColor(e:MouseEvent):void 
		{
			if (e.currentTarget.name == "floor")
			{
				womanpaint.floor.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "land")
			{
				womanpaint.land.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "hair")
			{
				womanpaint.hair.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "face")
			{
				womanpaint.face.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "horse")
			{
				womanpaint.horse.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "suit1")
			{
				womanpaint.suit1.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "suit2")
			{
				womanpaint.suit2.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "suit3")
			{
				womanpaint.suit3.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "sky")
			{
				womanpaint.sky.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "bodzebi")
			{
				womanpaint.bodzebi.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "gulsabnevi")
			{
				womanpaint.gulsabnevi.transform.colorTransform = color;
			}
			
	
			
		}
		
		private function changePoint(e:MouseEvent):void
		{
			//womanpaint.paintbox.x = mouseX;
		//	womanpaint.paintbox.y = mouseY;
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
			womanpaint.palitr.colors.transform.colorTransform = color;
			womanpaint.paintbox.paintcolor.transform.colorTransform = color;
		}
		private function ShowPalitr(e:MouseEvent):void
		{
			if (count == 0)
			{
				TweenMax.to(womanpaint.palitr, 1, {alpha:1});
				count++;
			}
			else if (count == 1)
			{
				TweenMax.to(womanpaint.palitr, 1, {alpha:0});
				count--;
			}
		}
		
	
	}

}



