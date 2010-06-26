package tests.flex.lang {
	import tests.flex.lang.constructor.ConstructorSuite;
	import tests.flex.lang.field.FieldSuite;
	import tests.flex.lang.klass.KlassSuite;
	import tests.flex.lang.metadata.MetaDataSuite;
	import tests.flex.lang.method.MethodSuite;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class ReflectionSuite {
		public var metaDataSuite:MetaDataSuite;
		public var fieldSuite:FieldSuite;
		public var methodSuite:MethodSuite;
		public var constructorSuite:ConstructorSuite;
		public var klassSuite:KlassSuite;
		
	}
}