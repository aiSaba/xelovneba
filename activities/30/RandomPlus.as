package  
{
	import flash.display.MovieClip;
	public class RandomPlus extends MovieClip
	{
		private var _st:Number;
		private var _en:Number;
		private var _len:Number;
		private var _pos:Number;
		private var _numPos:Number;
		private var _myNums:Array;
		private var _randNums:Array;
			
		public function RandomPlus(en:Number, st:Number = 0) 
		{
			_st = st;
			_en = en;
			
			// just in case if params order mixup:
			if(en < st){
				_st = en;
				_en = st;
			}
			
			_len = _en - _st + 1;
			shuffle();
		}
		
		public function getNum():Number
		{
			// if passed last item:
			if(_numPos == _len)shuffle();
			
			var myResult:Number = _randNums[_numPos];
			_numPos++;
			return myResult;
		}
		
		private function shuffle():void
		{
			_numPos = 0;
			_randNums = [];
			_myNums = [];
			
			// Creating Numbers Array:
			var i:Number;
			for(i = 0; i<_len; i++){ _myNums[i] = _st + i; }
			
			// Creating shuffled Numbers Array:
			i = 0;
			while(_myNums.length > 0){
				_pos = Math.round(Math.random()*(_myNums.length-1));
				_randNums[i] = _myNums[_pos];
				i++;
				_myNums.splice(_pos,1);
			}
		}
		
		public function get len():Number
		{
			return _len;
		}

	}
	
}