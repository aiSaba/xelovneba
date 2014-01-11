package
{
	
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	public class Stage_14 extends MovieClip
	{
		
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var allObjects:MovieClip;
		private var Graphic_paintObjectsArray:Array;
		private var Perwera_paintObjectsArray:Array;
		private var startingPosX:int;
		private var startingPosY:int;
		private var dropCounter:int = 0;
		private var SiteArray:Array;
		private var IndexSiteArray:int;
		private var amogdebulebisArray:Array;
		
		public function Stage_14(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			allFunc();
		
		}
		
		private function allFunc():void
		{
			
			addStage();
			Graphic_paintObjectsArray = [allObjects.nothing_mc, allObjects.brush_mc, allObjects.paper_mc, allObjects.sangina_mc, allObjects.guashi_mc, allObjects.akvareli_mc, allObjects.pasteli_mc, allObjects.pencil_mc];
			Perwera_paintObjectsArray = [allObjects.palitra_mc, allObjects.oil_paint_mc, allObjects.molberti_mc, allObjects.tilo_mc, allObjects.oil_brush_mc];
			SiteArray = [allObjects.drop_site_mc.site_1, allObjects.drop_site_mc.site_2, allObjects.drop_site_mc.site_3, allObjects.drop_site_mc.site_4, allObjects.drop_site_mc.site_5, allObjects.drop_site_mc.site_6, allObjects.drop_site_mc.site_7];
			addListeners();
			
			for (var i:int = 0; i < SiteArray.length; i++)
			{
				SiteArray[i].visible = true //false
			}
		}
		
		private function addListeners():void
		{
			
			for (var i:int = 0; i < Graphic_paintObjectsArray.length; i++)
			{
				Graphic_paintObjectsArray[i].addEventListener(MouseEvent.MOUSE_DOWN, dragFunc);
				Graphic_paintObjectsArray[i].addEventListener(MouseEvent.MOUSE_UP, dragStopFunc);
			}
			
			for (var k:int = 0; k < Perwera_paintObjectsArray.length; k++)
			{
				Perwera_paintObjectsArray[k].addEventListener(MouseEvent.MOUSE_DOWN, dragFunc);
				Perwera_paintObjectsArray[k].addEventListener(MouseEvent.MOUSE_UP, dragStopFuncNoDrop);
			}
		
		}
		
		private function dragFunc(e:MouseEvent):void
		{
			startingPosX = e.currentTarget.x
			startingPosY = e.currentTarget.y
			e.currentTarget.startDrag();
		}
		
		private function dragStopFunc(e:MouseEvent):void
		{
			if (e.currentTarget.hitTestObject(allObjects.drop_site_mc))
			{
				for (var i:int = 0; i < Graphic_paintObjectsArray.length; i++)
				{
					if (e.currentTarget.name == Graphic_paintObjectsArray[i].name)
					{
						dropIn(e);
						break
					}
				}
			}
			else
			{
				e.currentTarget.stopDrag();
				TweenLite.to(e.currentTarget, 0.5, {x: startingPosX, y: startingPosY});
			}
		
		}
		
		private function dragStopFuncNoDrop(e:MouseEvent):void
		{
			e.currentTarget.stopDrag();
			TweenLite.to(e.currentTarget, 0.5, {x: startingPosX, y: startingPosY});
		}
		
		private function dropIn(e:MouseEvent):void
		{
			
			dropCounter++
			trace("chavarda")
			e.currentTarget.removeEventListener(MouseEvent.MOUSE_DOWN, dragFunc);
			e.currentTarget.stopDrag();
			// GATVALEEEEEEEEEEEEEEEEEEEe////
			
			for (var i:int = 0; i < SiteArray.length; i++)
			{
				if (e.currentTarget.hitTestObject(SiteArray[i]))
				{
					IndexSiteArray = i
					trace(IndexSiteArray)
				}
				
			}
			amogdebulebisArray = []
			amogdebulebisArray.push(IndexSiteArray)
			trace(amogdebulebisArray + "amovarda")
			
			if (amogdebulebisArray.length > 1)
			{
				for (var k:int = 0; k < amogdebulebisArray.length; k++)
				{
					trace("safcsd")
					if (IndexSiteArray == amogdebulebisArray[k])
					{
						trace("aq ar unda chajdes")
					}
					
				}
			}
			
			TweenLite.to(e.currentTarget, 0.5, {x: allObjects.drop_site_mc.x, y: SiteArray[IndexSiteArray].y});
			e.currentTarget.scaleX = e.currentTarget.scaleY
		
			//TweenLite.to(e.currentTarget, 1, { x:allObjects.drop_site_mc.x, y:allObjects.drop_site_mc.y - allObjects.drop_site_mc.height/2 + e.currentTarget.height/2 +((allObjects.drop_site_mc.height-(allObjects.drop_site_mc.height/7)*6)/7)*dropCounter + allObjects.drop_site_mc.height/8*dropCounter  } );
		
		}
		
		private function addStage():void
		{
			allObjects = new AllObjects();
			addChild(allObjects);
			allObjects.x = _stageWidth / 2;
			allObjects.y = _stageHeight / 2;
			allObjects.height = _stageHeight / 1.5;
			allObjects.scaleX = allObjects.scaleY;
		}
	
	}

}
