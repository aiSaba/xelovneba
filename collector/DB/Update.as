package DB
{
	

	import flash.events.EventDispatcher;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.filesystem.File;
	
	public class Update extends EventDispatcher
	{
		private var folder:File;
		private var dbFile:File;
		private var conn:SQLConnection;
	
		
		private var createStatement:SQLStatement;
		private var score:int;
		private var pos:int;
		private var insertStmt:SQLStatement;
		
		
		
		public function Update()
		{
			
		}
		
		public function letsDo(score:int,pos:int):void
		{
			this.pos = pos;
			this.score = score;
			conn = new SQLConnection();
			
			conn.addEventListener(SQLEvent.OPEN, openHandler);
			////conn.addEventListener(SQLErrorEvent.ERROR, errorHandler);

			folder = File.applicationDirectory;
			dbFile = folder.resolvePath(Settings.DB_NAME);
	
			conn.openAsync(dbFile);	
			
			
		}
		
		private function openHandler(e:SQLEvent):void 
		{
			insertStmt = new SQLStatement();
			insertStmt.sqlConnection = conn;
			
			var sql:String = "UPDATE profileTable SET qula = '" + score.toString() + "', boloPozicia='"+pos.toString()+"' WHERE saxeli = '" + Settings.PLAYER + "'";
			
			
			trace (sql)
			insertStmt.text = sql;
			insertStmt.addEventListener(SQLEvent.RESULT, insertStmtHandler);

			insertStmt.execute();
			
		}
		
		private function insertStmtHandler(e:SQLEvent):void 
		{
			insertStmt.removeEventListener(SQLEvent.RESULT, insertStmtHandler);
			conn.removeEventListener(SQLEvent.OPEN, openHandler);
			//conn.removeEventListener(SQLErrorEvent.ERROR, errorHandler);
			
			conn.close();
			
			dispatchEvent(new CustomEvent(CustomEvent.DATA, "updated"));
		}
		
		
		
		
	}

}
