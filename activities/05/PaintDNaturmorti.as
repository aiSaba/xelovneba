package
{
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import com.greensock.*;
	import flash.ui.Mouse;
	
	public class PaintDNaturmorti extends MovieClip
	{
		private var dNaturmortiPaint:MovieClip;
		private var color:ColorTransform;
		private var count:Number = 0;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var old_X:Number;
		private var old_Y:Number;
		private var colorBox:MovieClip;
	
		
		public function PaintDNaturmorti(_stageWidth, _stageHeight, dNaturmortiPaint)
		{
			this._stageWidth = _stageWidth;
			this._stageHeight = _stageHeight;
			this.dNaturmortiPaint = dNaturmortiPaint;
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void
		{
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler();
		}
		
		private function initHandler():void
		{
			
			dNaturmortiPaint.x =_stageWidth / 2;
			dNaturmortiPaint.y = _stageHeight / 2;
			
			dNaturmortiPaint.height = _stageHeight/1.2;
			dNaturmortiPaint.scaleX = dNaturmortiPaint.scaleY;
			
			old_X = dNaturmortiPaint.closebox.x;
			old_Y = dNaturmortiPaint.closebox.y;
			dNaturmortiPaint.closebox.addEventListener(MouseEvent.MOUSE_DOWN, closeBoxFunc);
			
			color = new ColorTransform();
			color.color = 0xFFFFFF;
			
			dNaturmortiPaint.alln.doqi.transform.colorTransform = color;
			
			
			dNaturmortiPaint.alln.fexi1.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.fexi2.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.fexi3.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.ragac1.transform.colorTransform = color;
			dNaturmortiPaint.alln.ragac2.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.ragac3.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.ragac4.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.ragac5.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.ragac6.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.ragac7.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.ragac8.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.ragac9.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.ragac10.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.ragac11.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.ragac12.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.ragac13.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.ragac14.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.tavi.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.tvalebi.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.tvalebidacxviri.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.ujrebi1.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.ujrebi2.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.ujrebi3.transform.colorTransform = color;
			
			dNaturmortiPaint.alln.wall.transform.colorTransform = color;
			
			dNaturmortiPaint.palitr.yellow.addEventListener(MouseEvent.CLICK, ColorsTrans)
			dNaturmortiPaint.palitr.red.addEventListener(MouseEvent.CLICK, ColorsTrans)
			dNaturmortiPaint.palitr.blue.addEventListener(MouseEvent.CLICK, ColorsTrans)
			dNaturmortiPaint.palitr.orange.addEventListener(MouseEvent.CLICK, ColorsTrans)
			dNaturmortiPaint.palitr.green.addEventListener(MouseEvent.CLICK, ColorsTrans)
			dNaturmortiPaint.palitr.purple.addEventListener(MouseEvent.CLICK, ColorsTrans)
			dNaturmortiPaint.palitr.white.addEventListener(MouseEvent.CLICK, ColorsTrans)
			dNaturmortiPaint.palitr.lightgray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			dNaturmortiPaint.palitr.gray.addEventListener(MouseEvent.CLICK, ColorsTrans)
			dNaturmortiPaint.palitr.black.addEventListener(MouseEvent.CLICK, ColorsTrans)
			
			dNaturmortiPaint.alln.doqi.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //doqi			
			dNaturmortiPaint.alln.fexi1.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //fexi1			
			dNaturmortiPaint.alln.wall.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //wall			
			
			dNaturmortiPaint.alln.fexi2.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*fexi2
			
			dNaturmortiPaint.alln.fexi3.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*fexi3
			
			dNaturmortiPaint.alln.ragac1.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //ragac1
			dNaturmortiPaint.alln.ragac2.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //ragac2
			dNaturmortiPaint.alln.ragac3.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //ragac3
			dNaturmortiPaint.alln.ragac4.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //ragac4
			dNaturmortiPaint.alln.ragac5.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //ragac5
			dNaturmortiPaint.alln.ragac6.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //ragac6
			dNaturmortiPaint.alln.ragac7.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //ragac7
			dNaturmortiPaint.alln.ragac8.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //ragac8
			dNaturmortiPaint.alln.ragac9.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //ragac9
			dNaturmortiPaint.alln.ragac10.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //ragac10
			dNaturmortiPaint.alln.ragac11.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //ragac11
			dNaturmortiPaint.alln.ragac12.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //ragac12
			dNaturmortiPaint.alln.ragac13.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //ragac13
			dNaturmortiPaint.alln.ragac14.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //ragac14
			dNaturmortiPaint.alln.tavi.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //tavi
			dNaturmortiPaint.alln.tvalebi.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //tvalebi
			dNaturmortiPaint.alln.tvalebidacxviri.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //tvalebidacxviri
			dNaturmortiPaint.alln.ujrebi1.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //ujrebi1
			
			dNaturmortiPaint.alln.ujrebi2.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*ujrebi2
			dNaturmortiPaint.alln.ujrebi3.addEventListener(MouseEvent.MOUSE_DOWN, ChangePictureColor); //*ujrebi3
			
			dNaturmortiPaint.palitr.alpha = 0;
			dNaturmortiPaint.palitrbutton.addEventListener(MouseEvent.MOUSE_DOWN, ShowPalitr);
			//addEventListener(MouseEvent.MOUSE_MOVE, changePoint);
			dNaturmortiPaint.paintbox.addEventListener(MouseEvent.MOUSE_DOWN, changePointClick);
			dNaturmortiPaint.takepoto.addEventListener(MouseEvent.MOUSE_DOWN, goHome)
			
			colorBox = new PaintBox();
			colorBox.width = colorBox.width / 2;
			colorBox.height = colorBox.height / 2;
			
		}
		
		private function closeBoxFunc(e:MouseEvent):void
		{
		
			dNaturmortiPaint.paintbox.visible = true;
			removeChild(colorBox);
			Mouse.show();
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		private function changePointClick(e:MouseEvent):void
		{
			addChild(colorBox);			
			Mouse.hide();
			dNaturmortiPaint.paintbox.visible = false;
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
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "MovrchiDN"))
		}
		
		private function ChangePictureColor(e:MouseEvent):void
		{
			if (e.currentTarget.name == "doqi")
			{
				dNaturmortiPaint.alln.doqi.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "fexi1")
			{
				dNaturmortiPaint.alln.fexi1.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "fexi2")
			{
				dNaturmortiPaint.alln.fexi2.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "fexi3")
			{
				dNaturmortiPaint.alln.fexi3.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "ragac1")
			{
				dNaturmortiPaint.alln.ragac1.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "ragac2")
			{
				dNaturmortiPaint.alln.ragac2.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "ragac3")
			{
				dNaturmortiPaint.alln.ragac3.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "ragac4")
			{
				dNaturmortiPaint.alln.ragac4.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "ragac5")
			{
				dNaturmortiPaint.alln.ragac5.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "ragac6")
			{
				dNaturmortiPaint.alln.ragac6.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "ragac7")
			{
				dNaturmortiPaint.alln.ragac7.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "ragac8")
			{
				dNaturmortiPaint.alln.ragac8.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "ragac9")
			{
				dNaturmortiPaint.alln.ragac9.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "ragac10")
			{
				dNaturmortiPaint.alln.ragac10.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "ragac11")
			{
				dNaturmortiPaint.alln.ragac11.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "ragac12")
			{
				dNaturmortiPaint.alln.ragac12.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "ragac13")
			{
				dNaturmortiPaint.alln.ragac13.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "ragac14")
			{
				dNaturmortiPaint.alln.ragac14.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "tavi")
			{
				dNaturmortiPaint.alln.tavi.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "tvalebi")
			{
				dNaturmortiPaint.alln.tvalebi.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "tvalebidacxviri")
			{
				dNaturmortiPaint.alln.tvalebidacxviri.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "ujrebi1")
			{
				dNaturmortiPaint.alln.ujrebi1.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "ujrebi2")
			{
				dNaturmortiPaint.alln.ujrebi2.transform.colorTransform = color;
			}
			if (e.currentTarget.name == "ujrebi3")
			{
				dNaturmortiPaint.alln.ujrebi3.transform.colorTransform = color;
			}
			
			if (e.currentTarget.name == "wall")
			{
				dNaturmortiPaint.alln.wall.transform.colorTransform = color;
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
			dNaturmortiPaint.palitr.colors.transform.colorTransform = color;
			colorBox.paintcolor.transform.colorTransform = color;
		}
		
		private function ShowPalitr(e:MouseEvent):void
		{
			if (count == 0)
			{
				TweenMax.to(dNaturmortiPaint.palitr, 1, {alpha: 1});
				count++;
			}
			else if (count == 1)
			{
				TweenMax.to(dNaturmortiPaint.palitr, 1, {alpha: 0});
				count--;
			}
		}
	
	}

}

