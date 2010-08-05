package org.flexunit.assert
{
	import org.flexunit.assert.cases.AssertWithInvalidData;
	import org.flexunit.assert.cases.AssertWithValidData;
	import org.flexunit.cases.AssertCase;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class AssertSuite
	{
		public var assertWithValidData:AssertWithValidData;
		public var assertWithInvalidData:AssertWithInvalidData;
		//Legacy, just keeping it around for this branch of testing
		public var assertCase:AssertCase;
	}
}