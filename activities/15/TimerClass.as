package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.*;
	import com.greensock.easing.*
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	
	
	public class TimerClass extends MovieClip 
	{
		
		private var timer_mc:MovieClip;
		private var arrow:MovieClip;
		
		private var durationSecond:int = 60;
		private var tween:TweenMax ;
		
		
		public function TimerClass() 
		{
			addEventListener(Event.ADDED_TO_STAGE, initHendler);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (timer_mc)
			{
				TweenMax.killTweensOf(arrow);
				tween.kill();
				tween = null;
				removeChild(timer_mc);
				timer_mc = null;
			}
		}
		
		private function initHendler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, initHendler);
			initTimer();			
		}
		private function initTimer():void
		{			
			
			timer_mc = new TimerMc() as MovieClip;
			addChild(timer_mc);
			
			arrow = timer_mc.timerArrow;
			
			
		   tween= TweenMax.to(arrow, durationSecond , { rotation:360,onUpdate:tweenUpdate,repeat:999 } );

		}
		
		private function tweenUpdate():void 
		{
			if (arrow.rotation > -5 && arrow.rotation < 0)
			{
				durationSecond += 60;
				//tween.duration = durationSecond;
			}
		}
		public function returnQula():int
		{
			stopTimer();
			if (arrow.rotation >= 0 && arrow.rotation <= 92)
			{
				return 9;
			}
			
			if (arrow.rotation > 92 && arrow.rotation <= 182)
			{
				return 6;
			}
			
			if (arrow.rotation > -182 && arrow.rotation <= -88)
			{
				return 3;
			}
			
			if (arrow.rotation > -88 && arrow.rotation <= -3 )
			{
				return 1;
			}
			

			return 0;
		}
		
		public function resumeTimer():void
		{
			tween.play();
		}
		public function stopTimer():void 
		{
			TweenMax.killTweensOf(arrow);
		}
		public function pauseTimer():void
		{
			tween.pause();
		}
	
	}
	
}
