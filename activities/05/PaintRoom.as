package
{
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import com.greensock.*;
	
	public class PaintRoom extends MovieClip
	{
		private var room:MovieClip;
		private var color:ColorTransform;
		private var count:Number = 0;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var old_X:Number;
		private var old_Y:Number;
		
		public function PaintRoom(_stageWidth, _stageHeight, room) //
		{
			this._stageWidth = _stageWidth;
			this._stageHeight = _stageHeight;
			this.room = room;
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler();
		}
		
		private function initHandler():void
		{
			
			room.x =_stageWidth / 2;
			room.y = _stageHeight / 2;
			room.height = _stageHeight/1.2;
			room.scaleX = room.scaleY;
			
			old_X = room.closebox.x;
			old_Y = room.closebox.y;
			room.closebox.addEventListener(MouseEvent.MOUSE_DOWN, closeBoxFunc);
			
			color = new ColorTransform();
			color.color = 0xFFFFFF;
			
			room.wall.transform.colorTransform = color;
			
			room.floor.transform.colorTransform = color;
			
			room.sawoli.transform.colorTransform = color;
			
			room.skami2.transform.colorTransform = color;
			
			room.skami1.transform.colorTransform = color;
			
			room.magida.transform.colorTransform = color;
			
			room.window.transform.colorTransform = color;
			
			room.windowch.transform.colorTransform = color;
			
			room.kari1.transform.colorTransform = color;
			
			room.kari.transform.colorTransform = color;
			
			room.logini.transform.colorTransform = color;
			
			room.palitr.yellow.addEventListener(MouseEvent.CLICK, ColorsTrans)
			room.palitr.red.addEventListener(MouseEvent.CLICK, ColorsTrans)
			room.palitr.blue.addEventListener(MouseEvent.CLICK, ColorsTrans)
			room.palitr.orange.addEventListener(MouseEvent.CLICK, ColorsTrans)
			room.palitr.green.addEventListener(MouseEvent.CLICK, ColorsTrans)
			room.palitr.purple.addEventListener(MouseEvent.CLICK, ColorsTrans)
			room.palitr.white.addEventListener(MouseEvent.CLICK, ColorsTrans)
			room.palitr.lightgray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			room.palitr.gray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			room.palitr.black.addEventListener(MouseEvent.CLICK, ColorsTrans)
			
			room.wall.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*wall
			room.floor.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //floor
			room.sawoli.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //sawoli			
			room.skami2.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*skami2
			room.skami1.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*skami1
			
			room.kari1.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*kari1
			room.magida.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //magida
			room.window.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //window
			room.windowch.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //windowch
			room.kari.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //kari
			room.logini.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //logini
			
			room.palitr.alpha = 0;
			room.palitrbutton.addEventListener(MouseEvent.MOUSE_DOWN, ShowPalitr);
			//addEventListener(MouseEvent.MOUSE_MOVE, changePoint);
			room.paintbox.addEventListener(MouseEvent.MOUSE_DOWN, changePointClick);
			room.takepoto.addEventListener(MouseEvent.MOUSE_DOWN, goHome)
		}
		
		private function closeBoxFunc(e:MouseEvent):void
		{
			
			room.paintbox.x = old_X;
			room.paintbox.y = old_Y;
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		private function changePointClick(e:MouseEvent):void
		{
			
			//Mouse.hide();
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		private function mouseMoveHandler(ev:MouseEvent):void
		{
			room.paintbox.x = ev.stageX - room.width / 2  - room.paintbox.paintcolor.width;
			room.paintbox.y = ev.stageY - room.height / 2 - room.paintbox.paintcolor.height / 2;
		}
		
		private function goHome(e:MouseEvent):void
		{
			var jpg:Raghats = new Raghats(stage);
			jpg.addEventListener(DataEvent.DATA, jpgListener);
			
		}
		
		private function jpgListener(e:DataEvent):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "MovrchiRoom"))
		}
		private function ChangePictureColor(e:MouseEvent):void
		{
			
			if (e.currentTarget.name == "wall")
			{
				room.wall.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "floor")
			{
				room.floor.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "sawoli")
			{
				room.sawoli.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "skami2")
			{
				room.skami2.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "skami1")
			{
				room.skami1.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "magida")
			{
				room.magida.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "window")
			{
				room.window.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "windowch")
			{
				room.windowch.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "kari1")
			{
				room.kari1.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "kari")
			{
				room.kari.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "logini")
			{
				room.logini.transform.colorTransform = color;
			}
		
		}
		
		private function changePoint(e:MouseEvent):void
		{
			//room.paintbox.x = mouseX;
			//	room.paintbox.y = mouseY;
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
			room.palitr.colors.transform.colorTransform = color;
			room.paintbox.paintcolor.transform.colorTransform = color;
		}
		
		private function ShowPalitr(e:MouseEvent):void
		{
			if (count == 0)
			{
				TweenMax.to(room.palitr, 1, {alpha: 1});
				count++;
			}
			else if (count == 1)
			{
				TweenMax.to(room.palitr, 1, {alpha: 0});
				count--;
			}
		}
	
	}

}

