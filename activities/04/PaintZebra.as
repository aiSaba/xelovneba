package
{
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import com.greensock.*;
	import flash.ui.Mouse;
	
	public class PaintZebra extends MovieClip
	{
		private var zebraPaint:MovieClip
		private var color:ColorTransform;
		private var count:Number = 0;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var old_X:Number;
		private var old_Y:Number;
		
		public function PaintZebra(_stageWidth, _stageHeight, zebraPaint)
		{
			this._stageWidth = _stageWidth;
			this._stageHeight = _stageHeight;
			this.zebraPaint = zebraPaint;
			addEventListener(Event.ADDED_TO_STAGE, init)
			
		}
		
		
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initZebra()
		
		}
		
		private function initZebra():void
		{
			
			old_X = zebraPaint.closebox.x;
			old_Y = zebraPaint.closebox.y;
			zebraPaint.closebox.addEventListener(MouseEvent.MOUSE_DOWN, closeBoxFunc);
			
			zebraPaint.x = stage.stageWidth / 2;
			zebraPaint.y = stage.stageHeight / 2;
			zebraPaint.height = _stageHeight / 1.2;
			zebraPaint.scaleX = zebraPaint.scaleY;
			//addChild(zebraPaint);
			color = new ColorTransform();
			color.color = 0xFFFFFF;
			
			zebraPaint.sky.transform.colorTransform = color;
			zebraPaint.land.transform.colorTransform = color;
			zebraPaint.horse.transform.colorTransform = color;
			
			zebraPaint.palitr.yellow.addEventListener(MouseEvent.CLICK, ColorsTrans)
			zebraPaint.palitr.red.addEventListener(MouseEvent.CLICK, ColorsTrans)
			zebraPaint.palitr.blue.addEventListener(MouseEvent.CLICK, ColorsTrans)
			zebraPaint.palitr.orange.addEventListener(MouseEvent.CLICK, ColorsTrans)
			zebraPaint.palitr.green.addEventListener(MouseEvent.CLICK, ColorsTrans)
			zebraPaint.palitr.purple.addEventListener(MouseEvent.CLICK, ColorsTrans)
			zebraPaint.palitr.white.addEventListener(MouseEvent.CLICK, ColorsTrans)
			zebraPaint.palitr.lightgray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			zebraPaint.palitr.gray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			zebraPaint.palitr.black.addEventListener(MouseEvent.CLICK, ColorsTrans)
			zebraPaint.sky.addEventListener(MouseEvent.CLICK, Sky)
			zebraPaint.land.addEventListener(MouseEvent.CLICK, Lend)
			zebraPaint.horse.addEventListener(MouseEvent.CLICK, Horse)
			zebraPaint.palitr.addEventListener(MouseEvent.MOUSE_DOWN, ChangeScale);
			zebraPaint.palitr.colors.transform.colorTransform = color;
			zebraPaint.paintbox.addEventListener(MouseEvent.MOUSE_DOWN, changePointClick)
			zebraPaint.palitr.alpha = 0;
			zebraPaint.palitrbutton.addEventListener(MouseEvent.MOUSE_DOWN, ShowPalitr);
			zebraPaint.takepoto.addEventListener(MouseEvent.MOUSE_DOWN, goHome)
		
		}
		
		private function closeBoxFunc(e:MouseEvent):void
		{
			zebraPaint.paintbox.x = old_X;
			zebraPaint.paintbox.y = old_Y;
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		private function changePointClick(e:MouseEvent):void
		{
			
			//Mouse.hide();
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		private function mouseMoveHandler(ev:MouseEvent):void
		{
			zebraPaint.paintbox.x = ev.stageX - zebraPaint.width / 2 - zebraPaint.paintbox.paintcolor.width ;
			zebraPaint.paintbox.y = ev.stageY - zebraPaint.height / 2 - zebraPaint.paintbox.paintcolor.height ;
		}
		
		private function goHome(e:MouseEvent):void
		{
			var jpg:Raghats = new Raghats(stage);
			jpg.addEventListener(DataEvent.DATA, jpgListener);
		
		}
		
		private function jpgListener(e:DataEvent):void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "MovrchiZebras"))
		}
		
		private function ShowPalitr(e:MouseEvent):void
		{
			if (count == 0)
			{
				TweenMax.to(zebraPaint.palitr, 1, {alpha: 1});
				count++;
			}
			else if (count == 1)
			{
				TweenMax.to(zebraPaint.palitr, 1, {alpha: 0});
				count--;
			}
		}
		
		private function ChangeScale(e:MouseEvent):void
		{
			zebraPaint.palitr.scaleX = 1;
			zebraPaint.palitr.scaleY = 1;
		}
		
		private function Horse(e:MouseEvent):void
		{
			zebraPaint.horse.transform.colorTransform = color;
		}
		
		private function Lend(e:MouseEvent):void
		{
			zebraPaint.land.transform.colorTransform = color;
		}
		
		private function Sky(e:MouseEvent):void
		{
			zebraPaint.sky.transform.colorTransform = color;
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
				trace("green")
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
			zebraPaint.palitr.colors.transform.colorTransform = color;
			zebraPaint.paintbox.paintcolor.transform.colorTransform = color;
		}
	}

}
