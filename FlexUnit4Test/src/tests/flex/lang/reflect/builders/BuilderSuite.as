package tests.flex.lang.reflect.builders {
	import tests.flex.lang.reflect.builders.methodBuilder.MethodBuilderWithInvalidData;
	import tests.flex.lang.reflect.builders.methodBuilder.MethodBuilderWithValidData;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class BuilderSuite {
		public var methodBuilderValid:MethodBuilderWithValidData;
		public var methoBuilderInvalid:MethodBuilderWithInvalidData;
	}
}