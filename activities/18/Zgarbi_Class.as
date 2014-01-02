package  {
	import fl.motion.Animator;
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import flash.events.DataEvent;
	
	
	public class Zgarbi_Class extends MovieClip {
		
		private var zgarbi_MC:MovieClip;
		
		private var zgarbi:MovieClip;
		private var textFrame:MovieClip;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var soundControl1:SoundControl;
		
		public function Zgarbi_Class(_stageWidth:Number=1024, _stageHeight:Number=768) 
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(ev:Event):void
		{
			
			removeEventListener(Event.ADDED_TO_STAGE, init)
			addFirstStage();
		}
		
		private function addFirstStage():void
		{
			zgarbi_MC = new Zgarbi_MC();
			addChild(zgarbi_MC);
			zgarbi_MC.x = _stageWidth / 2;
			zgarbi_MC.y = _stageHeight / 2;
			zgarbi_MC.height = _stageHeight / 1.5;
			zgarbi_MC.scaleX = zgarbi_MC.scaleY;
			
			zgarbi = zgarbi_MC.zgarbi;
		    textFrame = zgarbi_MC.textFrame;
			
			zgarbi.alpha = 0;
			textFrame.alpha = 0;
			
			
			firstStageMcAnimation();
		}
		
		private function firstStageMcAnimation():void
		{

			TweenMax.fromTo(zgarbi, 1, {x:zgarbi.x, y:(2 * _stageHeight)}, {x:zgarbi.x, y:zgarbi.y, alpha:1, onComplete:addText});
			
		}
		
		private function addText():void
		{
			soundControl1 = new SoundControl();
			addChild(soundControl1);
			soundControl1.loadSound("49.mp3", 1);
			soundControl1.soundPlay();
			TweenMax.to(textFrame, 0.5, { alpha:1 , onComplete:waitFunc} );
			
		}
		
		private function waitFunc():void
		{
			setTimeout(next, 1500)
		}
		private function next ():void
		{	
			destroy();	
		}
		
		private function destroy():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchi"));
			
			TweenMax.killTweensOf(zgarbi);
			TweenMax.killTweensOf(textFrame);
			
			if (zgarbi_MC)
			{
				removeChild(zgarbi_MC);
				zgarbi_MC = null;
			}
			if (soundControl1)
			{
				removeChild(soundControl1)
				soundControl1 = null;
			}
			
		}
		
	}
	
}
