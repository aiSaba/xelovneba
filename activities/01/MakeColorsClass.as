
package
{
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.*;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	
	public class MakeColorsClass extends MovieClip
	{
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		private var mainObjects_mc:MovieClip;
		private var narinjisferi:MovieClip;
		private var iasamnisferi:MovieClip;
		private var mwvane:MovieClip;
		private var witeli:MovieClip;
		private var yviteli:MovieClip;
		private var lurji:MovieClip;
		private var witeliDidi:MovieClip;
		private var lurjiDidi:MovieClip;
		private var yviteliDidiNaxevari:MovieClip;
		private var yviteliDidiMteli:MovieClip;
		private var funji:MovieClip;
		private var dafa:MovieClip;
		private var drawButton:MovieClip;
		private var lurjiDidiNaxevari:MovieClip;
		
		private var namesString:String = new String();
		private var pataraArray:Array;
		private var didiArray:Array;
		
		private var _glowFilter:Boolean = new Boolean(false);
		private var tempVar:String;
		
		public function MakeColorsClass(_stageHeight, _stageWidth, mainObjects_mc)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			this.mainObjects_mc = mainObjects_mc;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (pataraArray)
			{
				for (var i:int = 0; i < pataraArray.length; i++)
				{
					pataraArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, chooseColor);
				}
				
			}
			if (drawButton)
			{
				drawButton.removeEventListener(MouseEvent.MOUSE_DOWN, drawMwvane);
				drawButton.removeEventListener(MouseEvent.MOUSE_DOWN, drawNarinjisferi);
				drawButton.removeEventListener(MouseEvent.MOUSE_DOWN, drawIasamnisferi);
			}
			
			mainObjects_mc.visible = false;
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		
		private function addObjects():void
		{
			mainObjects_mc.x = _stageWidth / 2;
			mainObjects_mc.y = _stageHeight / 2;
			
			mainObjects_mc.height = _stageHeight / 1.2;
			mainObjects_mc.scaleX = mainObjects_mc.scaleY;
			/////////initialize objects
			//patara ferebi
			narinjisferi = mainObjects_mc.dafa.pataraFerebi.narinjisferi;
			mwvane = mainObjects_mc.dafa.pataraFerebi.mwvane;
			witeli = mainObjects_mc.dafa.pataraFerebi.witeli;
			yviteli = mainObjects_mc.dafa.pataraFerebi.yviteli;
			lurji = mainObjects_mc.dafa.pataraFerebi.lurji;
			iasamnisferi = mainObjects_mc.dafa.pataraFerebi.iasamnisferi;
			
			witeli.mouseEnabled = false;
			yviteli.mouseEnabled = true;
			lurji.mouseEnabled = true;
			//didi ferebi
			witeliDidi = mainObjects_mc.dafa.didiFerebi.witeliDidi;
			lurjiDidi = mainObjects_mc.dafa.didiFerebi.lurjiDidi;
			lurjiDidiNaxevari = mainObjects_mc.dafa.didiFerebi.lurjiDidiNaxevari;
			yviteliDidiNaxevari = mainObjects_mc.dafa.didiFerebi.yviteliNaxevari;
			yviteliDidiMteli = mainObjects_mc.dafa.didiFerebi.yviteliMteli;
			//
			funji = mainObjects_mc.funji;
			dafa = mainObjects_mc.dafa;
			drawButton = mainObjects_mc.drawButton;
			/////////////////////////////////////
			/////////didi ferebi
			witeliDidi.alpha = 0;
			lurjiDidi.alpha = 0;
			yviteliDidiNaxevari.alpha = 0;
			yviteliDidiMteli.alpha = 0;
			lurjiDidiNaxevari.alpha = 0;
			iasamnisferi.alpha = 0;
			////////patara ferebi
			narinjisferi.alpha = 0;
			mwvane.alpha = 0;
			/////////////
			
			witeli.mouseEnabled = false;
			mainObjects_mc.mititebaText.text = "მონიშნე ლურჯი და ყვითელი ფერი";
			startGame();
		
		}
		
		private function startGame():void
		{
			
			pataraArray = [witeli, yviteli, lurji];
			didiArray = [witeliDidi, lurjiDidi, yviteliDidiMteli, yviteliDidiNaxevari];
			
			for (var i:int = 0; i < pataraArray.length; i++)
			{
				pataraArray[i].addEventListener(MouseEvent.MOUSE_DOWN, chooseColor);
			}
			
			funji.stop();
			
			drawButton.mouseEnabled = false;
		}
		
		private function chooseColor(e:MouseEvent):void
		{
			mainObjects_mc.mititebaText.text = "";
			if (e.currentTarget == lurji)
			{
				var soundCon1:SoundControl = new SoundControl();
				addChild(soundCon1);
				soundCon1.loadSound("correct.mp3", 1);
				soundCon1.soundPlay();
				
				namesString += "1";
				lurji.mouseEnabled = false;
				if (_glowFilter == false)
				{
					TweenMax.to(e.currentTarget, 0.2, {glowFilter: {color: 0x91e600, alpha: 1, blurX: 30, blurY: 30, strength: 1.5, quality: 3}});
				}
				else
				{
					//e.currentTarget.filters = { };
				}
				
				trace("lurji");
				
			}
			if (e.currentTarget == yviteli)
			{
				var soundCon2:SoundControl = new SoundControl();
				addChild(soundCon2);
				soundCon2.loadSound("correct.mp3", 1);
				soundCon2.soundPlay();
				
				namesString += "3";
				yviteli.mouseEnabled = false;
				if (_glowFilter == false)
				{
					TweenMax.to(e.currentTarget, 0.2, {glowFilter: {color: 0x91e600, alpha: 1, blurX: 30, blurY: 30, strength: 1.5, quality: 3}});
				}
				else
				{
					//e.currentTarget.filters = { };
				}
				
				trace("yviteli");
			}
			if (e.currentTarget == witeli)
			{
				var soundCon3:SoundControl = new SoundControl();
				addChild(soundCon3);
				soundCon3.loadSound("correct.mp3", 1);
				soundCon3.soundPlay();
				
				namesString += "2";
				witeli.mouseEnabled = false;
				if (_glowFilter == false)
				{
					TweenMax.to(e.currentTarget, 0.2, {glowFilter: {color: 0x91e600, alpha: 1, blurX: 30, blurY: 30, strength: 1.5, quality: 3}});
				}
				else
				{
					//e.currentTarget.filters = { };
				}
				
				trace("witeli");
			}
			
			if (namesString == "13" || namesString == "31")
			{
				drawButton.mouseEnabled = true;
				drawButton.addEventListener(MouseEvent.MOUSE_DOWN, drawMwvane);
			}
			if (namesString == "32" || namesString == "23")
			{
				drawButton.mouseEnabled = true;
				drawButton.addEventListener(MouseEvent.MOUSE_DOWN, drawNarinjisferi);
			}
			if (namesString == "12" || namesString == "21")
			{
				drawButton.mouseEnabled = true;
				drawButton.addEventListener(MouseEvent.MOUSE_DOWN, drawIasamnisferi);
			}
		
		}
		
		///////////////////////////////MWVANEEEEE
		/////////////////////////////////////////
		/////////////////////////////////////////
		private function drawMwvane(e:MouseEvent):void
		{
			mouseEnabledFalse();
			
			funjiDrawing();
			setTimeout(drawLurji1, 500);
		}
		
		private function drawLurji1():void
		{
			TweenMax.to(lurjiDidi, 1, {alpha: 1, onComplete: function()
				{
					//funjiDrawing();
					drawYviteli();
				
				}});
		}
		
		private function drawYviteli():void
		{
			funjiDrawing();
			setTimeout(function()
				{
					TweenMax.to(yviteliDidiMteli, 1, {alpha: 1});
					TweenMax.to(yviteliDidiNaxevari, 1, {alpha: 1, onComplete: makeNewColor});
				}, 500);
		}
		
		private function makeGreen():void
		{
			TweenMax.to(mwvane, 1, {alpha: 1, onComplete: function()
				{
					lurji.mouseEnabled = false;
					greenDisappear();
				}});
		}
		
		private function greenDisappear():void
		{
			setTimeout(function()
				{
					TweenMax.to(yviteliDidiMteli, 1, {alpha: 0, onComplete: function()
						{
							TweenMax.to(lurji, 0.2, {glowFilter: {color: 0x91e600, alpha: 1, blurX: 30, blurY: 30, strength: 1.5, quality: 3, remove: true}});
							TweenMax.to(yviteli, 0.2, {glowFilter: {color: 0x91e600, alpha: 1, blurX: 30, blurY: 30, strength: 1.5, quality: 3, remove: true}});
							mainObjects_mc.mititebaText.text = "მონიშნე წითელი და ყვითელი ფერი";
						}});
					TweenMax.to(yviteliDidiNaxevari, 1, {alpha: 0, onComplete: function()
						{
							drawButton.mouseEnabled = true;
							witeli.mouseEnabled = true;
							yviteli.mouseEnabled = true;
						}});
					TweenMax.to(lurjiDidi, 1, {alpha: 0});
				}, 500);
			
			drawButton.removeEventListener(MouseEvent.MOUSE_DOWN, drawMwvane);
		}
		
		//////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////
		
		////////////////////NARINJISFERI
		//////////////////////////////////////
		//////////////////////////////////////
		private function drawNarinjisferi(event:MouseEvent):void
		{
			mouseEnabledFalse();
			funjiDrawing();
			setTimeout(function()
				{
					TweenMax.to(witeliDidi, 1, {alpha: 1, onComplete: drawYviteli});
				}, 500);
		}
		
		private function makeNarinjisferi():void
		{
			TweenMax.to(narinjisferi, 1, {alpha: 1, onComplete: narinjisferiDisappear});
		}
		
		private function narinjisferiDisappear():void
		{
			setTimeout(function()
				{
					TweenMax.to(yviteliDidiMteli, 1, {alpha: 0, onComplete: function()
						{
							TweenMax.to(witeli, 0.2, {glowFilter: {color: 0x91e600, alpha: 1, blurX: 30, blurY: 30, strength: 1.5, quality: 3, remove: true}});
							TweenMax.to(yviteli, 0.2, {glowFilter: {color: 0x91e600, alpha: 1, blurX: 30, blurY: 30, strength: 1.5, quality: 3, remove: true}});
							mainObjects_mc.mititebaText.text = "მონიშნე ლურჯი და წითელი ფერი";
						}});
					TweenMax.to(yviteliDidiNaxevari, 1, {alpha: 0, onComplete: function()
						{
							drawButton.mouseEnabled = true;
							witeli.mouseEnabled = true;
							lurji.mouseEnabled = true;
						}});
					TweenMax.to(witeliDidi, 1, {alpha: 0});
				}, 500);
			
			drawButton.removeEventListener(MouseEvent.MOUSE_DOWN, drawNarinjisferi);
		}
		
		////////////////////////////////////
		//////////////////////////////////////////////////////////////////////////////////////
		
		////////////////IASAMNISFERI
		///////////////////////////////////////
		////////////////////////////////////////
		
		private function drawIasamnisferi(event:MouseEvent):void
		{
			mouseEnabledFalse();
			
			funjiDrawing();
			setTimeout(function()
				{
					TweenMax.to(witeliDidi, 1, {alpha: 1, onComplete: drawLurji2});
				}, 500);
		}
		
		private function drawLurji2():void
		{
			funjiDrawing();
			setTimeout(function()
				{
					TweenMax.to(lurjiDidiNaxevari, 1, {alpha: 0.5});
					TweenMax.to(lurjiDidi, 1, {alpha: 1, onComplete: makeIasamnisferi});
				}, 500);
		}
		
		private function makeIasamnisferi():void
		{
			TweenMax.to(iasamnisferi, 1, {alpha: 1, onComplete: iasamnisferiDisappear});
		}
		
		private function iasamnisferiDisappear():void
		{
			setTimeout(function()
				{
					TweenMax.to(witeliDidi, 1, {alpha: 0, onComplete: function()
						{
							drawButton.mouseEnabled = true;
							lurji.mouseEnabled = true;
							witeli.mouseEnabled = true;
						}});
					TweenMax.to(lurjiDidi, 1, {alpha: 0});
					TweenMax.to(lurjiDidiNaxevari, 1, {alpha: 0});
				}, 500);
			
			destroy(null);
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfStage"));
			drawButton.removeEventListener(MouseEvent.MOUSE_DOWN, drawIasamnisferi);
		
		}
		
		//////////////OTHER FUNCTIONS
		/////////////////////////////
		/////////////////////////////
		private function changeGlow():void
		{
			_glowFilter = true;
		}
		
		private function funjiDrawing():void
		{
			var soundCon2:SoundControl = new SoundControl();
			addChild(soundCon2);
			soundCon2.loadSound("brush1.mp3", .6);
			
			setTimeout(function()
				{
					soundCon2.soundPlay();
				}, 300);
			drawButton.mouseEnabled = false;
			TweenMax.to(funji, 1.5, {frame: funji.totalFrames, onComplete: function()
				{
					funji.gotoAndStop(1);
				//drawButton.mouseEnabled = true;
				}});
		
		}
		
		////////////
		////////////
		private function makeNewColor():void
		{
			if (namesString == "13" || namesString == "31")
			{
				makeGreen();
				namesString = "";
			}
			if (namesString == "32" || namesString == "23")
			{
				makeNarinjisferi();
				namesString = "";
			}
			if (namesString == "12" || namesString == "21")
			{
				
				///////////////////////////////////TODO/////////////////////////////////////////
				////////////////////////////////////////////////////////////////////////////////
				//witeli.mouseEnabled = false;
				//lurji.mouseEnabled = false;
				//////////////////
				//yviteli.mouseEnabled = false;
				
				namesString = "";
			}
		}
		
		private function mouseEnabledFalse():void
		{
			drawButton.mouseEnabled = false;
			witeli.mouseEnabled = false;
			yviteli.mouseEnabled = false;
			lurji.mouseEnabled = false;
		}
		///////////////////////////////////////////
		//////////////////////////////////////////////
	
	}

}
