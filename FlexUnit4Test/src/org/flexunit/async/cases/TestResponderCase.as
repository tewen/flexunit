package org.flexunit.async.cases
{
	import mockolate.runner.MockolateRule;
	
	import org.flexunit.Assert;
	import org.flexunit.async.TestResponder;
	import org.hamcrest.Matcher;

	public class TestResponderCase
	{
		[Rule]
		public var mockolate:MockolateRule = new MockolateRule();
		
		[Mock]
		public var matcher:Matcher; 
		
		//TODO: Need to finish implementing this test case and confirm it's being implemented
		//correctly, this could be done with a mock
		
		protected var testResponder:TestResponder;
		protected var resultCalled:int;
		protected var faultCalled:int;
		
		[Before(description="Create an instance of the TestResponder")]
		public function createTestResponder():void {
			testResponder = new TestResponder(mockResult, mockFault);
			resultCalled = 0;
			faultCalled = 0;
		}
		
		[After(description="Destroy the instance of the TestResponder")]
		public function destroyTestResponder():void {
			testResponder = null;
			resultCalled = 0;
			faultCalled = 0;
		}
		
		/*[Test]
		public function shouldRunResultFunction():void {
			var data:Object = new Object();
			var passThroughData:Object = new Object();
			
			stub( matcher ).method( "result" ).args( data, passThroughData ).calls( resultFunction( data, passThroughData ) );
			
			if(resultCalled != 1) {
				Assert.fail("The result function was not properly called");
			}
		}*/
		
		[Test(description="Ensure the result function is correctly called")]
		public function resultTest():void {
			testResponder.result(new Object(), new Object());
			
			if(resultCalled != 1) {
				Assert.fail("The result function was not properly called");
			}
		}
		
		[Test]
		public function shouldRunFaultFunction():void {
			testResponder.fault(new Object(), new Object());
			
			if(faultCalled != 1) {
				Assert.fail("The fault function was not properly called");
			}
		}
		
		[Test(description="Ensure the fault function is correctly called")]
		public function faultTest():void {
			testResponder.fault(new Object(), new Object());
			
			if(faultCalled != 1) {
				Assert.fail("The fault function was not properly called");
			}
		}
		
		protected function mockResult(data:Object, passThroughData:Object):void {
			resultCalled++;
		}
		
		protected function mockFault(data:Object, passThroughData:Object):void {
			faultCalled++;
		}
	}
}