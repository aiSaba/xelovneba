package  {
	import fl.motion.Animator;
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import flash.events.DataEvent;
	
	
	public class SeventhZgarbi extends MovieClip {
		
		private var thirdStageMc:MovieClip;
		private var zgarbi:MovieClip;
		private var textFrame:MovieClip;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var soundControl1:SoundControl;
		private var frame:MovieClip;
		
		public function SeventhZgarbi() 
		{
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(ev:Event):void
		{
			
			removeEventListener(Event.ADDED_TO_STAGE, init)
			addFirstStage();
		}
		
		private function addFirstStage():void
		{
			_stageWidth = stage.stageWidth;
			_stageHeight = stage.stageHeight;
			firstZgarbi.x = _stageWidth / 2;
			firstZgarbi.y = _stageHeight / 2;
			firstZgarbi.height = _stageHeight / 1.5;
			firstZgarbi.scaleX = firstZgarbi.scaleY;
			
			zgarbi = firstZgarbi.zgarbi;
		    textFrame = firstZgarbi.textFrame;
			frame = firstZgarbi.frame;
			
			zgarbi.alpha = 0;
			textFrame.alpha = 0;
			frame.alpha = 0;
			
			
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
			soundControl1.loadSound("11.mp3", 1);
			soundControl1.soundPlay();
			TweenMax.to(frame, 0.5, { alpha:1 } );
			TweenMax.to(textFrame, 0.5, { alpha:1 , onComplete:waitFunc} );
			
		}
		
		private function waitFunc():void
		{
			setTimeout(next, 5000)
		}
		private function next ():void
		{	
			destroy();	
		}
		
		private function destroy():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame"));
			firstZgarbi.visible = false;
			TweenMax.killTweensOf(zgarbi);
			TweenMax.killTweensOf(textFrame);
			
			if (soundControl1)
			{
				removeChild(soundControl1)
				soundControl1 = null;
			}
			
		}
		
	}
	
}
