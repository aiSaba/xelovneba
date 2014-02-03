package
{
	
	import com.greensock.events.LoaderEvent;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	import flash.geom.Rectangle;
	import flash.utils.setTimeout;
	
	public class Action extends MovieClip
	{
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		private var mainMc:MovieClip;
		private var old_X:Number;
		private var old_Y:Number;
		private var currentMc:MovieClip;
		private var obj_1:MovieClip;
		private var obj_2:MovieClip;
		private var obj_3:MovieClip;
		private var obj_4:MovieClip;
		private var obj_5:MovieClip;
		private var obj_6:MovieClip;
		private var obj_7:MovieClip;
		private var obj_8:MovieClip;
		
		private var objArray:Array;
		
		public function Action(_stageHeight, _stageWidth, mainMc)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			this.mainMc = mainMc;
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		
		private function addObjects():void
		{
			mainMc.continueMc.addEventListener(MouseEvent.MOUSE_DOWN, destroy);
			mainMc.continueMc.visible = false;
			mainMc.ornamentMc.visible = false;
			obj_1 = new Obj_1() as MovieClip;
			obj_2 = new Obj_2() as MovieClip;
			obj_3 = new Obj_3() as MovieClip;
			obj_4 = new Obj_4() as MovieClip;
			obj_5 = new Obj_5() as MovieClip;
			obj_6 = new Obj_6() as MovieClip;
			obj_7 = new Obj_7() as MovieClip;
			obj_8 = new Obj_8() as MovieClip;
			objArray = [obj_1, obj_2, obj_3, obj_4, obj_5, obj_6, obj_7, obj_8];
			
			obj_1.x = -388;
			obj_1.y = 130;
			obj_2.x = -198;
			obj_2.y = 132;
			obj_3.x = 23;
			obj_3.y = -1;
			obj_4.x = 11;
			obj_4.y = 124;
			obj_5.x = 174;
			obj_5.y = 235;
			obj_6.x = 356;
			obj_6.y = 217;
			obj_7.x = -9;
			obj_7.y = 265;
			obj_8.x = 294;
			obj_8.y = -8;
			
			for (var i:int = 0; i < objArray.length; i++)
			{
				mainMc.addChild(objArray[i]);
				objArray[i].addEventListener(MouseEvent.MOUSE_DOWN, addOnTurningPoint)
			}
		}
		
		private function addOnTurningPoint(e:MouseEvent):void
		{
			currentMc = new MovieClip();
			currentMc = e.currentTarget as MovieClip;
			old_X = currentMc.x;
			old_Y = currentMc.y;
			currentMc.x = -413;
			currentMc.y = -191.5;
			ratio(currentMc);
			for (var i:int = 0; i < objArray.length; i++)
			{
				objArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, addOnTurningPoint);
			}
			
			mainMc.deleteMc.addEventListener(MouseEvent.MOUSE_DOWN, deleteFromTurningPoint);
			mainMc.playMc.addEventListener(MouseEvent.MOUSE_DOWN, playOrnament);
		}
		
		private function ratio(mc:MovieClip):void
		{
			var ratio:Number;
			
			if (mc.height > mc.width)
			{
				ratio = mainMc.turningPoint.height / mc.height;
			}
			else if (mc.width > mc.height)
			{
				ratio = mainMc.turningPoint.width / mc.width;
			}
			mc.scaleX = ratio;
			mc.scaleY = ratio;
		}
		
		private function playOrnament(e:MouseEvent):void
		{
			mainMc.ornamentMc.visible = true;
			mainMc.playMc.visible = false;
			mainMc.deleteMc.visible = false;
			mainMc.turningPoint.visible = false;
			mainMc.backGround.visible = false;
			cloneMovieClip();
		}
		
		private function cloneMovieClip():void
		{
			var cloneMc1:MovieClip;
			var cloneMc2:MovieClip;
			var cloneMc3:MovieClip;
			var cloneMc4:MovieClip;
			var cloneMc5:MovieClip;
			var cloneMc6:MovieClip;
			var cloneMc7:MovieClip;
			var cloneMc8:MovieClip;
			var cloneMc9:MovieClip;
			var cloneMc10:MovieClip;
			var cloneMc11:MovieClip;
			var cloneMc12:MovieClip;
			var cloneMc13:MovieClip;
			
			var cloneArr:Array;
			cloneArr = [cloneMc1, cloneMc2, cloneMc3, cloneMc4, cloneMc5, cloneMc6, cloneMc7, cloneMc8, cloneMc9, 
						cloneMc10,cloneMc11,cloneMc12,cloneMc13];
			switch (currentMc)
			{
				case obj_1: 
					for (var i:int = 0; i < cloneArr.length; i++)
					{
						cloneArr[i] = new Obj_1();
					}
					break;
				case obj_2: 
					for (var i:int = 0; i < cloneArr.length; i++)
					{
						cloneArr[i] = new Obj_2();
					}
					break;
				case obj_3: 
					for (var i:int = 0; i < cloneArr.length; i++)
					{
						cloneArr[i] = new Obj_3();
					}
					break;
				case obj_4: 
					for (var i:int = 0; i < cloneArr.length; i++)
					{
						cloneArr[i] = new Obj_4();
					}
					break;
				case obj_5: 
					for (var i:int = 0; i < cloneArr.length; i++)
					{
						cloneArr[i] = new Obj_5();
					}
					break;
				case obj_6: 
					for (var i:int = 0; i < cloneArr.length; i++)
					{
						cloneArr[i] = new Obj_6();
					}
					break;
				case obj_7: 
					for (var i:int = 0; i < cloneArr.length; i++)
					{
						cloneArr[i] = new Obj_7();
					}
					break;
				case obj_8: 
					for (var i:int = 0; i < cloneArr.length; i++)
					{
						cloneArr[i] = new Obj_8();
					}
					break;
			}
			var firstCoordinate:Number = -413;
			var widthSum:Number = 0;
			for (var j:int = 0; j < cloneArr.length; j++)
			{	
				if (mainMc.ornamentMc.width/1.2 < widthSum )
				return;
				mainMc.addChild(cloneArr[j])
				
				ratio(cloneArr[j]);
				firstCoordinate =  firstCoordinate + cloneArr[j].width + 12;
				cloneArr[j].x = firstCoordinate;
				widthSum += cloneArr[j].width + 15;
				cloneArr[j].y = -191.5;
				if (j % 2 == 0)
				{
					cloneArr[j].rotationY = 180;
				}
			}
		}
		
		private function deleteFromTurningPoint(e:MouseEvent):void
		{
			currentMc.x = old_X;
			currentMc.y = old_Y;
			currentMc.scaleX = 1;
			currentMc.scaleY = 1;
			addObjects();
		}
		
		private function nextWithTimer():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
			destroy(null);
		}
		
		private function destroy(arg:*):void
		{
			mainMc.visible = false;
		
		}
	}

}
