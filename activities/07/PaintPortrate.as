
package
{
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import com.greensock.*;
	
	public class PaintPortrate extends MovieClip
	{
		private var portratePaint:MovieClip;
		private var color:ColorTransform;
		private var count:Number = 0;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var old_X:Number;
		private var old_Y:Number;
		
		public function PaintPortrate(_stageWidth, _stageHeight, portratePaint) //
		{
			this._stageWidth = _stageWidth;
			this._stageHeight = _stageHeight;
			this.portratePaint = portratePaint;
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler();
		}
		
		private function initHandler():void
		{
			
			portratePaint.x =_stageWidth / 2;
			portratePaint.y = _stageHeight / 2;
			portratePaint.height = _stageHeight/1.2;
			portratePaint.scaleX = portratePaint.scaleY;
			
			old_X = portratePaint.closebox.x;
			old_Y = portratePaint.closebox.y;
			portratePaint.closebox.addEventListener(MouseEvent.MOUSE_DOWN, closeBoxFunc);
			
			color = new ColorTransform();
			color.color = 0xFFFFFF;
			
			portratePaint.wall.transform.colorTransform = color;			
			portratePaint.hat.transform.colorTransform = color;		
			portratePaint.face.transform.colorTransform = color;			
			portratePaint.suit.transform.colorTransform = color;			
			portratePaint.suitnw.transform.colorTransform = color;			
			portratePaint.tma.transform.colorTransform = color;
			
			portratePaint.palitr.yellow.addEventListener(MouseEvent.CLICK, ColorsTrans)
			portratePaint.palitr.red.addEventListener(MouseEvent.CLICK, ColorsTrans)
			portratePaint.palitr.blue.addEventListener(MouseEvent.CLICK, ColorsTrans)
			portratePaint.palitr.orange.addEventListener(MouseEvent.CLICK, ColorsTrans)
			portratePaint.palitr.green.addEventListener(MouseEvent.CLICK, ColorsTrans)
			portratePaint.palitr.purple.addEventListener(MouseEvent.CLICK, ColorsTrans)
			portratePaint.palitr.white.addEventListener(MouseEvent.CLICK, ColorsTrans)
			portratePaint.palitr.lightgray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			portratePaint.palitr.gray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			portratePaint.palitr.black.addEventListener(MouseEvent.CLICK, ColorsTrans)
			
			portratePaint.hat.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //hat
			portratePaint.face.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //face			
			portratePaint.suit.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*shirt
			portratePaint.suitnw.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*gili
			portratePaint.tma.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //kashni
			
			portratePaint.wall.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*wall
			portratePaint.palitr.alpha = 0;
			portratePaint.palitrbutton.addEventListener(MouseEvent.MOUSE_DOWN, ShowPalitr);
			//addEventListener(MouseEvent.MOUSE_MOVE, changePoint);
			portratePaint.paintbox.addEventListener(MouseEvent.MOUSE_DOWN, changePointClick);
			portratePaint.takepoto.addEventListener(MouseEvent.MOUSE_DOWN, goHome)
		}
		
		private function closeBoxFunc(e:MouseEvent):void
		{
			
			portratePaint.paintbox.x = old_X;
			portratePaint.paintbox.y = old_Y;
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		private function changePointClick(e:MouseEvent):void
		{
			
			//Mouse.hide();
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		private function mouseMoveHandler(ev:MouseEvent):void
		{
			portratePaint.paintbox.x = ev.stageX - portratePaint.width / 2 - 1.5*portratePaint.paintbox.paintcolor.width;
			portratePaint.paintbox.y = ev.stageY - portratePaint.height / 2 - portratePaint.paintbox.paintcolor.height / 2;
		}
		
		private function goHome(e:MouseEvent):void
		{
			var jpg:Raghats = new Raghats(stage);
			jpg.addEventListener(DataEvent.DATA, jpgListener);
			
		}
		
		private function jpgListener(e:DataEvent):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "MovrchiPortrate"))
		}
		private function ChangePictureColor(e:MouseEvent):void
		{
			if (e.currentTarget.name == "wall")
			{
				portratePaint.wall.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "hat")
			{
				portratePaint.hat.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "face")
			{
				portratePaint.face.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "suit")
			{
				portratePaint.suit.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "suitnw")
			{
				portratePaint.suitnw.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "tma")
			{
				portratePaint.tma.transform.colorTransform = color;
			}
		
		}
		
		private function changePoint(e:MouseEvent):void
		{
			//portratePaint.paintbox.x = mouseX;
			//	portratePaint.paintbox.y = mouseY;
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
			portratePaint.palitr.colors.transform.colorTransform = color;
			portratePaint.paintbox.paintcolor.transform.colorTransform = color;
		}
		
		private function ShowPalitr(e:MouseEvent):void
		{
			if (count == 0)
			{
				TweenMax.to(portratePaint.palitr, 1, {alpha: 1});
				count++;
			}
			else if (count == 1)
			{
				TweenMax.to(portratePaint.palitr, 1, {alpha: 0});
				count--;
			}
		}
	
	}

}

