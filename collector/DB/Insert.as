package DB 
{
	/**
	 * ...
	 * @author nika
	 */
	import flash.display.MovieClip;
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.events.MouseEvent;
	import flash.events.SQLUpdateEvent;
	import flash.filesystem.File;
	import profileEngine.HelperStrings;
	
	public class Insert extends EventDispatcher
	{
		private var insertStmt:SQLStatement;
		private var stmt:SQLStatement;
		private var valueToInsert:String;
		private var conn:SQLConnection;
		private var folder:File;
		private var dbFile:File;
	
		
		public function Insert()
		{
			//init();
		}
		public function init(valueToInsert:String):void
		{
			this.valueToInsert = valueToInsert;
			
			conn = new SQLConnection();
			
			conn = new SQLConnection();	
			conn.addEventListener(SQLEvent.OPEN, openHandler);
			//conn.addEventListener(SQLErrorEvent.ERROR, errorHandler);

			folder = File.applicationDirectory;
			dbFile = folder.resolvePath(Settings.DB_NAME);
	
			conn.openAsync(dbFile);		
			
			
						
			
			
		}
		
		private function openHandler(e:Event):void 
		{
			insertStmt = new SQLStatement();
			insertStmt.sqlConnection = conn;
			
			var sql:String = "";
			
			var dataForInput:String = HelperStrings.trim(valueToInsert);
			
			
			sql += "INSERT INTO profileTable (saxeli) ";
			sql += "VALUES ('" + dataForInput  + "')";
			insertStmt.text = sql;
			
			
			conn.addEventListener(SQLUpdateEvent.INSERT, insertStmtListener);
			insertStmt.execute();
		}
		
		private function insertStmtListener(e:SQLUpdateEvent):void 
		{
			dispatchEvent(new CustomEvent(CustomEvent.DATA, "data inserted)"));
		}
		
	}

}