package tests.flex.lang {
	import tests.flex.lang.field.FieldSuite;
	import tests.flex.lang.metadata.MetaDataSuite;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class ReflectionSuite {
		public var metaDataSuite:MetaDataSuite;
		public var fieldSuite:FieldSuite;
		
	}
}