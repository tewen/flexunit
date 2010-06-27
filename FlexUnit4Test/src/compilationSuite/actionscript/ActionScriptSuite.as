package compilationSuite.actionscript {
	import tests.flex.lang.reflect.ReflectionSuite;
	import tests.org.flexunit.assert.AssertionAndAssumptionSuite;
	import tests.org.flexunit.events.EventsSuite;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class ActionScriptSuite {
		public var reflectionSuite:ReflectionSuite;
		public var assertSuite:AssertionAndAssumptionSuite;
		public var eventSuite:EventsSuite;
	}
}