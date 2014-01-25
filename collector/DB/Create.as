package DB 
{
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.events.EventDispatcher;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File; 
	import CustomEvent;
	
	public class Create  extends EventDispatcher
	{
		
	
		private var conn:SQLConnection;
	//	private var createTables:CreateTables;
		private var createStmt:SQLStatement;
		
		
		public function Create()
		{
			init();
		}
	
		private function init():void
		{
			
			var folder:File= File.applicationDirectory;
			var dbFile:File= folder.resolvePath(Settings.DB_NAME);
			
			conn = new SQLConnection();	
			conn.addEventListener(SQLEvent.OPEN, openHandler);
			conn.addEventListener(SQLErrorEvent.ERROR, errorHandler);
			conn.openAsync(dbFile);		
		}
		
		private function openHandler(event:SQLEvent):void
		{
			createNewTable();
		}	
		
		private function destroy():void
		{
			if (createStmt)
			{
				createStmt.removeEventListener(SQLEvent.RESULT, createResult); 
				createStmt.removeEventListener(SQLErrorEvent.ERROR, createError);
				createStmt = null;
			}
			
			if (conn)
			{
				conn.removeEventListener(SQLEvent.OPEN, openHandler);
				conn.removeEventListener(SQLErrorEvent.ERROR, errorHandler);
				conn.close();
				conn = null;
			}
			
			
		}
		
		private function errorHandler(event:SQLErrorEvent):void
		{
			trace("Error message:", event.error.message);
			trace("Details:", event.error.details);
		}
		
		private function createNewTable():void  //event:SQLEvent
		{
			createStmt = new SQLStatement();
			createStmt.sqlConnection = conn;

						//var sql:String =
	        //"DELETE FROM profileTable; " 
	//
            //createStatement.text = sql;
			//CreateDataBaseClass.conn.addEventListener(SQLUpdateEvent.DELETE, createNewTable);
	        //createStatement.execute()
			
			
			var sql:String = "CREATE TABLE IF NOT EXISTS profileTable(" + 
			"userID INTEGER PRIMARY KEY AUTOINCREMENT," +
			"saxeli TEXT," +
			"boloPozicia INTEGER," +
			"qula INTEGER"+
			")";
		

			createStmt.text = sql;
			
			createStmt.addEventListener(SQLEvent.RESULT, createResult); 
			createStmt.addEventListener(SQLErrorEvent.ERROR, createError);
			
			createStmt.execute(); 
			
		}
		
		private  function createResult(event:SQLEvent):void 
		{ 
			destroy();
			dispatchEvent(new CustomEvent(CustomEvent.DATA, "Table created"));
			trace("Table created"); 
		} 
		
		private function createError(event:SQLErrorEvent):void 
		{ 
			trace("Error message:", event.error.message); 
			trace("Details:", event.error.details); 
		}
		
	}

}