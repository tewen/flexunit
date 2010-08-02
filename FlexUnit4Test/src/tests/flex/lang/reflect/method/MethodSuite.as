package tests.flex.lang.reflect.method {
	import tests.flex.lang.reflect.method.methodBuilder.MethodWithInvalidData;
	import tests.flex.lang.reflect.method.methodBuilder.MethodWithValidData;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class MethodSuite {
		public var methodWithValid:MethodWithValidData;
		public var methodWithInvalid:MethodWithInvalidData;
	}
}