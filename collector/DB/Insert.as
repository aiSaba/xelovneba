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
	
		private var valueToInsert:String;
		private var conn:SQLConnection;
		
	
		
		public function Insert()
		{
			
		}
		
		private function destroy():void
		{
			if (conn)
			{
				conn.removeEventListener(SQLEvent.OPEN, openHandler);
				conn.removeEventListener(SQLUpdateEvent.INSERT, insertStmtListener);
				conn.close();
				conn = null;
			}
		}
		
		public function init(valueToInsert:String):void
		{
			this.valueToInsert = valueToInsert;
			
			var folder:File= File.applicationDirectory;
			var dbFile:File= folder.resolvePath(Settings.DB_NAME);
			
			conn = new SQLConnection();
			conn.addEventListener(SQLEvent.OPEN, openHandler);
			conn.openAsync(dbFile);		
	
		}
		
		private function openHandler(e:Event):void 
		{
			insertStmt = new SQLStatement();
			insertStmt.sqlConnection = conn;
			
			
			var dataForInput:String = HelperStrings.trim(valueToInsert);
			var sql:String = "";			
			sql += "INSERT INTO profileTable (saxeli) ";
			sql += "VALUES ('" + dataForInput  + "')";
			insertStmt.text = sql;
			
			
			conn.addEventListener(SQLUpdateEvent.INSERT, insertStmtListener);
			insertStmt.execute();
		}
		
		private function insertStmtListener(e:SQLUpdateEvent):void 
		{
			destroy();
			dispatchEvent(new CustomEvent(CustomEvent.DATA, "data inserted)"));
		}
		
	}

}