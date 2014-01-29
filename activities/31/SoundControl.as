package 
{

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.media.SoundTransform;
	


	public class SoundControl extends Sprite 
	{
		private var mySound:Sound
		private var channel:SoundChannel
		private var lastPosition:Number
		private var mp3Volume:Number;
		private var isSoundPlaying:Boolean
		

		public function SoundControl()
		{

			isSoundPlaying = false;
		}
	
		public function loadSound(soundName:String, mp3Volume:Number):void
		{

			this.mp3Volume = mp3Volume;
		
			mySound = new Sound(new URLRequest("sounds/" + soundName)); 
			mySound.addEventListener(Event.COMPLETE, doLoadComplete);

			channel = new SoundChannel();
	

		}
		
		
		public function soundGetPosition():Number
		{
			return channel.position;
		}
		
		public function soundStop():void
		{
			lastPosition = channel.position
			channel.removeEventListener(Event.SOUND_COMPLETE, doSoundComplete);
			channel.stop();
			isSoundPlaying=false
			
		}
		public function soundPlayFromPosition(pos:Number):void
		{
			channel = mySound.play(pos);
			
			
			channel.addEventListener(Event.SOUND_COMPLETE, doSoundComplete);
			
			isSoundPlaying=true
		}

		
		public function soundResume():void
		{
			channel = mySound.play(lastPosition);
			channel.soundTransform = new SoundTransform(mp3Volume); 
			channel.addEventListener(Event.SOUND_COMPLETE, doSoundComplete);
			isSoundPlaying=true
		}
		public function soundPlay(loop:Boolean=false):void 
		{	
			if (!loop){
				channel = mySound.play();
			} else {
				channel = mySound.play(0,9999);
			}

			channel.soundTransform = new SoundTransform(mp3Volume); 
			channel.addEventListener(Event.SOUND_COMPLETE, doSoundComplete);
			isSoundPlaying = true;
			
		
		}
		
		public function soundIsPlaying():Boolean
		{
			return isSoundPlaying;
		}
		
		
		private function doLoadComplete(event:Event):void
		{
		   isSoundPlaying = false;
		}

		private function doSoundComplete(event:Event):void
		{
			isSoundPlaying = false;
			channel.removeEventListener(Event.SOUND_COMPLETE, doSoundComplete);
		}

	}

}