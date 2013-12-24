package
{
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import com.greensock.*;
	
	public class PaintAngels extends MovieClip
	{
		private var paintAngels:MovieClip;
		private var color:ColorTransform;
		private var count:Number = 0;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var old_X:Number;
		private var old_Y:Number;
		
		public function PaintAngels(_stageWidth, _stageHeight, paintAngels)//
		{
			this._stageWidth = _stageWidth;
			this._stageHeight = _stageHeight;
			this.paintAngels = paintAngels;
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler();
		}
		
		private function initHandler():void
		{
			
			paintAngels.x =_stageWidth / 2;
			paintAngels.y = _stageHeight / 2;
			paintAngels.height = _stageHeight/1.2;
			paintAngels.scaleX = paintAngels.scaleY;
			
			old_X = paintAngels.closebox.x;
			old_Y = paintAngels.closebox.y;
			paintAngels.closebox.addEventListener(MouseEvent.MOUSE_DOWN, closeBoxFunc);
			
			color = new ColorTransform();
			color.color = 0xFFFFFF;
			
			
			paintAngels.wall.transform.colorTransform = color;
			paintAngels.land.transform.colorTransform = color;
			paintAngels.hair.transform.colorTransform = color;
			paintAngels.face.transform.colorTransform = color;
			paintAngels.a1face.transform.colorTransform = color;
			paintAngels.frta.transform.colorTransform = color;
			paintAngels.frtebi.transform.colorTransform = color;
			paintAngels.tma.transform.colorTransform = color;
			
			
			
			
			
			
			paintAngels.palitr.yellow.addEventListener(MouseEvent.CLICK, ColorsTrans)
			paintAngels.palitr.red.addEventListener(MouseEvent.CLICK, ColorsTrans)
			paintAngels.palitr.blue.addEventListener(MouseEvent.CLICK, ColorsTrans)
			paintAngels.palitr.orange.addEventListener(MouseEvent.CLICK, ColorsTrans)
			paintAngels.palitr.green.addEventListener(MouseEvent.CLICK, ColorsTrans)
			paintAngels.palitr.purple.addEventListener(MouseEvent.CLICK, ColorsTrans)
			paintAngels.palitr.white.addEventListener(MouseEvent.CLICK, ColorsTrans)
			paintAngels.palitr.lightgray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			paintAngels.palitr.gray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			paintAngels.palitr.black.addEventListener(MouseEvent.CLICK, ColorsTrans)
			
			paintAngels.hair.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);//hat
			paintAngels.tma.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);//kashni
			paintAngels.face.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);//face			
			paintAngels.a1face.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);//*shirt
			paintAngels.frta.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);//*gili	
			paintAngels.frtebi.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);//*gili	
			
			paintAngels.wall.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);//*wall
			paintAngels.land.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);//*land
			
			paintAngels.palitr.alpha = 0;
			paintAngels.palitrbutton.addEventListener(MouseEvent.MOUSE_DOWN, ShowPalitr);
			//addEventListener(MouseEvent.MOUSE_MOVE, changePoint);
			paintAngels.paintbox.addEventListener(MouseEvent.MOUSE_DOWN, changePointClick);
			paintAngels.takepoto.addEventListener(MouseEvent.MOUSE_DOWN, goHome)
		}
		
		private function closeBoxFunc(e:MouseEvent):void
		{
			
			paintAngels.paintbox.x = old_X;
			paintAngels.paintbox.y = old_Y;
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		private function changePointClick(e:MouseEvent):void
		{
			
			//Mouse.hide();
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		private function mouseMoveHandler(ev:MouseEvent):void
		{
			paintAngels.paintbox.x = ev.stageX - paintAngels.width/2  - paintAngels.paintbox.paintcolor.width;
			paintAngels.paintbox.y = ev.stageY - paintAngels.height/2 - paintAngels.paintbox.paintcolor.height/2;
		}
		private function goHome(e:MouseEvent):void
		{
			var jpg:Raghats = new Raghats(stage);
			jpg.addEventListener(DataEvent.DATA, jpgListener);
			
		}
		
		private function jpgListener(e:DataEvent):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "MovrchiAngels"))
		}
		private function ChangePictureColor(e:MouseEvent):void 
		{
			if (e.currentTarget.name == "wall")
			{
				paintAngels.wall.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "land")
			{
				paintAngels.land.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "hair")
			{
				paintAngels.hair.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "face")
			{
				paintAngels.face.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "a1face")
			{
				paintAngels.a1face.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "frta")
			{
				paintAngels.frta.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "frtebi")
			{
				paintAngels.frtebi.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "tma")
			{
				paintAngels.tma.transform.colorTransform = color;
			}
		
	
			
		}
		
		private function changePoint(e:MouseEvent):void
		{
			//paintAngels.paintbox.x = mouseX;
		//	paintAngels.paintbox.y = mouseY;
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
			paintAngels.palitr.colors.transform.colorTransform = color;
			paintAngels.paintbox.paintcolor.transform.colorTransform = color;
		}
		private function ShowPalitr(e:MouseEvent):void
		{
			if (count == 0)
			{
				TweenMax.to(paintAngels.palitr, 1, {alpha:1});
				count++;
			}
			else if (count == 1)
			{
				TweenMax.to(paintAngels.palitr, 1, {alpha:0});
				count--;
			}
		}
		
	
	}

}


