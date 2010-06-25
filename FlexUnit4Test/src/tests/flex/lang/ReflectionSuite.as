package tests.flex.lang {
	import tests.flex.lang.field.FieldSuite;
	import tests.flex.lang.metadata.MetaDataSuite;
	import tests.flex.lang.method.MethodSuite;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class ReflectionSuite {
		public var metaDataSuite:MetaDataSuite;
		public var fieldSuite:FieldSuite;
		public var methodSuite:MethodSuite;
		
	}
}