package cn.bdconsulting.www.core
{
	import flash.errors.IllegalOperationError;

	public class BdcModel
	{
		private static var _model : BdcModel;
		
		public function BdcModel()
		{
			if(_model == null) {
				_model = new BdcModel();
				return;
			}
			
			throw new IllegalOperationError("这是一个单例类，请使用getInstance方法来获取对象");
		}
		
		public static function getInstance() : BdcModel
		{
			return _model;
		}
		
	}
}