﻿package  
{
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.setTimeout;
	
	
	
	public class Game extends MovieClip 
	{
		private var crossWord:MovieClip;
		
		private var AnbaniArr:Array;
		private var AnbaniArrText:Array;	
		
		private var portreti:Array;
		private var portretiText:Array;
		
		private var pasteli:Array;
		private var pasteliText:Array;
		
		private var shtrixi:Array;
		private var shtrixiText:Array;
		
		private var xazi:Array;
		private var xaziText:Array;
		
		private var palitra:Array;
		private var palitraText:Array;
		
		private var vitraji:Array;
		private var vitrajiText:Array;
		
		private var reliefi:Array;
		private var reliefiText:Array;
		
		private var _Width:Number;
		private var _Height:Number;
		
		private var index:int;
		private var count:int;
		private var soundControl1:SoundControl;
		
		private var timerC:TimerClass;
		private var qula:int;
		
		private var point:Point
		
		
		
		public function Game(_Width:Number =1024, _Height:Number = 768) 
		{
			this._Height = _Height;
			this._Width = _Width;
			
			addEventListener(Event.ADDED_TO_STAGE, init)
			addEventListener(Event.REMOVED_FROM_STAGE, Destroy)
		}
		
		private function Destroy(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, Destroy);
			for (var i:int = 0; i < AnbaniArr.length; i++)
			{
				AnbaniArr[i].removeEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
				AnbaniArr[i].removeEventListener(MouseEvent.MOUSE_UP, stopDragHandler);
			}
			if (crossWord)
			{
				removeChild(crossWord)
				crossWord = null
			}
		}
		
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler()
		}
		
		private function initHandler():void 
		{
			crossWord = new CrossWord();
			crossWord.x = _Width / 2;
			crossWord.y = _Height / 2;
			crossWord.height = _Height / 1.2;
			crossWord.scaleX = crossWord.scaleY;
			addChild(crossWord);
			
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
			timerC = new TimerClass();
			addChild(timerC);
			timerC.x = _Width - timerC.width;
			timerC.y =  timerC.height;
			
			AnbaniArr = [crossWord.a, crossWord.b, crossWord.g, crossWord.d, crossWord.e, crossWord.v, crossWord.zz, crossWord.tt, crossWord.i, crossWord.k, crossWord.l, crossWord.m, crossWord.n, crossWord.o, crossWord.p, crossWord.jj, crossWord.r, crossWord.s, crossWord.t, crossWord.u, crossWord.f, crossWord.q, crossWord.rr, crossWord.yy, crossWord.ss, crossWord.cc, crossWord.c, crossWord.zzz, crossWord.w, crossWord.ww, crossWord.xx, crossWord.j, crossWord.h];
			
			AnbaniArrText = [crossWord.a.a, crossWord.b.b, crossWord.g.g, crossWord.d.d, crossWord.e.e, crossWord.v.v, crossWord.zz.zz, crossWord.tt.tt, crossWord.i.i, crossWord.k.k, crossWord.l.l, crossWord.m.m, crossWord.n.n, crossWord.o.o, crossWord.p.p, crossWord.jj.jj, crossWord.r.r, crossWord.s.s, crossWord.t.t, crossWord.u.u, crossWord.f.f, crossWord.q.q, crossWord.rr.rr, crossWord.yy.yy, crossWord.ss.ss, crossWord.cc.cc, crossWord.c.c, crossWord.zzz.zzz, crossWord.w.w, crossWord.ww.ww, crossWord.xx.xx, crossWord.j.j, crossWord.h.h];
			
			portreti = [crossWord.o1, crossWord.r1, crossWord.t1, crossWord.r2, crossWord.e1, crossWord.t2, crossWord.i1];
			portretiText = [crossWord.o1.o1, crossWord.r1.r1, crossWord.t1.t1, crossWord.r2.r2, crossWord.e1.e1, crossWord.t2.t2, crossWord.i1.i1];
			
			pasteli = [crossWord.p1, crossWord.a1, crossWord.s1, crossWord.t3, crossWord.l1, crossWord.i2];
			pasteliText = [crossWord.p1.p1, crossWord.a1.a1, crossWord.s1.s1, crossWord.t3.t3, crossWord.l1.l1, crossWord.i2.i2];
			
			shtrixi = [crossWord.s2, crossWord.t4, crossWord.r3, crossWord.x1, crossWord.i3];
			shtrixiText = [crossWord.s2.s2, crossWord.t4.t4, crossWord.r3.r3, crossWord.x1.x1, crossWord.i3.i3];
			
			xazi = [crossWord.x2, crossWord.a2, crossWord.i4];
			xaziText = [crossWord.x2.x2, crossWord.a2.a2, crossWord.i4.i4];
			
			palitra = [crossWord.p1, crossWord.l2, crossWord.i5, crossWord.t5,crossWord.r4, crossWord.a4];
			palitraText = [crossWord.p1.p1, crossWord.l2.l2, crossWord.i5.i5, crossWord.t5.t5, crossWord.r4.r4, crossWord.a4.a4];
			
			vitraji = [crossWord.i7, crossWord.r5, crossWord.a5,crossWord.f2, crossWord.i6];
			vitrajiText = [crossWord.i7.i7, crossWord.r5.r5, crossWord.a5.a5, crossWord.f2.f2, crossWord.i6.i6];
			
			reliefi = [crossWord.r6, crossWord.e2, crossWord.l3, crossWord.e3, crossWord.f1, crossWord.i8];
			reliefiText = [crossWord.r6.r6, crossWord.e2.e2, crossWord.l3.l3, crossWord.e3.e3, crossWord.f1.f1, crossWord.i8.i8];
			
			
			for (var i:int = 0; i < AnbaniArr.length; i++)
			{
				AnbaniArr[i].buttonMode = true; 
				AnbaniArr[i].addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
				AnbaniArr[i].addEventListener(MouseEvent.MOUSE_UP, stopDragHandler);
			}
			
			AlphaNull(portretiText);//
			AlphaNull(pasteliText);//
			AlphaNull(shtrixiText);//
			AlphaNull(xaziText);//
			AlphaNull(palitraText);//
			AlphaNull(vitrajiText);//
			AlphaNull(reliefiText);//
			
			
			for (var j:int = 1; j <= 7; j++) 
			{
				crossWord['h' + j + 'text'].visible = false;
				crossWord['h'+j].addEventListener(MouseEvent.MOUSE_DOWN, ShowHelp)
			}
			
			crossWord.help.addEventListener(MouseEvent.MOUSE_DOWN, helpLetter)
			
		
		}
		
		private function helpLetter(e:MouseEvent):void 
		{
			shonwrandLett(portretiText, Math.round(Math.random()*(portretiText.length -1)))
			shonwrandLett(pasteliText, Math.round(Math.random()*(pasteliText.length -1)));
			shonwrandLett(shtrixiText, Math.round(Math.random()*(shtrixiText.length -1)));
			shonwrandLett(xaziText, Math.round(Math.random()*(xaziText.length -1)))
			shonwrandLett(palitraText, Math.round(Math.random()*(palitraText.length -1)));
			shonwrandLett(vitrajiText, Math.round(Math.random()*(vitrajiText.length -1)));
			shonwrandLett(reliefiText, Math.round(Math.random()*(reliefiText.length -1)));
			
		}
		private function shonwrandLett(textBox:Array, randNum:Number):void
		{
			if (textBox[randNum].alpha == 1)
			{
				return;
			}			
			textBox[randNum].alpha = 1;
			count ++;
			TheEnd()
		}
		private function AlphaNull(Arr:Array):void
		{
			
			for (var i:int = 0; i < Arr.length; i++)
			{
				Arr[i].alpha = 0;				
			}
		}
		private function startDragHandler(e:MouseEvent):void
		{
			e.currentTarget.startDrag();
			point = new Point();
			point.x = e.currentTarget.x;
			point.y = e.currentTarget.y;
		}
		private function oldCordinats(e:MovieClip):void
		{
			e.x = point.x;
			e.y = point.y;
			e.stopDrag();
		}
		private function sendDispach():void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
			qula = timerC.returnQula();
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + qula.toString() ));
			removeChild(timerC);
			Destroy(null);
		}
		private function TheEnd():void 
		{
			
			if (count == 41)
			{
				soundControl1 = new SoundControl();
				addChild(soundControl1);
				soundControl1.loadSound("correct.mp3", 1);
				soundControl1.soundPlay();
				setTimeout(sendDispach, 3000)
			}
		}
		private function stopDragHandler(e:MouseEvent):void
		{
			
			
			FuncHandler(e.currentTarget as MovieClip, portreti, portretiText)
			FuncHandler(e.currentTarget as MovieClip, pasteli, pasteliText)
			FuncHandler(e.currentTarget as MovieClip, shtrixi, shtrixiText)
			FuncHandler(e.currentTarget as MovieClip, xazi, xaziText)
			FuncHandler(e.currentTarget as MovieClip, palitra, palitraText)
			FuncHandler(e.currentTarget as MovieClip, vitraji, vitrajiText)
			FuncHandler(e.currentTarget as MovieClip, reliefi, reliefiText)
			
			
		}
		private function FuncHandler(e:MovieClip, MainArr:Array, MainArrTex:Array)
		{
			for (var i:int = 0; i < AnbaniArr.length; i++)
			{
				for (var j:int = 0; j < MainArr.length; j++)
				{
					if (AnbaniArr[i].hitTestObject(MainArr[j]) && AnbaniArrText[i].text == MainArrTex[j].text)
					{
						if (MainArrTex[j].alpha == 1)
						{
							return;							
						}
						MainArrTex[j].alpha = 1;
						count++
						TheEnd()
						setTimeout(oldCordinats, 5, e)
						
					}
					else
					{
						setTimeout(oldCordinats, 5, e)
					}
				}
				
			}
			
			
		}
		private function ShowHelp(e:MouseEvent):void 
		{
			
			for (var i:int = 1; i <= 7; i++) 
			{
				if (e.currentTarget.name == ['h' + i] )
				{
					if (index == 0)
					{
						index++
						crossWord['h' + i + 'text'].visible = true;
					}
					else if (index == 1)
					{
						crossWord['h' + i + 'text'].visible = false;
						index -- 
					}
				}
			}
		}
		public function TimerStop():void
		{			
			timerC.pauseTimer();				
		}
		public function TimerResume():void
		{			
			timerC.resumeTimer();				
		}
	}
	
}