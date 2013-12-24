package
{
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import com.greensock.*;
	
	public class PaintPortrait extends MovieClip
	{
		private var autoportrait:MovieClip;
		private var color:ColorTransform;
		private var count:Number = 0;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var old_X:Number;
		private var old_Y:Number;
		
		public function PaintPortrait(_stageWidth, _stageHeight, autoportrait) //
		{
			this._stageWidth = _stageWidth;
			this._stageHeight = _stageHeight;
			this.autoportrait = autoportrait;
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler();
		}
		
		private function initHandler():void
		{
			
			autoportrait.x =_stageWidth / 2;
			autoportrait.y = _stageHeight / 2;
			autoportrait.height = _stageHeight/1.2;
			autoportrait.scaleX = autoportrait.scaleY;
			
			old_X = autoportrait.closebox.x;
			old_Y = autoportrait.closebox.y;
			autoportrait.closebox.addEventListener(MouseEvent.MOUSE_DOWN, closeBoxFunc);
			
			color = new ColorTransform();
			color.color = 0xFFFFFF;
			
			autoportrait.sky.transform.colorTransform = color;
			
			autoportrait.wall.transform.colorTransform = color;
			
			autoportrait.hat.transform.colorTransform = color;
			
			autoportrait.face.transform.colorTransform = color;
			
			autoportrait.shirt.transform.colorTransform = color;
			
			autoportrait.gili.transform.colorTransform = color;
			
			autoportrait.kashni.transform.colorTransform = color;
			
			autoportrait.chibuxi.transform.colorTransform = color;
			
			autoportrait.palitr.yellow.addEventListener(MouseEvent.CLICK, ColorsTrans)
			autoportrait.palitr.red.addEventListener(MouseEvent.CLICK, ColorsTrans)
			autoportrait.palitr.blue.addEventListener(MouseEvent.CLICK, ColorsTrans)
			autoportrait.palitr.orange.addEventListener(MouseEvent.CLICK, ColorsTrans)
			autoportrait.palitr.green.addEventListener(MouseEvent.CLICK, ColorsTrans)
			autoportrait.palitr.purple.addEventListener(MouseEvent.CLICK, ColorsTrans)
			autoportrait.palitr.white.addEventListener(MouseEvent.CLICK, ColorsTrans)
			autoportrait.palitr.lightgray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			autoportrait.palitr.gray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			autoportrait.palitr.black.addEventListener(MouseEvent.CLICK, ColorsTrans)
			
			autoportrait.hat.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //hat
			autoportrait.face.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //face			
			autoportrait.shirt.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*shirt
			autoportrait.gili.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*gili
			autoportrait.kashni.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //kashni
			autoportrait.chibuxi.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //chibuxi
			
			autoportrait.sky.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*sky
			autoportrait.wall.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*wall
			autoportrait.palitr.alpha = 0;
			autoportrait.palitrbutton.addEventListener(MouseEvent.MOUSE_DOWN, ShowPalitr);
			//addEventListener(MouseEvent.MOUSE_MOVE, changePoint);
			autoportrait.paintbox.addEventListener(MouseEvent.MOUSE_DOWN, changePointClick);
			autoportrait.takepoto.addEventListener(MouseEvent.MOUSE_DOWN, goHome)
		}
		
		private function closeBoxFunc(e:MouseEvent):void
		{
			trace("asd")
			autoportrait.paintbox.x = old_X;
			autoportrait.paintbox.y = old_Y;
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		private function changePointClick(e:MouseEvent):void
		{
			
			//Mouse.hide();
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		private function mouseMoveHandler(ev:MouseEvent):void
		{
 			autoportrait.paintbox.x = ev.stageX - autoportrait.width / 2  - 2*autoportrait.paintbox.paintcolor.width;
			autoportrait.paintbox.y = ev.stageY - autoportrait.height / 2 - autoportrait.paintbox.paintcolor.height / 2;
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
			if (e.currentTarget.name == "sky")
			{
				autoportrait.sky.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "wall")
			{
				autoportrait.wall.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "hat")
			{
				autoportrait.hat.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "face")
			{
				autoportrait.face.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "shirt")
			{
				autoportrait.shirt.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "gili")
			{
				autoportrait.gili.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "kashni")
			{
				autoportrait.kashni.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "chibuxi")
			{
				autoportrait.chibuxi.transform.colorTransform = color;
			}
		
		}
		
		private function changePoint(e:MouseEvent):void
		{
			//autoportrait.paintbox.x = mouseX;
			//	autoportrait.paintbox.y = mouseY;
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
			autoportrait.palitr.colors.transform.colorTransform = color;
			autoportrait.paintbox.paintcolor.transform.colorTransform = color;
		}
		
		private function ShowPalitr(e:MouseEvent):void
		{
			if (count == 0)
			{
				TweenMax.to(autoportrait.palitr, 1, {alpha: 1});
				count++;
			}
			else if (count == 1)
			{
				TweenMax.to(autoportrait.palitr, 1, {alpha: 0});
				count--;
			}
		}
	
	}

}

