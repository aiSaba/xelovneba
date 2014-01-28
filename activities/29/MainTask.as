package
{
	
	import com.greensock.motionPaths.MotionPath;
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.ui.Mouse;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	
	public class MainTask extends MovieClip
	{
		private var all:MovieClip;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		private var lipsArr:Array;
		private var hearArr:Array;
		private var noiseArr:Array;
		private var eyeArr:Array;
		private var noiseCounter:Number = 0;
		private var lipCounter:Number = 0;
		private var hearCounter:Number = 0;
		private var eyeCounter:Number = 0;
		
		public function MainTask(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (all)
			{
				removeChild(all);
				all = null;
			}
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		
		private function addObjects():void
		{
			all = new All();
			all.x = _stageWidth / 2;
			all.y = _stageHeight / 2;
			all.height = _stageHeight / 2;
			all.scaleX = all.scaleY;
			addChild(all);
			
			noiseArr = [all.noise_1, all.noise_2, all.noise_3];
			lipsArr = [all.lip_1, all.lip_2, all.lip_3];
			eyeArr = [all.eye_1, all.eye_2, all.eye_3];
			hearArr = [all.hear_1, all.hear_2, all.hear_3];
			for (var i:int = 1; i <= 4; i++)
			{
				all['right_' + i].addEventListener(MouseEvent.MOUSE_DOWN, changeFace);
				all['left_' + i].addEventListener(MouseEvent.MOUSE_DOWN, changeFace);
			}
			for (var j:int = 0; j < 3; j++) 
			{
				noiseArr[j].visible = false;
				lipsArr[j].visible = false;
				eyeArr[j].visible = false;
				hearArr[j].visible = false;
			}
			noiseArr[0].visible = true;
			lipsArr[0].visible = true;
			eyeArr[0].visible = true;
			hearArr[0].visible = true;
			all.takePhoto.addEventListener(MouseEvent.MOUSE_DOWN, takePhotoFunc);
		}
		
		private function changeFace(e:MouseEvent):void
		{
			
			switch (e.currentTarget.name)
			{
				case 'right_1': 
					if (hearCounter == 2)
						return;
					hearCounter++;
					break;
				case 'right_2': 
					if (eyeCounter == 2)
						return;
					eyeCounter++;
					break;
				case 'right_3': 
					if (noiseCounter == 2)
						return;
					noiseCounter++;
					break;
				case 'right_4': 
					if (lipCounter == 2)
						return;
					lipCounter++;
					break;
				case 'left_1': 
					if (hearCounter == 0)
						return;
					hearCounter--;
					break;
				case 'left_2': 
					if (eyeCounter == 0)
						return;
					eyeCounter--;
					break;
				case 'left_3': 
					if (noiseCounter == 0)
						return;
					noiseCounter--;
					break;
				case 'left_4': 
					if (lipCounter == 0)
						return;
					lipCounter--;
					break;
			}
			for (var i:int = 0; i < 3; i++)
			{
				if (i == noiseCounter)
					noiseArr[noiseCounter].visible = true;
				else
					noiseArr[i].visible = false;
				if (i == lipCounter)
					lipsArr[lipCounter].visible = true;
				else
					lipsArr[i].visible = false;
				if (i == eyeCounter)
					eyeArr[eyeCounter].visible = true;
				else
					eyeArr[i].visible = false;
				if (hearCounter == i)
					hearArr[hearCounter].visible = true;
				else
					hearArr[i].visible = false;
			}
		}
		
		private function takePhotoFunc(e:MouseEvent):void
		{
			var ragaths:Raghats = new Raghats(stage);
			ragaths.addEventListener(DataEvent.DATA, scrListener)
		}
		
		private function scrListener(e:DataEvent):void
		{
			if (e.data == "sheinaxa")
			{
				setTimeout(function()
					{
						dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame"));
						destroy(null);
					}, 1000);
			}
		}
	
	}

}
