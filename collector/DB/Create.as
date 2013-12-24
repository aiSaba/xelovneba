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
		
		private var folder:File;
		private var dbFile:File;
		private var conn:SQLConnection;
	//	private var createTables:CreateTables;
		private var createStatement:SQLStatement;
		
		
		public function Create()
		{
			init();
		}
	
		private function init():void
		{
			
			conn = new SQLConnection();
			
			conn.addEventListener(SQLEvent.OPEN, openHandler);
			conn.addEventListener(SQLErrorEvent.ERROR, errorHandler);

			folder = File.applicationDirectory;
			dbFile = folder.resolvePath(Settings.DB_NAME);
	
			conn.openAsync(dbFile);		
		}
		
		private function openHandler(event:SQLEvent):void
		{
			createNewTable();
		}	
		
		private function errorHandler(event:SQLErrorEvent):void
		{
			trace("Error message:", event.error.message);
			trace("Details:", event.error.details);
		}
		
		private function createNewTable():void  //event:SQLEvent
		{
			createStatement = new SQLStatement();
			createStatement.sqlConnection = conn;
		
			
			
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
		

			createStatement.text = sql;
			
			createStatement.addEventListener(SQLEvent.RESULT, createResult); 
			createStatement.addEventListener(SQLErrorEvent.ERROR, createError);
			
			createStatement.execute(); 
			
		}
		
		private  function createResult(event:SQLEvent):void 
		{ 
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