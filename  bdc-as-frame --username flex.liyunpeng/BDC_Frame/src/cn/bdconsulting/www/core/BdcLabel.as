package cn.bdconsulting.www.core
{
	/**
	 * Label文本框，不可选择文本内容的文本框
	 * @author LiYunpeng
	 * 
	 */	
	public class BdcLabel extends BdcTextField
	{
		public function BdcLabel()
		{
			super();
			init();
		}
		
		private function init() : void
		{
			super.selectable = false;
		}
	}
}