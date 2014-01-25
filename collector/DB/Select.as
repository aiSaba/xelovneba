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
		
	
		private var conn:SQLConnection;
		private var selectStmt:SQLStatement;
		
		
		public function Select()
		{
			
		}
		
		private function destroy():void
		{
			
			if (selectStmt)
			{
				selectStmt.removeEventListener(SQLEvent.RESULT, resultHandler);
				selectStmt.removeEventListener(SQLErrorEvent.ERROR, errorHandler);
				selectStmt = null;
			}
			
			if (conn)
			{
				conn.removeEventListener(SQLEvent.OPEN, openHandler);
				conn.removeEventListener(SQLErrorEvent.ERROR, errorHandler);
				conn.close();
				conn = null;
				
			}
			
			
			
		}
	
		public function letsWork():void
		{
			
			var folder:File = File.applicationDirectory;
			var dbFile:File = folder.resolvePath(Settings.DB_NAME);
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
				destroy();
				dispatchEvent(new CustomEvent(CustomEvent.DATA, {type:"database don't exists"}));
			}
			
			
		}
		
		
		
		private function openHandler(event:SQLEvent):void
		{
			selectStmt = new SQLStatement();
			selectStmt.sqlConnection = conn;
			
			selectStmt.text = "SELECT * FROM profileTable";
			selectStmt.addEventListener(SQLEvent.RESULT, resultHandler);
			selectStmt.addEventListener(SQLErrorEvent.ERROR, errorHandler);
			selectStmt.execute();
		}	
		
		private function resultHandler(e:Event):void 
		{
			
		
			var result:SQLResult = selectStmt.getResult();
			var usersArray:Array = result.data as Array;
			
			destroy();
			dispatchEvent(new CustomEvent(CustomEvent.DATA, usersArray));
			
		}
		
		private function errorHandler(event:SQLErrorEvent):void
		{
			trace("Error message:", event.error.message);
			trace("Details:", event.error.details);
		}
		
		
		
	}

}