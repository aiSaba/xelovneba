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
		
		private var conn:SQLConnection;
		private var score:int;
		private var pos:int;
		private var updateStmt:SQLStatement;
		
		
		
		public function Update()
		{
			
		}
		
		private function destroy():void
		{
			
			if (updateStmt)
			{
				updateStmt.removeEventListener(SQLEvent.RESULT, updateStmtHandler);
				updateStmt = null;
			}
			
			if (conn)
			{
				conn.removeEventListener(SQLEvent.OPEN, openHandler);
				conn.close();
				conn = null;
			}
		}
		
		public function letsDo(score:int,pos:int):void
		{
			this.pos = pos;
			this.score = score;
					
			var folder:File= File.applicationDirectory;
			var dbFile:File = folder.resolvePath(Settings.DB_NAME);
			
			conn = new SQLConnection();
			conn.addEventListener(SQLEvent.OPEN, openHandler);
			conn.openAsync(dbFile);	
		}
		
		private function openHandler(e:SQLEvent):void 
		{
			updateStmt = new SQLStatement();
			updateStmt.sqlConnection = conn;
			
			var sql:String = "UPDATE profileTable SET qula = '" + score.toString() + "', boloPozicia='"+pos.toString()+"' WHERE saxeli = '" + Settings.PLAYER + "'";
			
			updateStmt.text = sql;
			updateStmt.addEventListener(SQLEvent.RESULT, updateStmtHandler);

			updateStmt.execute();
			
		}
		
		private function updateStmtHandler(e:SQLEvent):void 
		{
			destroy();
			dispatchEvent(new CustomEvent(CustomEvent.DATA, "updated"));
		}
		
		
		
		
	}

}
