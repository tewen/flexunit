package tests.org.flexunit.async.AsyncAS
{
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class AsyncASSuite
	{
		public var proceedOnEventCase:ProceedOnEventCase;
		public var asyncProceedOnEventCase:AsyncProceedOnEventCase;
		public var failOnEventCase:FailOnEventCase;
		public var registerFailureEventCase:RegisterFailureEventCase;
		public var handleEventCase:HandleEventCase;
		public var asyncHandlerCase:AsyncHandlerCase;
		public var asyncResponderCase:AsyncResponderCase;
	}
}