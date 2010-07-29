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
		//Temporary, just until these tests are better organized into the sub classes.
		public var metaDataToolsCase:MetaDataToolsCase;
	}
}