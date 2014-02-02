package
{
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import com.greensock.*;
	import flash.ui.Mouse;
	
	public class PaintQali extends MovieClip
	{
		private var qaliPaint:MovieClip;
		private var color:ColorTransform;
		private var count:Number = 0;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var old_X:Number;
		private var old_Y:Number;
		private var colorBox:MovieClip;
		
		public function PaintQali(_stageWidth, _stageHeight, qaliPaint) //_stageWidth, _stageHeight, qaliPaint
		{
			this._stageWidth = _stageWidth;
			this._stageHeight = _stageHeight;
			this.qaliPaint = qaliPaint;
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler();
		}
		
		private function initHandler():void
		{
			
			qaliPaint.x =_stageWidth / 2;
			qaliPaint.y = _stageHeight / 2;
			qaliPaint.height = _stageHeight/1.2;
			qaliPaint.scaleX = qaliPaint.scaleY;
			
			old_X = qaliPaint.closebox.x;
			old_Y = qaliPaint.closebox.y;
			qaliPaint.closebox.addEventListener(MouseEvent.MOUSE_DOWN, closeBoxFunc);
			
			color = new ColorTransform();
			color.color = 0xFFFFFF;
			
			qaliPaint.divani.transform.colorTransform = color;
			
			qaliPaint.divani1.transform.colorTransform = color;
			
			qaliPaint.divani2.transform.colorTransform = color;
			
			qaliPaint.divani3.transform.colorTransform = color;
			
			qaliPaint.divanigv.transform.colorTransform = color;
			
			qaliPaint.kaba.transform.colorTransform = color;
			
			qaliPaint.kabisnw.transform.colorTransform = color;
			
			qaliPaint.shirt.transform.colorTransform = color;
			
			qaliPaint.surati1.transform.colorTransform = color;
			
			qaliPaint.surati2.transform.colorTransform = color;
			
			qaliPaint.surati3.transform.colorTransform = color;
			
			qaliPaint.suratich.transform.colorTransform = color;
			
			qaliPaint.tani.transform.colorTransform = color;
			
			qaliPaint.tanisnw.transform.colorTransform = color;
			
			qaliPaint.tma.transform.colorTransform = color;
			
			qaliPaint.window.transform.colorTransform = color;
			
			qaliPaint.wigni.transform.colorTransform = color;
			
			qaliPaint.yvavili1.transform.colorTransform = color;
			
			qaliPaint.yvavili2.transform.colorTransform = color;
			
			qaliPaint.yvavili3.transform.colorTransform = color;
			
			qaliPaint.yvavili4.transform.colorTransform = color;
			
			qaliPaint.yvavili5.transform.colorTransform = color;
			
			qaliPaint.wall.transform.colorTransform = color;
			qaliPaint.yeli.transform.colorTransform = color;
			
			qaliPaint.palitr.yellow.addEventListener(MouseEvent.CLICK, ColorsTrans)
			qaliPaint.palitr.red.addEventListener(MouseEvent.CLICK, ColorsTrans)
			qaliPaint.palitr.blue.addEventListener(MouseEvent.CLICK, ColorsTrans)
			qaliPaint.palitr.orange.addEventListener(MouseEvent.CLICK, ColorsTrans)
			qaliPaint.palitr.green.addEventListener(MouseEvent.CLICK, ColorsTrans)
			qaliPaint.palitr.purple.addEventListener(MouseEvent.CLICK, ColorsTrans)
			qaliPaint.palitr.white.addEventListener(MouseEvent.CLICK, ColorsTrans)
			qaliPaint.palitr.lightgray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			qaliPaint.palitr.gray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			qaliPaint.palitr.black.addEventListener(MouseEvent.CLICK, ColorsTrans)
			
			qaliPaint.divani.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //divani			
			qaliPaint.divani1.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //divani1			
			qaliPaint.wall.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //divani1			
			
			qaliPaint.divani2.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*divani2
			
			qaliPaint.divani3.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*divani3
			qaliPaint.divanigv.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //divanigv
			qaliPaint.kaba.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //kaba
			qaliPaint.kabisnw.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //kabisnw
			qaliPaint.shirt.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //shirt
			qaliPaint.surati1.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //surati1
			qaliPaint.surati2.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //surati2
			qaliPaint.surati3.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //surati3
			qaliPaint.suratich.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //suratich
			qaliPaint.tani.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //tani
			qaliPaint.tanisnw.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //tanisnw
			qaliPaint.tma.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //tma
			
			qaliPaint.window.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*window
			qaliPaint.wigni.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*wigni
			qaliPaint.yvavili1.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*yvavili1
			qaliPaint.yvavili2.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*yvavili2
			qaliPaint.yvavili3.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*yvavili3
			qaliPaint.yvavili4.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*yvavili4
			qaliPaint.yvavili5.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*yvavili5
			qaliPaint.palitr.alpha = 0;
			qaliPaint.palitrbutton.addEventListener(MouseEvent.MOUSE_DOWN, ShowPalitr);		
			qaliPaint.paintbox.addEventListener(MouseEvent.MOUSE_DOWN, changePointClick);
			qaliPaint.takepoto.addEventListener(MouseEvent.MOUSE_DOWN, goHome)
			
			colorBox = new PaintBox();
			colorBox.width = colorBox.width / 2;
			colorBox.height = colorBox.height / 2;
			
		}
		
		private function closeBoxFunc(e:MouseEvent):void
		{
		
			qaliPaint.paintbox.visible = true;
			removeChild(colorBox);
			Mouse.show();
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		private function changePointClick(e:MouseEvent):void
		{
			addChild(colorBox);			
			Mouse.hide();
			qaliPaint.paintbox.visible = false;
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
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "MovrchiQals"))
		}
		private function ChangePictureColor(e:MouseEvent):void
		{
			if (e.currentTarget.name == "divani")
			{
				qaliPaint.divani.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "divani1")
			{
				qaliPaint.divani1.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "divani2")
			{
				qaliPaint.divani2.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "divani3")
			{
				qaliPaint.divani3.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "divanigv")
			{
				qaliPaint.divanigv.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "kaba")
			{
				qaliPaint.kaba.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "kabisnw")
			{
				qaliPaint.kabisnw.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "shirt")
			{
				qaliPaint.shirt.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "surati1")
			{
				qaliPaint.surati1.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "surati2")
			{
				qaliPaint.surati2.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "surati3")
			{
				qaliPaint.surati3.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "suratich")
			{
				qaliPaint.suratich.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "tani")
			{
				qaliPaint.tani.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "tanisnw")
			{
				qaliPaint.tanisnw.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "tma")
			{
				qaliPaint.tma.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "window")
			{
				qaliPaint.window.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "wigni")
			{
				qaliPaint.wigni.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "yvavili1")
			{
				qaliPaint.yvavili1.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "yvavili2")
			{
				qaliPaint.yvavili2.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "yvavili3")
			{
				qaliPaint.yvavili3.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "yvavili4")
			{
				qaliPaint.yvavili4.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "yvavili5")
			{
				qaliPaint.yvavili5.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "wall")
			{
				qaliPaint.wall.transform.colorTransform = color;
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
			qaliPaint.palitr.colors.transform.colorTransform = color;
			colorBox.paintcolor.transform.colorTransform = color;
		}
		
		private function ShowPalitr(e:MouseEvent):void
		{
			if (count == 0)
			{
				TweenMax.to(qaliPaint.palitr, 1, {alpha: 1});
				count++;
			}
			else if (count == 1)
			{
				TweenMax.to(qaliPaint.palitr, 1, {alpha: 0});
				count--;
			}
		}
	
	}

}

