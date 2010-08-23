package tests.org.flexunit.async {
	import tests.org.flexunit.async.AsyncAS.AsyncASSuite;
	
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class AsyncSuite {
		CONFIG::useFlexClasses {		
			public var testResponder:TestResponderCase;
		}
		public var asyncASSuite:AsyncASSuite;
		public var asyncResponder:AsyncTestResponderCase;
		public var nativeResponder:AsyncNativeTestResponderCase;
		public var asyncLocator:AsyncLocatorCase;
	}
}