package profileEngine 
{
	
	import DB.Create;
	import DB.Select;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import fl.controls.List;
	import flash.data.SQLConnection;
	import flash.text.TextFormat;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import flash.utils.setTimeout;
	import flash.utils.Timer;
	
	public class ChooseProfile extends MovieClip
	{
		private var createNewProfile:MovieClip;
		private var selectData:SQLStatement = new SQLStatement();
		private var result:SQLResult;
		private var myTextFormat:TextFormat;
		private var myList:List;
		//classes
		private var startAppClass:StartAppClass;
		private var usersArray:Array;
		private var startTimer:Timer;
		private var createDatabase:Create;
		private var selectDatabase:Select;
		
		
		public function ChooseProfile()
		{
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
			
			addExitingProfiles();
		}
		
		private function addExitingProfiles():void
		{
			
			loadDataFromDataBase()
			

		
		}
		
		private function letsDo(e:TimerEvent):void 
		{
			startTimer.stop();
			startTimer.removeEventListener(TimerEvent.TIMER, letsDo);
			startTimer = null;
			
				createNewProfile.x = Main._stage.stageWidth / 2;
				createNewProfile.y = Main._stage.stageHeight / 2;
				addChild(createNewProfile);
				
				
					
				createNewProfile.buttonMode = true;
				
				createTextFormat();
			
				createNewProfile.newProfileButton.addEventListener(MouseEvent.MOUSE_DOWN, createNewProfileHandler);
				listRender();
		}
		
		private function createNewProfileHandler(e:MouseEvent):void 
		{
			createNewProfile.newProfileButton.removeEventListener(MouseEvent.MOUSE_DOWN, createNewProfileHandler);
			dispatchEvent(new CustomEvent(CustomEvent.DATA, { type:"create new profile" } ));
		}
		
		private function loadDataFromDataBase():void
		{
			selectDatabase = new Select();
			selectDatabase.addEventListener(CustomEvent.DATA, selectDatabaseListener);
			selectDatabase.letsWork();
			
			
			
			////return
			
			//selectData.sqlConnection = CreateDataBaseClass.conn;
			//
			//selectData.text = "SELECT * FROM profileTable";
			//selectData.addEventListener(SQLEvent.RESULT, resultHandler);
			//selectData.addEventListener(SQLErrorEvent.ERROR, errorHandler);
			//selectData.execute();
			
			
			
			
		
		}
		
		private function selectDatabaseListener(e:CustomEvent):void 
		{
			if (e.data.type == "database don't exists")
			{
				
				selectDatabase.removeEventListener(CustomEvent.DATA, selectDatabaseListener);
				selectDatabase = null;
				
				createDatabase = new Create();
				createDatabase.addEventListener(CustomEvent.DATA, createDatabaseListener);
			}
			else
			{
				usersArray = e.data as Array;
				
				createNewProfile = new CreateNewProfile();
			
			startTimer = new Timer(300, 1);
			startTimer.addEventListener(TimerEvent.TIMER, letsDo);
			startTimer.start();
				
				
				
			}
			
			
		}
		
		private function createDatabaseListener(e:CustomEvent):void 
		{
			createDatabase.removeEventListener(CustomEvent.DATA, createDatabaseListener);
			createDatabase = null;
		
			
			dispatchEvent(new CustomEvent(CustomEvent.DATA, { type:"create new profile" } ));
			
		
		}
		
		private function createTextFormat():void
		{
			myTextFormat = new TextFormat();
			myTextFormat.size = 20;
			myTextFormat.color = 0x455A60;
		}
		
		private function listRender():void
		{
			myList = createNewProfile.profilesList
			myList.setRendererStyle("textFormat", myTextFormat);
			
			
			try
			{
				if (usersArray)
				{
					for (var i:int = 0; i < usersArray.length; i++)
					{
						if (! usersArray[i].qula)
						{
							myList.addItem( { label: [i + 1] + "." + "    " + usersArray[i].saxeli + "   " + "0" + " ქულა" } )
						}
						else
						{
							myList.addItem( { label: [i + 1] + "." + "    " + usersArray[i].saxeli + "   " + usersArray[i].qula + " ქულა" } )
						}
						
					}
					
				}
				else
				{
					trace("no result")
				}
			}
			catch (e:Error)
			{
				trace("error");
			}
		
			myList.addEventListener(Event.CHANGE, chooseProfileFunc);
			
		}
		private function chooseProfileFunc(event:Event):void
		{
			
			Settings.SCORE = parseInt(usersArray[event.target.selectedIndex].qula);
			Settings.PLAYER = usersArray[event.target.selectedIndex].saxeli;
			Settings.POSITION =  parseInt(usersArray[event.target.selectedIndex].boloPozicia);
			
				dispatchEvent(new CustomEvent(CustomEvent.DATA, { type:"start game" } ));
			
			///
			/////trace (usersArray[event.target.selectedIndex].boloPozicia)
			//trace(usersArray[event])
			/////return
			
		}
		
	
	}

}
