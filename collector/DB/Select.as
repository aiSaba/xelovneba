package DB 
{
	import flash.data.SQLConnection;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File; 
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import CustomEvent;
	
	public class Select  extends EventDispatcher
	{
		
		private var folder:File;
		private var dbFile:File;
		private var conn:SQLConnection;
		private var selectData:SQLStatement 
		
		
		public function Select()
		{
			
		}
	
		public function letsWork():void
		{
			
			folder = File.applicationDirectory;
			dbFile = folder.resolvePath(Settings.DB_NAME);
			if (dbFile.exists)
			{
				
				conn = new SQLConnection();	
				conn.addEventListener(SQLEvent.OPEN, openHandler);
				conn.addEventListener(SQLErrorEvent.ERROR, errorHandler);

				////folder = File.applicationDirectory;
				////dbFile = folder.resolvePath("newProfileDataBase1.db");
		
				conn.openAsync(dbFile);		
			}
			else
			{
				dispatchEvent(new CustomEvent(CustomEvent.DATA, {type:"database don't exists"}));
			}
			
			
		}
		
		
		
		function openHandler(event:SQLEvent):void
		{
			selectData = new SQLStatement();
			selectData.sqlConnection = conn;
			
			selectData.text = "SELECT * FROM profileTable";
			selectData.addEventListener(SQLEvent.RESULT, resultHandler);
			selectData.addEventListener(SQLErrorEvent.ERROR, errorHandler);
			selectData.execute();
		}	
		
		private function resultHandler(e:Event):void 
		{
			
		
			var result:SQLResult = selectData.getResult();
			var usersArray:Array = result.data as Array;
			
			
			dispatchEvent(new CustomEvent(CustomEvent.DATA, usersArray));
			
		}
		
		function errorHandler(event:SQLErrorEvent):void
		{
			trace("Error message:", event.error.message);
			trace("Details:", event.error.details);
		}
		
		
		
	}

}