package  
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
		
		private var Aplikacia:Array;
		private var AplikaciaText:Array;
		
		private var Konturi:Array;
		private var KonturiText:Array;
		
		private var Arqiteqtura:Array;
		private var ArqiteqturaText:Array;
		
		private var Skulptura:Array;
		private var SkulpturaText:Array;
		
		private var Simetria:Array;
		private var SimetriaText:Array;
		
		private var Freska:Array;
		private var FreskaText:Array
		
		private var Naturmorti:Array;
		private var NaturmortiText:Array;
		
		private var Grafika:Array;
		private var GrafikaText:Array;
		
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
			
			Aplikacia = [crossWord.a1, crossWord.l1, crossWord.i1, crossWord.k1, crossWord.a2, crossWord.c1, crossWord.i2, crossWord.a3];
			AplikaciaText = [crossWord.a1.a1, crossWord.l1.l1, crossWord.i1.i1, crossWord.k1.k1, crossWord.a2.a2, crossWord.c1.c1, crossWord.i2.i2, crossWord.a3.a3];
			
			Konturi = [crossWord.k2, crossWord.n1, crossWord.t1, crossWord.u1, crossWord.r1, crossWord.i3];
			KonturiText = [crossWord.k2.k2, crossWord.n1.n1, crossWord.t1.t1, crossWord.u1.u1, crossWord.r1.r1, crossWord.i3.i3];
			
			Arqiteqtura = [crossWord.a4, crossWord.q1, crossWord.i4, crossWord.t2, crossWord.e1, crossWord.q2, crossWord.t3, crossWord.u2, crossWord.r2, crossWord.a5];
			ArqiteqturaText = [crossWord.a4.a4, crossWord.q1.q1, crossWord.i4.i4, crossWord.t2.t2, crossWord.e1.e1, crossWord.q2.q2, crossWord.t3.t3, crossWord.u2.u2, crossWord.r2.r2, crossWord.a5.a5];
			
			Skulptura = [crossWord.s1, crossWord.k3, crossWord.u3, crossWord.l2, crossWord.p1, crossWord.u4, crossWord.r3, crossWord.a6];
			SkulpturaText = [crossWord.s1.s1, crossWord.k3.k3, crossWord.u3.u3, crossWord.l2.l2, crossWord.p1.p1, crossWord.u4.u4, crossWord.r3.r3, crossWord.a6.a6];
			
			Simetria = [crossWord.s2, crossWord.i5, crossWord.m1, crossWord.e2, crossWord.t4, crossWord.i6, crossWord.a7];
			SimetriaText = [crossWord.s2.s2, crossWord.i5.i5, crossWord.m1.m1, crossWord.e2.e2, crossWord.t4.t4, crossWord.i6.i6, crossWord.a7.a7];
			
			Freska = [crossWord.f1, crossWord.r4, crossWord.s3, crossWord.k4, crossWord.a8];
			FreskaText = [crossWord.f1.f1, crossWord.r4.r4, crossWord.s3.s3, crossWord.k4.k4, crossWord.a8.a8];
			
			Naturmorti = [crossWord.n2, crossWord.a9, crossWord.u5, crossWord.r5, crossWord.m2, crossWord.o1, crossWord.r6, crossWord.t5, crossWord.i7];
			NaturmortiText = [crossWord.n2.n2, crossWord.a9.a9, crossWord.u5.u5, crossWord.r5.r5, crossWord.m2.m2, crossWord.o1.o1, crossWord.r6.r6, crossWord.t5.t5, crossWord.i7.i7];
			
			Grafika = [crossWord.g1, crossWord.r7, crossWord.a10,crossWord.f2, crossWord.k5, crossWord.a11];
			GrafikaText = [crossWord.g1.g1, crossWord.r7.r7, crossWord.a10.a10,crossWord.f2.f2, crossWord.k5.k5, crossWord.a11.a11];
			
			for (var i:int = 0; i < AnbaniArr.length; i++)
			{
				AnbaniArr[i].buttonMode = true; 
				AnbaniArr[i].addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
				AnbaniArr[i].addEventListener(MouseEvent.MOUSE_UP, stopDragHandler);
			}
			
			AlphaNull(AplikaciaText);//
			AlphaNull(KonturiText);//
			AlphaNull(ArqiteqturaText);//
			AlphaNull(SkulpturaText)//
			AlphaNull(SimetriaText);//
			AlphaNull(FreskaText);//
			AlphaNull(NaturmortiText);//
			AlphaNull(GrafikaText);//
			
			for (var j:int = 1; j <= 8; j++) 
			{
				crossWord['h' + j + 'text'].visible = false;
				crossWord['h'+j].addEventListener(MouseEvent.MOUSE_DOWN, ShowHelp)
			}
			
			crossWord.help.addEventListener(MouseEvent.MOUSE_DOWN, helpLetter)
			
		
		}
		
		private function helpLetter(e:MouseEvent):void 
		{
			shonwrandLett(AplikaciaText, Math.round(Math.random()*(AplikaciaText.length -1)))
			shonwrandLett(KonturiText, Math.round(Math.random()*(KonturiText.length -1)));
			shonwrandLett(ArqiteqturaText, Math.round(Math.random()*(ArqiteqturaText.length -1)));
			shonwrandLett(SkulpturaText, Math.round(Math.random()*(SkulpturaText.length -1)))
			shonwrandLett(SimetriaText, Math.round(Math.random()*(SimetriaText.length -1)));
			shonwrandLett(FreskaText, Math.round(Math.random()*(FreskaText.length -1)));
			shonwrandLett(NaturmortiText, Math.round(Math.random()*(NaturmortiText.length -1)));
			shonwrandLett(GrafikaText, Math.round(Math.random()*(GrafikaText.length -1)));
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
			if (count == 59)
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
			FuncHandler(e.currentTarget as MovieClip, Aplikacia, AplikaciaText)
			FuncHandler(e.currentTarget as MovieClip, Konturi, KonturiText)
			FuncHandler(e.currentTarget as MovieClip, Arqiteqtura, ArqiteqturaText)
			FuncHandler(e.currentTarget as MovieClip, Skulptura, SkulpturaText)
			FuncHandler(e.currentTarget as MovieClip, Simetria, SimetriaText)
			FuncHandler(e.currentTarget as MovieClip, Freska, FreskaText)
			FuncHandler(e.currentTarget as MovieClip, Naturmorti, NaturmortiText)
			FuncHandler(e.currentTarget as MovieClip, Grafika, GrafikaText)
			
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
