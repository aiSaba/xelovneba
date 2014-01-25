package profileEngine
{
	
	import DB.Insert;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.*;
	import flash.events.DataEvent;
	import flash.ui.Mouse;
	
	public class SaveNewProfile extends MovieClip
	{
		private var profileObjects:MovieClip;
		private var saveButton:MovieClip;
		private var startButton:MovieClip;
		
		private var insert:Insert;

		private var userArray:Array;
		
		
		
		public static var valueToInsert:String;
		
		public function SaveNewProfile(userArray:Array)
		{
			this.userArray = userArray;
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			
			if (saveButton)
			{
				saveButton.removeEventListener(MouseEvent.MOUSE_DOWN, saveProfile);
				
				saveButton = null;
			}
			if (startButton)
			{
				
				startButton = null;
			}
			if (profileObjects)
			{
				removeChild(profileObjects);
				profileObjects = null;
			}
		}
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addProfileBox();
		}
		private function addProfileBox():void
		{
			profileObjects = new ProfileObjects();
			
			
			profileObjects.x = Main._stage.stageWidth / 2;
			profileObjects.y = Main._stage.stageHeight / 2 + profileObjects.height / 3;
			
			profileObjects.height = Main._stage.stageHeight / 4;
			profileObjects.scaleX = profileObjects.scaleY;
			
			addChild(profileObjects);
			
			saveButton = profileObjects.saveButton;
			saveButton.buttonMode = true;
			saveButton.addEventListener(MouseEvent.MOUSE_DOWN, saveProfile);
		}
		private function saveProfile(event:MouseEvent):void
		{
			valueToInsert =HelperStrings.trim( profileObjects.textBoxFrame.nameTextBox.text);
			Settings.PLAYER = valueToInsert;

			if (valueToInsert.length <= 2)
			{
				profileObjects.checkNameError_mc.visible = true;
				return
			}
			if (userArray)
			{
				for (var i:int = 0; i < userArray.length; i++ )
				{
					
					if (userArray[i].saxeli == valueToInsert)
					{
						profileObjects.checkNameError_mc.visible = true;
						return;
					}
				}
			}
	
			insert = new Insert();
			insert.addEventListener(CustomEvent.DATA, insertListener);
			insert.init(valueToInsert);
		
		////	addStartButton();
		}
		
		private function insertListener(e:CustomEvent):void 
		{
				addStartButton();
			
		}
		private function addStartButton():void
		{
			
			
			removeChild(profileObjects);
			profileObjects = null;
			
			startButton = new StartButton();
		
			startButton.x = Main._stage.stageWidth / 2;
			startButton.y = Main._stage.stageHeight / 2;
			
			startButton.height = Main._stage.stageHeight / 3;
			startButton.scaleX = startButton.scaleY;
		
			addChild(startButton);
			
			startButton.buttonMode = true;
			startButton.addEventListener(MouseEvent.MOUSE_DOWN, startApplication);
			
			
			//////////////////dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "washale"));
		}
		private function startApplication(event:MouseEvent):void
		{
			removeChild(startButton);
			startButton = null;
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "washale"));
			
			
			
		}
	}

}
