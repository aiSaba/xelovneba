package
{
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import com.greensock.*;
	import flash.ui.Mouse;
	
	public class PaintFishMan extends MovieClip
	{
		private var fishManPaint:MovieClip;
		private var color:ColorTransform;
		private var count:Number = 0;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var old_X:Number;
		private var old_Y:Number;
		private var colorBox:MovieClip;
		
		public function PaintFishMan(_stageWidth, _stageHeight, fishManPaint)
		{
			this._stageWidth = _stageWidth;
			this._stageHeight = _stageHeight;
			this.fishManPaint = fishManPaint;
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler();
		}
		
		private function initHandler():void
		{
			
			fishManPaint.x = _stageWidth / 2;
			fishManPaint.y = _stageHeight / 2;
			fishManPaint.height = _stageHeight/1.2;
			fishManPaint.scaleX = fishManPaint.scaleY;
			
			color = new ColorTransform();
			color.color = 0xFFFFFF;
			
			///
			old_X = fishManPaint.closebox.x;
			old_Y = fishManPaint.closebox.y;
			trace(old_X);
			trace(old_Y)
			fishManPaint.closebox.addEventListener(MouseEvent.MOUSE_DOWN, closeBoxFunc);
			
			fishManPaint.sky.transform.colorTransform = color;
			
			fishManPaint.shirt.transform.colorTransform = color;
			
			fishManPaint.water.transform.colorTransform = color;
			
			fishManPaint.grass.transform.colorTransform = color;
			
			fishManPaint.fish.transform.colorTransform = color;
			
			fishManPaint.short.transform.colorTransform = color;
			
			fishManPaint.fishbox.transform.colorTransform = color;
			
			fishManPaint.hat.transform.colorTransform = color;
			
			fishManPaint.palitr.yellow.addEventListener(MouseEvent.CLICK, ColorsTrans)
			fishManPaint.palitr.red.addEventListener(MouseEvent.CLICK, ColorsTrans)
			fishManPaint.palitr.blue.addEventListener(MouseEvent.CLICK, ColorsTrans)
			fishManPaint.palitr.orange.addEventListener(MouseEvent.CLICK, ColorsTrans)
			fishManPaint.palitr.green.addEventListener(MouseEvent.CLICK, ColorsTrans)
			fishManPaint.palitr.purple.addEventListener(MouseEvent.CLICK, ColorsTrans)
			fishManPaint.palitr.white.addEventListener(MouseEvent.CLICK, ColorsTrans)
			fishManPaint.palitr.lightgray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			fishManPaint.palitr.gray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			fishManPaint.palitr.black.addEventListener(MouseEvent.CLICK, ColorsTrans)
			
			fishManPaint.shirt.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);
			fishManPaint.sky.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);
			fishManPaint.water.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);
			fishManPaint.grass.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);
			fishManPaint.fish.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);
			fishManPaint.short.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);
			fishManPaint.fishbox.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);
			fishManPaint.hat.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor);
			fishManPaint.palitr.alpha = 0;
			fishManPaint.palitrbutton.addEventListener(MouseEvent.MOUSE_DOWN, ShowPalitr);			
			fishManPaint.takepoto.addEventListener(MouseEvent.MOUSE_DOWN, goHome);
			fishManPaint.paintbox.addEventListener(MouseEvent.MOUSE_DOWN, changePointClick);
			colorBox = new PaintBox();
			colorBox.width = colorBox.width / 2;
			colorBox.height = colorBox.height / 2;
			
		}
		
		private function closeBoxFunc(e:MouseEvent):void
		{
		
			fishManPaint.paintbox.visible = true;
			removeChild(colorBox);
			Mouse.show();
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		private function changePointClick(e:MouseEvent):void
		{
			addChild(colorBox);			
			Mouse.hide();
			fishManPaint.paintbox.visible = false;
			Mouse.hide();
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		private function mouseMoveHandler(e:MouseEvent):void
		{
			colorBox.x = e.stageX - colorBox.width / 2 //+ 20;
			colorBox.y = e.stageY - colorBox.height / 2 + 6;
		}	
		
		private function goHome(e:MouseEvent):void
		{
			var jpg:Raghats = new Raghats(stage);
			jpg.addEventListener(DataEvent.DATA, jpgListener);
			
		}
		
		private function jpgListener(e:DataEvent):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "MovrchiFishMans"));
		}
		
		private function ChangePictureColor(e:MouseEvent):void
		{
			if (e.currentTarget.name == "sky")
			{
				fishManPaint.sky.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "shirt")
			{
				fishManPaint.shirt.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "water")
			{
				fishManPaint.water.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "grass")
			{
				fishManPaint.grass.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "fish")
			{
				fishManPaint.fish.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "short")
			{
				fishManPaint.short.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "fishbox")
			{
				fishManPaint.fishbox.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "hat")
			{
				fishManPaint.hat.transform.colorTransform = color;
			}
		
		}
		
		private function changePoint(e:MouseEvent):void
		{
			//fishManPaint.paintbox.x = mouseX;
			//	fishManPaint.paintbox.y = mouseY;
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
			fishManPaint.palitr.colors.transform.colorTransform = color;
			colorBox.paintcolor.transform.colorTransform = color;
		}
		
		private function ShowPalitr(e:MouseEvent):void
		{
			if (count == 0)
			{
				TweenMax.to(fishManPaint.palitr, 1, {alpha: 1});
				count++;
			}
			else if (count == 1)
			{
				TweenMax.to(fishManPaint.palitr, 1, {alpha: 0});
				count--;
			}
		}
	
	}

}
