package
{
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flash.net.URLRequest;
	
	public class Buttons extends Sprite
	{
		
		private var button:MovieClip;
		private var buttonLoader:Loader;
		private var buttonLoaderURLRequest:URLRequest;
		
		public function Buttons()
		{
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		
		}
		
		private function init(event:Event):void

		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addButtons();
		}
		
		private function addButtons():void
		{
			buttonLoader = new Loader();
			buttonLoaderURLRequest = new URLRequest("ButtonsSwf.swf");
			buttonLoader.load(buttonLoaderURLRequest);
				
			buttonLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, buttonLoaderComplete);
			buttonLoader.contentLoaderInfo.addEventListener(ErrorEvent.ERROR, buttonLoaderLoadError);
			
		
		}
		
		private function buttonLoaderLoadError(e:ErrorEvent):void 
		{
			trace (e.errorID, "შემოტანის შეცდომა");
		}
		
		private function buttonLoaderComplete(e:Event):void 
		{
			
			button = buttonLoader.content as MovieClip;
			
			buttonLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, buttonLoaderComplete);
	
			addChild(button)
			
			buttonListeners();
			
		}
		
		private function buttonListeners():void
		{
			
			button.soundOff.visible = false;
			button.reset.addEventListener(MouseEvent.MOUSE_DOWN, resetListener);
			button.sound.addEventListener(MouseEvent.MOUSE_DOWN, soundListener);
			button.pause.addEventListener(MouseEvent.MOUSE_DOWN, pauseListener);
			button.home.addEventListener(MouseEvent.MOUSE_DOWN, homeListener);
			button.all.addEventListener(MouseEvent.MOUSE_DOWN, allListener);
			button.exit.addEventListener(MouseEvent.MOUSE_DOWN, exitListener);
			button.soundOff.addEventListener(MouseEvent.MOUSE_DOWN, soundOffListener);
			button.next.addEventListener(MouseEvent.MOUSE_DOWN, nextStage);
			button.back.addEventListener(MouseEvent.MOUSE_DOWN, previousStage);
			trace(button.soundOff);
		}
		
		private function previousStage(e:MouseEvent):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "previousStage"));
		}
		
		private function nextStage(e:MouseEvent):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "nextStage"));
		}
		
		private function allListener(e:MouseEvent):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "all"));
		}
		
		private function exitListener(ev:MouseEvent):void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "exit"));
		}
		
		private function resetListener(ev:MouseEvent):void
		{
			
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "reset"));
		
		}
		
		private function soundListener(ev:MouseEvent):void
		{
			button.soundOff.visible = true;
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "sound"));
			
		
		}
		
		private function pauseListener(ev:MouseEvent):void
		{
			
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "pause"));
		
		}
		
		private function homeListener(ev:MouseEvent):void
		{
			
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "home"));

		}
		
		private function soundOffListener(ev:MouseEvent):void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "sound"));
			button.soundOff.visible = false;
			button.sound.visible = true;
		}
		
		private function destroy(event:Event):void
		{
		
			if (buttonLoader)
			{
				buttonLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, buttonLoaderComplete);
				buttonLoader.contentLoaderInfo.removeEventListener(ErrorEvent.ERROR, buttonLoaderLoadError);
				
				buttonLoaderURLRequest = null;
				buttonLoader= null;
				
			}
			
			if (button)
			{
				button.reset.removeEventListener(MouseEvent.MOUSE_DOWN, resetListener);
				button.sound.removeEventListener(MouseEvent.MOUSE_DOWN, soundListener);
				button.pause.removeEventListener(MouseEvent.MOUSE_DOWN, pauseListener);
				button.home.removeEventListener(MouseEvent.MOUSE_DOWN, homeListener);
				
				removeChild(button);
				button = null;
			}
		}
	
	}

}
