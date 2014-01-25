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
		private var allSheet:MovieClip;
		private var lastPage:MovieClip;
		
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
			
			swfArray = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
			
			swfIndex = Settings.POSITION + 1;
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
			
			var request:URLRequest = new URLRequest("swfs/" + swfArray[swfIndex].toString() + ".swf");
			
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
				
				if (loadedContent)
				{
					removeChild(loadedContent);
				}
				
				loader.unloadAndStop();
				
				var qula:String = e.data.split("|")[1];
				if (qula)
				{
					allScore += parseInt(qula);
				}
				else
				{
					//
				}
				
				update = new Update();
				update.addEventListener(CustomEvent.DATA, updateListener);
				
				update.letsDo(allScore, (swfIndex));
				swfIndex++;
				loadSwf();
				
			}
			if (e.data == "The End")
			{
				
				loader.unloadAndStop();
				
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
				loadSwf();
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
				removeChild(button);
				removeChild(loadedContent);
				loader.unloadAndStop();
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "HomeClick"));
			}
			
			if (e.data == "nextStage")
			{
				if (swfIndex == swfArray.length - 1)
				{
					return;
				}
				
				if (loadedContent)
				{
					removeChild(loadedContent);
				}
				
				loader.unloadAndStop();
				update = new Update();
				update.addEventListener(CustomEvent.DATA, updateListener);
				
				update.letsDo(allScore, (swfIndex));
				swfIndex++;
				loadSwf();
			}
			
			if (e.data == "previousStage")
			{
				if (swfIndex == 0)
				{
					return;
				}
				
				if (loadedContent)
				{
					removeChild(loadedContent);
				}
				
				loader.unloadAndStop();
				update = new Update();
				update.addEventListener(CustomEvent.DATA, updateListener);
				
				update.letsDo(allScore, (swfIndex));
				swfIndex--;
				loadSwf();
			}
			
			
			if (e.data == "exit")
			{
				NativeApplication.nativeApplication.exit();
				button.removeEventListener(DataEvent.DATA, buttonsListener);
				
			}
			if (e.data == "all")
			{
				showAllLevels();
			}
		
		} ///end buttonListernr
		
		private function showAllLevels():void
		{
			removeChild(loadedContent);
			allSheet = new AllSheet() as MovieClip
			allSheet.height = stageH / 1.2;
			allSheet.scaleX = allSheet.scaleY;
			
			button.visible = false;
			
			allSheet.x = stageW / 2;
			allSheet.y = stageH / 2;
			/*allSheet.x = (stageW - allSheet.width) / 2;
			 allSheet.y = (stageH - allSheet.height) / 2;*/
			
			addChild(allSheet);
			
			//allSheet.close_mc.addEventListener(MouseEvent.MOUSE_DOWN, closeSheet);
			
			var item:MovieClip;
			for (var i:int = 1; i <= 35; i++)
			{
				item = allSheet.getChildByName("mc_" + i.toString()) as MovieClip;
				//item.num_txt.text = i.toString();
				item.addEventListener(MouseEvent.MOUSE_DOWN, gameLevelAction, false, 0, true);
			}
			trace(allSheet.home_button)
			trace(allSheet.exit_button)
			allSheet.home_button.addEventListener(MouseEvent.MOUSE_DOWN, homeFunc);
			allSheet.exit_button.addEventListener(MouseEvent.MOUSE_DOWN, exitFunc)
			allSheet.authors.addEventListener(MouseEvent.MOUSE_DOWN, authorsFunc)
		}
		
		private function authorsFunc(e:MouseEvent):void 
		{
			removeChild(allSheet);
			lastPage = new LastPage();
			lastPage.x = stageW / 2;
			lastPage.y = stageH / 2;
			addChild(lastPage);
			lastPage.closeLast.addEventListener(MouseEvent.MOUSE_DOWN, closeLastPage);
		}
		
		private function closeLastPage(e:MouseEvent):void 
		{
			removeChild(lastPage);
			addChild(allSheet);
		}
		
		private function exitFunc(e:MouseEvent):void
		{
			NativeApplication.nativeApplication.exit();
			button.removeEventListener(DataEvent.DATA, buttonsListener);
		}
		
		private function homeFunc(e:MouseEvent):void
		{
			button.removeEventListener(DataEvent.DATA, buttonsListener);
			removeChild(button);
			removeChild(allSheet);
			loader.unloadAndStop();
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "HomeClick"));
		}
		
		private function closeSheet(e:MouseEvent):void
		{
			button.visible = true;
			var item:MovieClip;
			for (var i:int = 1; i <= 16; i++)
			{
				item = allSheet.getChildByName("mc_" + i.toString()) as MovieClip;
				item.num_txt.text = i.toString();
				item.removeEventListener(MouseEvent.MOUSE_DOWN, gameLevelAction);
			}
			allSheet.close_mc.removeEventListener(MouseEvent.MOUSE_DOWN, closeSheet);
			removeChild(allSheet);
			allSheet = null;
		}
		
		private function gameLevelAction(e:MouseEvent):void
		{
			button.visible = true;
			var item:MovieClip;
			for (var i:int = 1; i <= 16; i++)
			{
				item = allSheet.getChildByName("mc_" + i.toString()) as MovieClip;
				//item.num_txt.text = i.toString();
				item.removeEventListener(MouseEvent.MOUSE_DOWN, gameLevelAction);
			}
			
			removeChild(allSheet);
			allSheet = null;
			swfIndex = Number(e.currentTarget.name.substr(3));
			button.visible = false;
			
			try
			{
				removeChild(loadedContent);
				loader.unloadAndStop();
				loadSwf();
			}
			catch (e:Error)
			{
				trace("Error", e)
			}
		}
		
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
		}
	}

}
