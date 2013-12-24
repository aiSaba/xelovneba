package profileEngine 
{
	/**
	 * ...
	 * @author nika
	 */
	public class HelperStrings 
	{
		
		public function HelperStrings() 
		{
			
		}
		
		public static function trim(item:String):String	
		{
			var _trim:RegExp = /^\s+|\s+$/g;
		///	var string:String = "      spaces are around    ";
		///	trace("Before: START" + str + "END");
			item = item.replace(_trim, "");
			return item;
		///	trace("After : START" + string + "END");
		}
		
	}

}