﻿package
{
	
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	public class Stage_15 extends MovieClip
	{
		
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var soundControl:SoundControl;
		private var allObjects:MovieClip;
		private var Graphic_paintObjectsArray:Array;
		private var Perwera_paintObjectsArray:Array;
		private var startingPosX:int;
		private var CorrectCounter:int;
		
		private var startingPosY:int;
		private var dropCounter:int = 0;
		private var SiteArray:Array;
		private var IndexSiteArray:int;
		private var amogdebulebisArray:Array;
		private var Graphic_NameIndex:int
		private var Perwera_NameIndex:int;
		
		public function Stage_15()
		{

			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			allFunc();
		
		}
		
		private function allFunc():void
		{_stageWidth = stage.stageWidth;
			_stageHeight = stage.stageHeight;
			
			addStage();
			Graphic_paintObjectsArray = [allObjects.nothing_mc, allObjects.brush_mc, allObjects.paper_mc, allObjects.sangina_mc, allObjects.guashi_mc, allObjects.akvareli_mc, allObjects.pasteli_mc, allObjects.pencil_mc];
			Perwera_paintObjectsArray = [allObjects.palitra_mc, allObjects.oil_paint_mc, allObjects.molberti_mc, allObjects.tilo_mc, allObjects.oil_brush_mc];
			
			amogdebulebisArray = []
			addListeners();
			allObjects.drop_site_mc.YposBox.visible = false ; 
			allObjects.nothing_mc.visible = false
		
		}
		
		private function addListeners():void
		{
			
			for (var i:int = 0; i < Graphic_paintObjectsArray.length; i++)
			{
				Graphic_paintObjectsArray[i].addEventListener(MouseEvent.MOUSE_DOWN, dragFunc);
				//Graphic_paintObjectsArray[i].addEventListener(MouseEvent.MOUSE_UP, dragStopFuncNoDrop);
				Graphic_paintObjectsArray[i].text_name.visible = false;
				Graphic_paintObjectsArray[i].buttonMode = true;
			}
			
			for (var k:int = 0; k < Perwera_paintObjectsArray.length; k++)
			{
				Perwera_paintObjectsArray[k].addEventListener(MouseEvent.MOUSE_DOWN, dragFunc);
				//Perwera_paintObjectsArray[k].addEventListener(MouseEvent.MOUSE_UP, dragStopFunc);
				Perwera_paintObjectsArray[k].text_name.visible = false;
				Perwera_paintObjectsArray[k].buttonMode = true;
			}
		
		}
		
		private function dragFunc(e:MouseEvent):void
		{
			e.currentTarget.parent.setChildIndex(DisplayObject(e.currentTarget),  e.currentTarget.parent.numChildren - 1);
			startingPosX = e.currentTarget.x
			startingPosY = e.currentTarget.y
			e.currentTarget.startDrag();
			e.currentTarget.text_name.visible = true
			setTimeout(TextNameCaller, 500)
			for (var i:int = 0; i < Graphic_paintObjectsArray.length; i++)
			{
				if (e.currentTarget.name == Graphic_paintObjectsArray[i].name)
				{
					Graphic_NameIndex = i
					Graphic_paintObjectsArray[Graphic_NameIndex].addEventListener(MouseEvent.MOUSE_UP, dragStopFuncNoDrop);
				}
				
			}
			
			for (var k:int = 0; k < Perwera_paintObjectsArray.length; k++)
			{
				if (e.currentTarget.name == Perwera_paintObjectsArray[k].name)
				{
					Perwera_NameIndex = k
					Perwera_paintObjectsArray[Perwera_NameIndex].addEventListener(MouseEvent.MOUSE_UP, dragStopFunc);
				}
				
			}
		}
		
		private function TextNameCaller():void
		
		{
			Graphic_paintObjectsArray[Graphic_NameIndex].text_name.visible = false;
			Perwera_paintObjectsArray[Perwera_NameIndex].text_name.visible = false;
		}
		
		private function dragStopFunc(e:MouseEvent):void
		{
			Perwera_paintObjectsArray[Perwera_NameIndex].removeEventListener(MouseEvent.MOUSE_UP, dragStopFunc);
			if (e.currentTarget.paint_tool_mc.hitTestObject(allObjects.drop_site_mc))
			{
				for (var i:int = 0; i < Perwera_paintObjectsArray.length; i++)
				{
					if (e.currentTarget.name == Perwera_paintObjectsArray[i].name)
					{
						dropIn(e);
						break
					}
				}
			}
			else
			{
				
				e.currentTarget.stopDrag();
				TweenLite.to(e.currentTarget, 0.5, { x: startingPosX, y: startingPosY } );
				
			}
		}
		
		private function dragStopFuncNoDrop(e:MouseEvent):void
		{
			Graphic_paintObjectsArray[Graphic_NameIndex].removeEventListener(MouseEvent.MOUSE_UP, dragStopFuncNoDrop);
			e.currentTarget.stopDrag();
			TweenLite.to(e.currentTarget, 0.5, { x: startingPosX, y: startingPosY } );
			if (e.currentTarget.paint_tool_mc.hitTestObject(allObjects.drop_site_mc)) {
				
			TweenMax.to(e.currentTarget.paint_tool_mc, 1, { glowFilter: { color:0xff0000, alpha:1, blurX:15, blurY:15, strength:3,delay:1.5 , remove:true }} );
			FalseFunc();
			}
		}
		
		private function dropIn(e:MouseEvent):void
		{
			if (e.currentTarget.name == allObjects.molberti_mc.name)
			{
				e.currentTarget.removeEventListener(MouseEvent.MOUSE_DOWN, dragFunc);
				e.currentTarget.removeEventListener(MouseEvent.MOUSE_UP, dragStopFunc);
				e.currentTarget.stopDrag();
				TweenLite.to(e.currentTarget, 0.5, {x: allObjects.drop_site_mc.x, y: allObjects.drop_site_mc.YposBox.y + e.currentTarget.height / 4, scaleX: 0.7, scaleY: 0.7});
				allObjects.drop_site_mc.YposBox.y = allObjects.drop_site_mc.YposBox.y + e.currentTarget.height /1.5
				CorrecteFunc();
				TweenMax.to(e.currentTarget.paint_tool_mc, 1, {glowFilter: {color: 0x91e600, alpha: 1, blurX: 15, blurY: 15, strength: 3, remove: 1}});
				
			}
				else if (e.currentTarget.name == allObjects.tilo_mc.name)
			{
				e.currentTarget.removeEventListener(MouseEvent.MOUSE_DOWN, dragFunc);
				e.currentTarget.removeEventListener(MouseEvent.MOUSE_UP, dragStopFunc);
				e.currentTarget.stopDrag();
				TweenLite.to(e.currentTarget, 0.5, {x: allObjects.drop_site_mc.x, y: allObjects.drop_site_mc.YposBox.y + e.currentTarget.height / 4, scaleX: 0.7, scaleY: 0.7});
				allObjects.drop_site_mc.YposBox.y = allObjects.drop_site_mc.YposBox.y + e.currentTarget.height /1.2
				CorrecteFunc();
				TweenMax.to(e.currentTarget.paint_tool_mc, 1, {glowFilter: {color: 0x91e600, alpha: 1, blurX: 15, blurY: 15, strength: 3, remove: 1}});
				
			}
			
			else if (e.currentTarget.name == allObjects.oil_brush_mc.name)
			{
				e.currentTarget.removeEventListener(MouseEvent.MOUSE_DOWN, dragFunc);
				e.currentTarget.removeEventListener(MouseEvent.MOUSE_UP, dragStopFunc);
				e.currentTarget.stopDrag();
				TweenLite.to(e.currentTarget, 0.5, {x: allObjects.drop_site_mc.x, y: allObjects.drop_site_mc.YposBox.y + e.currentTarget.height / 4, scaleX: 0.8, scaleY: 0.8});
				allObjects.drop_site_mc.YposBox.y = allObjects.drop_site_mc.YposBox.y + e.currentTarget.height /1.2
				CorrecteFunc();
				TweenMax.to(e.currentTarget, 1, {glowFilter: {color: 0x91e600, alpha: 1, blurX: 15, blurY: 15, strength: 3, remove: 1}});
				
			}
			
			else if (e.currentTarget.name == allObjects.palitra_mc.name)
			{
				e.currentTarget.removeEventListener(MouseEvent.MOUSE_DOWN, dragFunc);
				e.currentTarget.removeEventListener(MouseEvent.MOUSE_UP, dragStopFunc);
				e.currentTarget.stopDrag();
				TweenLite.to(e.currentTarget, 0.5, {x: allObjects.drop_site_mc.x, y: allObjects.drop_site_mc.YposBox.y + e.currentTarget.height / 4, scaleX: 0.8, scaleY: 0.8});
				allObjects.drop_site_mc.YposBox.y = allObjects.drop_site_mc.YposBox.y + e.currentTarget.height /1.2
				CorrecteFunc();
				TweenMax.to(e.currentTarget, 1, {glowFilter: {color: 0x91e600, alpha: 1, blurX: 15, blurY: 15, strength: 3, remove: 1}});
				
			}
			else
			{
				e.currentTarget.removeEventListener(MouseEvent.MOUSE_DOWN, dragFunc);
				e.currentTarget.removeEventListener(MouseEvent.MOUSE_UP, dragStopFunc);
				e.currentTarget.stopDrag();
				TweenLite.to(e.currentTarget, 0.5, {x: allObjects.drop_site_mc.x, y: allObjects.drop_site_mc.YposBox.y + e.currentTarget.height / 6});
				allObjects.drop_site_mc.YposBox.y = allObjects.drop_site_mc.YposBox.y + e.currentTarget.height /1.2
				CorrecteFunc();
				TweenMax.to(e.currentTarget, 1, {glowFilter: {color: 0x91e600, alpha: 1, blurX: 15, blurY: 15, strength: 3, remove: 1}});
			}
		
		}
		
		private function addStage():void
		{
			allObjects = new AllObjects();
			addChild(allObjects);
			allObjects.x = _stageWidth / 2;
			allObjects.y = _stageHeight / 2;
			allObjects.height = _stageHeight / 1.5;
			allObjects.scaleX = allObjects.scaleY;
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
		}
		
		private function destroy ():void
		{
			TweenMax.killAll();
			
			if (allObjects)
			{
				for (var i:int = 0; i < Graphic_paintObjectsArray.length; i++)
			{
				Graphic_paintObjectsArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, dragFunc);
				Graphic_paintObjectsArray[i].removeEventListener(MouseEvent.MOUSE_UP, dragStopFunc);
				
			}
			
			for (var k:int = 0; k < Perwera_paintObjectsArray.length; k++)
			{
				Perwera_paintObjectsArray[k].removeEventListener(MouseEvent.MOUSE_DOWN, dragFunc);
				Perwera_paintObjectsArray[k].removeEventListener(MouseEvent.MOUSE_UP, dragStopFuncNoDrop);
				
			}
			removeChild(allObjects);
			allObjects = null;
			}
			exit(null)
		}
		
		private function exit(e:*):void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame"));
			trace(dispatchEvent);
		}
		
		private function CorrecteFunc()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			
						
			CorrectCounter++
			trace (CorrectCounter)
			
			if (CorrectCounter == 5 )
			{
				ClapFunc();
				setTimeout(destroy, 1500)
			}
		}
		
		private function FalseFunc()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("error.mp3", 1);
			addChild(soundControl);
			soundControl.soundPlay();
		}
		
		private function ClapFunc()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("clap.mp3", 1);
			addChild(soundControl);
			soundControl.soundPlay();
			
		}
	
	}

}
