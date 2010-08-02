package tests.flex.lang.reflect.metadata.utils
{
	import tests.flex.lang.reflect.metadata.utils.metaDataTools.ToolsWithInvalidData;
	import tests.flex.lang.reflect.metadata.utils.metaDataTools.ToolsWithValidData;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class MetaDataToolsSuite
	{
		public var validDataTools:ToolsWithValidData;
		public var invalidDataTools:ToolsWithInvalidData;
	}
}