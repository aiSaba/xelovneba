package
{
	
	import DB.Update;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.desktop.NativeApplication;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.media.SoundMixer;
	import flash.media.SoundTransform;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class Controller extends MovieClip
	{
		private var swlLoader:Loader;
		private var swlLoaderURLRequest:URLRequest;
		private var loadedContent:MovieClip;
		
		private var button:Buttons;
		
		//stage h and w
		private var stageH:Number;
		private var stageW:Number;
		////
		private var swfArray:Array;
		private var swfIndex:int;
		private var loader:Loader;
		private var update:Update;
		private var main:Main;
		private var soundOn:Boolean;
		
		private var allScore:int;
		
		private var pauseMc:MovieClip;
		
		public function Controller(stageW:Number = 1024, stageH:Number = 768)
		{
			this.stageH = stageH;
			this.stageW = stageW;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function init(event:Event):void
		{
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initArray();
		}
		
		private function initArray():void
		{
			button = new Buttons();
			addChild(button);
			button.addEventListener(DataEvent.DATA, buttonsListener);
			button.visible = false;
			soundOn = true;
			
			swfArray = [ "firstZgarbi.swf","stage_1.swf", "secondZgarbi.swf", "stage_2.swf","thirdZgarbi.swf", "stage_3.swf", "fourthZgarbi.swf","stage_4.swf" ,
				 "fifthZgarbi.swf", "stage_5.swf","sixthZgarbi.swf", "stage_6.swf","seventhZgarbi.swf","stage_7.swf", "Stage_End.swf"];
			
			swfIndex = Settings.POSITION;
			allScore = Settings.SCORE;
			loadSwf();
		}
		
		private function loadSwf():void
		{
			
			loader = new Loader();
			
			var context:LoaderContext = new LoaderContext();
			var current:ApplicationDomain = ApplicationDomain.currentDomain;
			context.applicationDomain = new ApplicationDomain();
			context.allowLoadBytesCodeExecution = true;
			
			var request:URLRequest = new URLRequest("swfs/" + swfArray[swfIndex]);
			
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler);
			loader.load(request, context);
		}
		
		private function errorHandler(e:Event):void
		{
			trace("Loading Error");
		}
		
		private function onCompleteHandler(e:Event):void
		{
			loadedContent = e.currentTarget.content as MovieClip;
			loadedContent.addEventListener(Event.ADDED_TO_STAGE, loadedContentListener);
			loadedContent.addEventListener(DataEvent.DATA, sceneEndController);
			addChild(loadedContent);
		
		}
		
		private function sceneEndController(e:DataEvent):void
		{
			
			if (e.data.indexOf("endOfGame") > -1)
			{
				if (swfIndex == swfArray.length - 1)
				{
					return;
				}
				swfIndex += 1;
				loader.unloadAndStop();
				
				loadSwf();
				trace("endOfGameTrace")
				
				var qula:String = e.data.split("|")[1];
				allScore += parseInt(qula);
				
				update = new Update();
				update.addEventListener(CustomEvent.DATA, updateListener);
				update.letsDo(allScore, (swfIndex - 1));
				
			}
			if (e.data == "The End")
			{
				var myTextFormat:TextFormat = new TextFormat();
				myTextFormat.size = 50;
				myTextFormat.color = 0xFFFFFF;
				
				var myText:TextField = new TextField();
				
				myText.defaultTextFormat = myTextFormat;
				myText.x = stageW / 2;
				myText.y = stageH / 2 + stageH / 4;
				
				myText.text = "შენ დააგროვე " + allScore.toString() + " ქულა  ";
				addChild(myText);
				
				myText.autoSize = TextFieldAutoSize.CENTER;
			}
			
			if (e.data == "ButtonVisibleTrue")
			{
				button.visible = true;
			}
			if (e.data == "ButtonVisibleFalse")
			{
				button.visible = false;
			}
		
		}
		
		private function buttonsListener(e:DataEvent):void
		{
			if (e.data == "reset")
			{
				removeChild(loadedContent);
				loader.unloadAndStop();
				
				button.visible = false;
				swfIndex -= 1;
				loadSwf();
				
					//button.removeEventListener(DataEvent.DATA, buttonsListener);
				
			}
			
			if (e.data == "sound")
			{
				if (soundOn)
				{
					soundOn = false;
					SoundMixer.soundTransform = new SoundTransform(0);
				}
				else
				{
					soundOn = true;
					SoundMixer.soundTransform = new SoundTransform(1);
				}
					//button.removeEventListener(DataEvent.DATA, buttonsListener);
			}
			
			if (e.data == "pause")
			{
				if (swfIndex == 3)
				{
					loadedContent.TimerStop();
				}
				pauseMc = new PauseMc();
				addChild(pauseMc);
				pauseMc.x = stageW / 2;
				pauseMc.y = stageH / 2;
				pauseMc.resume.addEventListener(MouseEvent.MOUSE_DOWN, resumeFunc);
					//button.removeEventListener(DataEvent.DATA, buttonsListener);
			}
			
			if (e.data == "home")
			{
				button.removeEventListener(DataEvent.DATA, buttonsListener);
				removeChildren(0);
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "HomeClick"));
			}
			
			if (e.data == "exit")
			{
				NativeApplication.nativeApplication.exit();
				button.removeEventListener(DataEvent.DATA, buttonsListener);
				
			}
		
		} ///end buttonListernr
		
		private function resumeFunc(ev:MouseEvent):void
		{
			if (swfIndex == 3)
			{
				loadedContent.TimerResume();
			}
			
			removeChild(pauseMc);
			pauseMc = null;
		}
		
		private function updateListener(e:CustomEvent):void
		{
			update.removeEventListener(CustomEvent.DATA, updateListener);
		}
		
		private function loadedContentListener(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, loadedContentListener);
			
			trace("ახლა კი ნაღდად ჩაიტვირთა SWF")
		
		}
	}

}
