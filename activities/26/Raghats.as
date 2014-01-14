package  {
	
	import com.adobe.images.JPGEncoder;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.FileReference;
	import flash.utils.ByteArray;
	
	//import com.*;
	
	public class Raghats extends EventDispatcher
	{
		
		
		public function Raghats(mc:*)
		{
			var myBitmapData:BitmapData = new BitmapData (mc.width, mc.height); 
			myBitmapData.draw(mc); 
			
			var jpgEncoder:JPGEncoder = new JPGEncoder(85);
			var jpgStream:ByteArray = jpgEncoder.encode(myBitmapData)
			
			var saveFile:FileReference = new FileReference();
			saveFile.addEventListener(Event.COMPLETE, saveCompleteHandler);
			saveFile.addEventListener(Event.CANCEL,cancelHander);
			saveFile.save(jpgStream, (new Date()).time+".jpg");
		}
		
		private function saveCompleteHandler(e:Event):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "sheinaxa"));
		}
		private function cancelHander(e:Event):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "daacencela"));
		}
	
		
	
	}
	
}
