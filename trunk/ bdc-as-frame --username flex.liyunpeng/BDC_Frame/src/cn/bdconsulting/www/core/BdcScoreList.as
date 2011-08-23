package cn.bdconsulting.www.core
{
	public class BdcScoreList
	{
		private var _scoreList : Array = new Array(10);
		
		private var _scoreListView : Array = new Array(10);
		
		private var _viewCount : int = 10;
		
		public function BdcScoreList()
		{
			for(var i : int = 0; i < _scoreListView.length ;i++) {
				var scoreLabel : BdcLabel = new BdcLabel();
				scoreLabel.visible = false;
				_scoreListView.push(scoreLabel);
			}
		}
		
		public function viewCount(_count : int) : void
		{
			_viewCount = _count;
			for(var i : int = 0; i < _scoreListView.length; i++) {
				(_scoreListView[i] as BdcLabel).visible = i<_count ? true:false;
			}
		}
		
		public function setScoreList(_arr : Array) : void
		{
			for(var i : int = 0; i < _arr.length; i++) {
				_scoreList[i] = _arr[i];
				(_scoreListView[i] as BdcLabel).text = "第" + (i+1) + "名" + _arr[i] + "分";
			}
		}
	}
}