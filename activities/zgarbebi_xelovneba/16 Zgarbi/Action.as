package  {
	import fl.motion.Animator;
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import flash.events.DataEvent;
	
	
	public class Action extends MovieClip {
		
		private var thirdStageMc:MovieClip;
		private var zgarbi:MovieClip;
		private var textFrame:MovieClip;
		private var textFrame_2:MovieClip;
		private var textFrame_3:MovieClip;
		private var textFrame_4:MovieClip;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var soundControl1:SoundControl;
		private var frame:MovieClip;
		
		public function Action() 
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
			textFrame_2 = firstZgarbi.textFrame_2;
			textFrame_3 = firstZgarbi.textFrame_3;
			textFrame_4 = firstZgarbi.textFrame_4;
			frame = firstZgarbi.frame;
			
			zgarbi.alpha = 0;
			textFrame.alpha = 0;
			textFrame_2.alpha = 0;
			textFrame_3.alpha = 0;
			textFrame_4.alpha = 0;
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
			soundControl1.loadSound("16.mp3", 1);
			soundControl1.soundPlay();
			TweenMax.to(frame, 0.5, { alpha:1 } );
			TweenMax.to(textFrame, 0.5, { alpha:1 , onComplete:waitFunc } );
			
			setTimeout(becomeInvisible, 6000, textFrame);
			
			setTimeout(becomeVisible, 6001, textFrame_2);
			setTimeout(becomeInvisible, 12000, textFrame_2);
			
			setTimeout(becomeVisible, 12001, textFrame_3);
			setTimeout(becomeInvisible, 21000, textFrame_3);
			
			setTimeout(becomeVisible, 21001, textFrame_4);
			
			
			
			
			
		}
		
		private function becomeInvisible(object):void
		{
			object.alpha = 0;
		}
		private function becomeVisible(object):void
		{
			object.alpha = 1;
		}
		
		private function waitFunc():void
		{			
			setTimeout(next, 24500)
		}
		private function next ():void
		{	
			zgarbi.gotoAndStop(1);
			destroy();	
			
			
		}
		
		private function destroy():void
		{
			
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame"));
			firstZgarbi.visible = false;
			TweenMax.killTweensOf(zgarbi);
			TweenMax.killTweensOf(textFrame);
			TweenMax.killTweensOf(textFrame_2);
			TweenMax.killTweensOf(textFrame_3);
			TweenMax.killTweensOf(textFrame_4);
			
			if (soundControl1)
			{
				removeChild(soundControl1)
				soundControl1 = null;
			}
			
		}
		
	}
	
}
