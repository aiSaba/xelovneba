package
{
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import com.greensock.*;
	import flash.ui.Mouse;
	
	public class PaintNatrumorti extends MovieClip
	{
		private var naturmortiPaint:MovieClip;
		private var color:ColorTransform;
		private var count:Number = 0;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var old_X:Number;
		private var old_Y:Number;
		private var colorBox:MovieClip;
		
		public function PaintNatrumorti(_stageWidth, _stageHeight, naturmortiPaint) //
		{
			this._stageWidth = _stageWidth;
			this._stageHeight = _stageHeight;
			this.naturmortiPaint = naturmortiPaint;
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler();
		}
		
		private function initHandler():void
		{
			trace(naturmortiPaint);
			naturmortiPaint.x =_stageWidth / 2;
			naturmortiPaint.y = _stageHeight / 2;
			naturmortiPaint.height = _stageHeight/1.2;
			naturmortiPaint.scaleX = naturmortiPaint.scaleY;
			
			old_X = naturmortiPaint.closebox.x;
			old_Y = naturmortiPaint.closebox.y;
			naturmortiPaint.closebox.addEventListener(MouseEvent.MOUSE_DOWN, closeBoxFunc);
			
			color = new ColorTransform();
			color.color = 0xFFFFFF;
			
			naturmortiPaint.alln.wall.transform.colorTransform = color;
			
			naturmortiPaint.alln.doqi1.transform.colorTransform = color;
			
			naturmortiPaint.alln.doqi2.transform.colorTransform = color;
			
			naturmortiPaint.alln.jami1.transform.colorTransform = color;
			
			naturmortiPaint.alln.jami2.transform.colorTransform = color;
			
			naturmortiPaint.alln.magida.transform.colorTransform = color;
			
			naturmortiPaint.alln.santeli1.transform.colorTransform = color;
			
			naturmortiPaint.alln.santeli2.transform.colorTransform = color;
			naturmortiPaint.alln.santeli3.transform.colorTransform = color;
			
			naturmortiPaint.alln.santeli4.transform.colorTransform = color;
			
			naturmortiPaint.palitr.alpha = 0;
			naturmortiPaint.palitr.yellow.addEventListener(MouseEvent.CLICK, ColorsTrans)
			naturmortiPaint.palitr.red.addEventListener(MouseEvent.CLICK, ColorsTrans)
			naturmortiPaint.palitr.blue.addEventListener(MouseEvent.CLICK, ColorsTrans)
			naturmortiPaint.palitr.orange.addEventListener(MouseEvent.CLICK, ColorsTrans)
			naturmortiPaint.palitr.green.addEventListener(MouseEvent.CLICK, ColorsTrans)
			naturmortiPaint.palitr.purple.addEventListener(MouseEvent.CLICK, ColorsTrans)
			naturmortiPaint.palitr.white.addEventListener(MouseEvent.CLICK, ColorsTrans)
			naturmortiPaint.palitr.lightgray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			naturmortiPaint.palitr.gray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			naturmortiPaint.palitr.black.addEventListener(MouseEvent.CLICK, ColorsTrans)
			
			naturmortiPaint.alln.wall.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //hat
			
			naturmortiPaint.alln.doqi1.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //kashni
			naturmortiPaint.alln.doqi2.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //face			
			naturmortiPaint.alln.jami1.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*shirt
			
			naturmortiPaint.alln.jami2.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*gili	
			naturmortiPaint.alln.magida.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*gili
			naturmortiPaint.alln.santeli1.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*gili
			naturmortiPaint.alln.santeli2.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*gili
			
			naturmortiPaint.alln.santeli3.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*wall
			naturmortiPaint.alln.santeli4.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*land
			
			naturmortiPaint.palitrbutton.addEventListener(MouseEvent.MOUSE_DOWN, ShowPalitr);
			
			naturmortiPaint.paintbox.addEventListener(MouseEvent.MOUSE_DOWN, changePointClick);
			naturmortiPaint.takepoto.addEventListener(MouseEvent.MOUSE_DOWN, goHome)
			
			colorBox = new PaintBox();
			colorBox.width = colorBox.width / 2;
			colorBox.height = colorBox.height / 2;
			
		}
		
		private function closeBoxFunc(e:MouseEvent):void
		{
		
			naturmortiPaint.paintbox.visible = true;
			removeChild(colorBox);
			Mouse.show();
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		private function changePointClick(e:MouseEvent):void
		{
			addChild(colorBox);			
			Mouse.hide();
			naturmortiPaint.paintbox.visible = false;
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
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "MovrchiN"))
		}
		
		private function ChangePictureColor(e:MouseEvent):void
		{
			if (e.currentTarget.name == "wall")
			{
				naturmortiPaint.alln.wall.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "doqi1")
			{
				naturmortiPaint.alln.doqi1.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "doqi2")
			{
				naturmortiPaint.alln.doqi2.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "jami1")
			{
				naturmortiPaint.alln.jami1.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "jami2")
			{
				naturmortiPaint.alln.jami2.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "magida")
			{
				naturmortiPaint.alln.magida.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "santeli1")
			{
				naturmortiPaint.alln.santeli1.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "santeli2")
			{
				naturmortiPaint.alln.santeli2.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "santeli3")
			{
				naturmortiPaint.alln.santeli3.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "santeli4")
			{
				naturmortiPaint.alln.santeli4.transform.colorTransform = color;
			}
		
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
			naturmortiPaint.palitr.colors.transform.colorTransform = color;
			colorBox.paintcolor.transform.colorTransform = color;
		}
		
		private function ShowPalitr(e:MouseEvent):void
		{
			if (count == 0)
			{
				TweenMax.to(naturmortiPaint.palitr, 1, {alpha: 1});
				count++;
			}
			else if (count == 1)
			{
				TweenMax.to(naturmortiPaint.palitr, 1, {alpha: 0});
				count--;
			}
		}
	
	}

}

