package
{
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import com.greensock.*;
	import flash.geom.Point;
	import flash.ui.Mouse;
	
	public class PaintFlower extends MovieClip
	{
		private var sunFlower:MovieClip;
		private var color:ColorTransform;
		private var count:Number = 0;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var old_X:Number;
		private var old_Y:Number;
		
		public function PaintFlower(_stageWidth, _stageHeight, sunFlower) //
		{
			this._stageWidth = _stageWidth;
			this._stageHeight = _stageHeight;
			this.sunFlower = sunFlower;
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler();
		}
		
		private function initHandler():void
		{
			
			sunFlower.x =_stageWidth / 2;
			sunFlower.y = _stageHeight / 2;
			sunFlower.height = _stageHeight/1.2;
			sunFlower.scaleX = sunFlower.scaleY;
			
			old_X = sunFlower.closebox.x;
			old_Y = sunFlower.closebox.y;
			sunFlower.closebox.addEventListener(MouseEvent.MOUSE_DOWN, closeBoxFunc);
			
			color = new ColorTransform();
			color.color = 0xFFFFFF;
			
			sunFlower.sky.transform.colorTransform = color;
			
			sunFlower.vaza.transform.colorTransform = color;
			
			sunFlower.dziri.transform.colorTransform = color;
			
			sunFlower.flower1.transform.colorTransform = color;
			
			sunFlower.flower1g.transform.colorTransform = color;
			
			sunFlower.flower2.transform.colorTransform = color;
			
			sunFlower.flower2g.transform.colorTransform = color;
			
			sunFlower.flower3.transform.colorTransform = color;
			
			sunFlower.flower3g.transform.colorTransform = color;
			
			sunFlower.flower4.transform.colorTransform = color;
			
			sunFlower.flower5.transform.colorTransform = color;
			
			sunFlower.flower6.transform.colorTransform = color;
			
			sunFlower.flower6g.transform.colorTransform = color;
			
			sunFlower.flower7.transform.colorTransform = color;
			
			sunFlower.flower8.transform.colorTransform = color;
			
			sunFlower.flower9.transform.colorTransform = color;
			
			sunFlower.flower10.transform.colorTransform = color;
			
			sunFlower.flower11.transform.colorTransform = color;
			
			sunFlower.palitr.yellow.addEventListener(MouseEvent.CLICK, ColorsTrans)
			sunFlower.palitr.red.addEventListener(MouseEvent.CLICK, ColorsTrans)
			sunFlower.palitr.blue.addEventListener(MouseEvent.CLICK, ColorsTrans)
			sunFlower.palitr.orange.addEventListener(MouseEvent.CLICK, ColorsTrans)
			sunFlower.palitr.green.addEventListener(MouseEvent.CLICK, ColorsTrans)
			sunFlower.palitr.purple.addEventListener(MouseEvent.CLICK, ColorsTrans)
			sunFlower.palitr.white.addEventListener(MouseEvent.CLICK, ColorsTrans)
			sunFlower.palitr.lightgray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			sunFlower.palitr.gray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			sunFlower.palitr.black.addEventListener(MouseEvent.CLICK, ColorsTrans)
			
			sunFlower.flower1.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //flower1
			sunFlower.flower1g.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //flower1g			
			sunFlower.flower2.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*flower2
			sunFlower.flower2g.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*flower2g
			sunFlower.flower3.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //flower3
			sunFlower.flower3g.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //flower3g
			sunFlower.flower4.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //flower4
			sunFlower.flower5.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //flower5
			sunFlower.flower6.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //flower6
			sunFlower.flower6g.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //flower6g
			sunFlower.flower7.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //flower7
			sunFlower.flower8.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //flower8
			sunFlower.flower9.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //flower9
			sunFlower.flower10.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //flower10
			sunFlower.flower11.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //flower11
			
			sunFlower.sky.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*sky
			sunFlower.vaza.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*vaza
			sunFlower.dziri.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*dziri
			sunFlower.palitr.alpha = 0;
			sunFlower.palitrbutton.addEventListener(MouseEvent.MOUSE_DOWN, ShowPalitr);
			//addEventListener(MouseEvent.MOUSE_MOVE, changePoint);
			sunFlower.paintbox.addEventListener(MouseEvent.MOUSE_DOWN, changePointClick);
			sunFlower.takepoto.addEventListener(MouseEvent.MOUSE_DOWN, goHome)
		}
		
		private function closeBoxFunc(e:MouseEvent):void
		{
			trace("asd")
			sunFlower.paintbox.x = old_X;
			sunFlower.paintbox.y = old_Y;
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		private function goHome(e:MouseEvent):void
		{
			var jpg:Raghats = new Raghats(stage);
			jpg.addEventListener(DataEvent.DATA, jpgListener);
			
		}
		
		private function jpgListener(e:DataEvent):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "MovrchiFlower"))
		}
		private function changePointClick(e:MouseEvent):void
		{
			
			//Mouse.hide();
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		private function mouseMoveHandler(ev:MouseEvent):void
		{
			
			////რაღაც გამოვიდა
			
			var point:Point = new Point(sunFlower.mouseX,sunFlower.mouseY);
			var nPoint:Point=Controller.STAGE.globalToLocal(point);
			
		
			sunFlower.paintbox.x = nPoint.x-sunFlower.paintbox.width/2;
			sunFlower.paintbox.y = nPoint.y;
			
			Mouse.hide();
			
			ev.updateAfterEvent();
		}
		
		private function ChangePictureColor(e:MouseEvent):void
		{
			if (e.currentTarget.name == "sky")
			{
				sunFlower.sky.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "vaza")
			{
				sunFlower.vaza.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "dziri")
			{
				sunFlower.dziri.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "flower1")
			{
				sunFlower.flower1.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "flower1g")
			{
				sunFlower.flower1g.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "flower2")
			{
				sunFlower.flower2.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "flower2g")
			{
				sunFlower.flower2g.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "flower3")
			{
				sunFlower.flower3.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "flower3g")
			{
				sunFlower.flower3g.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "flower4")
			{
				sunFlower.flower4.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "flower5")
			{
				sunFlower.flower5.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "flower6")
			{
				sunFlower.flower6.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "flower6g")
			{
				sunFlower.flower6g.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "flower7")
			{
				sunFlower.flower7.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "flower8")
			{
				sunFlower.flower8.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "flower9")
			{
				sunFlower.flower9.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "flower10")
			{
				sunFlower.flower10.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "flower11")
			{
				sunFlower.flower11.transform.colorTransform = color;
			}
		
		}
		
		private function changePoint(e:MouseEvent):void
		{
			//sunFlower.paintbox.x = mouseX;
			//	sunFlower.paintbox.y = mouseY;
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
			sunFlower.palitr.colors.transform.colorTransform = color;
			sunFlower.paintbox.paintcolor.transform.colorTransform = color;
		}
		
		private function ShowPalitr(e:MouseEvent):void
		{
			if (count == 0)
			{
				TweenMax.to(sunFlower.palitr, 1, {alpha: 1});
				count++;
			}
			else if (count == 1)
			{
				TweenMax.to(sunFlower.palitr, 1, {alpha: 0});
				count--;
			}
		}
	
	}

}

