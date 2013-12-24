package
{
	
	import flash.desktop.NativeApplication;
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.InvokeEvent;
	import flash.events.KeyboardEvent;
	import flash.media.SoundChannel;
	import flash.system.Capabilities;
	import profileEngine.StartAppClass;
	import flash.events.DataEvent;
	
	
	import profileEngine.ChooseProfile;
	
	public class Main extends MovieClip
	{
		
		private var chooseProfile:ChooseProfile;
		
		
		public static var _stage:*;
		
		
		private var pauseMc:MovieClip;
		private var musicChannel:SoundChannel;
		private var soundOn:Boolean;
		private var startAppCass:StartAppClass;
		private var controllerClass:Controller;
		public static var currentSce:Object;
		

		
		//private var soundOnOff:MovieClip;
		
		public function Main()
		{
			
			NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE, onInvoke);
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		
		private function onInvoke(event:InvokeEvent):void
		{
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			if (Capabilities.os.toLocaleLowerCase().indexOf("win") != -1)
			{
				
				Settings.SYSTEM_OS = "win";
				
				stage.addEventListener(FocusEvent.FOCUS_OUT, setTxtFocus);
				stage.addEventListener(KeyboardEvent.KEY_DOWN, escOverride);
				
				toggleFullScreen();
			}
			else
			{
				
				Settings.SYSTEM_OS = "android";
			}
		
		}
		
		private function setTxtFocus(e:FocusEvent):void
		{
			stage.focus = stage;
		}
		
		private function escOverride(e:KeyboardEvent):void
		{
			if (e.keyCode == 27)
			{
				e.preventDefault();
			}
		}
		
		private function toggleFullScreen():void
		{
			stage.displayState = (stage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE) ? StageDisplayState.NORMAL : StageDisplayState.FULL_SCREEN_INTERACTIVE;
		}
		
		private function init(event:Event):void
		{
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_stage = stage;
			startApp(false);
		}
		
		public function startApp(restart:Boolean = true):void
		{
			
			
			
			if (!restart)
			{
				chooseProfile = new ChooseProfile();
				chooseProfile.addEventListener(CustomEvent.DATA, chooseProfileListener);
				addChild(chooseProfile);
			}
			
			
			
		}
		
		private function chooseProfileListener(e:CustomEvent):void 
		{
			
			
			if (e.data.type == "create new profile")
			{
				
				startAppCass = new StartAppClass([]);
				startAppCass.addEventListener(CustomEvent.DATA, startAppCassListener);

				addChild(startAppCass);
				
			}
			else
			{
				callControllerClass();
			}
			
			chooseProfile.removeEventListener(CustomEvent.DATA, chooseProfileListener);
			removeChild(chooseProfile);
			chooseProfile = null;
			
			
		}
		
		private function startAppCassListener(e:CustomEvent):void 
		{
			startAppCass.removeEventListener(CustomEvent.DATA, startAppCassListener);
			removeChild(startAppCass);
			startAppCass = null;

			Settings.POSITION = 0;
			callControllerClass();
		}
		
		private function callControllerClass():void
		{
			
			controllerClass = new Controller(_stage.stageWidth, _stage.stageHeight);
			addChild(controllerClass);
			controllerClass.addEventListener(DataEvent.DATA, controllerClass_data);
		}
		
		private function controllerClass_data(e:DataEvent):void 
		{
			if (e.data == "HomeClick")
			{
				startApp(false);
			}
		}
		
		
		
		
		
	
	}

}