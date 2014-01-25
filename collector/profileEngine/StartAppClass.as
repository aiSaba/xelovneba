package profileEngine
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.MouseEvent;
	import flash.events.DataEvent;
	
	
	public class StartAppClass extends MovieClip
	{
		public var applicationStartObjects:MovieClip;
		public static var boyOrGirl:String;
		//profiles
		private var boy:MovieClip;
		private var girl:MovieClip;
		//
		private var saveNewProfile:SaveNewProfile;
		private var userArray:Array;
		
		public function StartAppClass(userArray:Array)
		{
			this.userArray = userArray;
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			
			if (boy)
			{
				boy.removeEventListener(MouseEvent.MOUSE_DOWN, boyIsChosen);
				
				boy = null;
			}
			if (girl)
			{
				girl.removeEventListener(MouseEvent.MOUSE_DOWN, girlIsChosen);
				
				girl = null;
			}
			if (applicationStartObjects)
			{
				removeChild(applicationStartObjects);
				applicationStartObjects = null;
			}
			
			TweenMax.killTweensOf(boy);
			TweenMax.killTweensOf(girl);
		
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			startApp();
			
		
		}
		
		private function startApp():void
		{
			applicationStartObjects = new ApplicationStartObjects();
			
			applicationStartObjects.x = Main._stage.stageWidth / 2;
			applicationStartObjects.y = applicationStartObjects.width / 3;
			
			applicationStartObjects.height = Main._stage.stageHeight / 4;
			applicationStartObjects.scaleX = applicationStartObjects.scaleY;
			
			addChild(applicationStartObjects);
			
			boy = applicationStartObjects.boy;
			girl = applicationStartObjects.girl;
			
			boy.buttonMode = true;
			girl.buttonMode = true;
			
			boy.addEventListener(MouseEvent.MOUSE_DOWN, boyIsChosen);
			girl.addEventListener(MouseEvent.MOUSE_DOWN, girlIsChosen);
		}
		
		private function girlIsChosen(event:MouseEvent):void
		{
			girl.mouseEnabled = false;
			TweenMax.to(boy, 0.4, {alpha: 0, ease: Elastic.easeInOut});
			TweenMax.to(girl, 0.7, {glowFilter: {color: 0x91e600, alpha: 1, blurX: 100, blurY: 100}});
			TweenMax.to(girl, 0.7, {x: (girl.x - girl.width / 1.3), y: (girl.y + girl.width / 4), motionBlur: true, ease: Cubic.easeInOut, onComplete: addSaveNewProfileClass});
			
			boyOrGirl = "girl";
		}
		
		private function boyIsChosen(event:MouseEvent):void
		{
			boy.mouseEnabled = false;
			TweenMax.to(girl, 0.4, {alpha: 0, ease: Elastic.easeInOut});
			TweenMax.to(boy, 0.7, {glowFilter: {color: 0x91e600, alpha: 1, blurX: 100, blurY: 100}});
			TweenMax.to(boy, 0.7, {x: (boy.x + boy.width / 1.6), y: (boy.y + boy.width / 4), motionBlur: true, ease: Cubic.easeInOut, onComplete: addSaveNewProfileClass});
			
			boyOrGirl = "boy";
		}
		
		private function addSaveNewProfileClass():void
		{
			saveNewProfile = new SaveNewProfile(userArray);
			saveNewProfile.addEventListener(DataEvent.DATA, saveNewProfileListener);
			
			addChild(saveNewProfile);
		
		}
				
		private function saveNewProfileListener(e:DataEvent):void
		{
			saveNewProfile.removeEventListener(DataEvent.DATA, saveNewProfileListener);
			saveNewProfile = null;
			
			removeChild(applicationStartObjects);
			applicationStartObjects = null;
			
			dispatchEvent(new CustomEvent(CustomEvent.DATA, "start game"));
			
			
		}
	
	}

}
