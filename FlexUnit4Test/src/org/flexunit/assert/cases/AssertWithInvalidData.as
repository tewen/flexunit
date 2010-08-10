package org.flexunit.assert.cases
{
	import flexunit.framework.AssertionFailedError;
	
	import org.flexunit.Assert;
	import org.flexunit.asserts.assertEquals;

	public class AssertWithInvalidData
	{
		[Test(expects="TypeError")]
		public function shouldThrowWithInvalidArgument():void {
			var myArray:Array = [new Object()];
			
			Assert.assertWithApply( null, myArray );
		}
		
		//Convenience method, we may be able to do this with a bit more grace at a later point
		[Test(expects="ArgumentError")]
		public function shouldThrowAppliedFunctionWithInvalidArguments():void {	
			function assertWithApplyFunction( obj:Object ):void { }
			
			Assert.assertWithApply( assertWithApplyFunction, null );
		}
		
		[Test(expects="TypeError")]
		public function shouldThrowWithInvalidFunctionArgument():void {
			var myObject:Object = new Object();
			
			Assert.assertWith( null, myObject );
		}
		
		[Test]
		public function shouldRunFunctionWithInvalidArguments():void {
			function assertWithFunction( obj:Object ):void { }
			
			Assert.assertWith( assertWithFunction, null );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailIfOneArgumentUndefined():void {
			var myObject:Object = new Object();
			
			Assert.assertEquals( myObject, null );
		}
		
		[Test]
		public function shouldReturnTrueIfNullsEqual():void {
			Assert.assertEquals( null, null );
		}
		
		[Test]
		public function shouldFailFromNull():void {
			var message:String = "Failure Message";
			
			Assert.failNotEquals( message, null, null );
		}

		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldStrictFailIfOneArgumentUndefined():void {
			var myObject:Object = new Object();
			
			Assert.assertStrictlyEquals( myObject, null );
		}
		
		[Test]
		public function shouldReturnTrueIfNullsStrictlyEqual():void {
			Assert.assertStrictlyEquals( null, null );
		}
		
		[Test]
		public function shouldPassGivenNull():void {
			var message:String = "Failure Message";
			
			Assert.failNotEquals( message, null, null );
		}

		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailIfNull():void {
			Assert.assertTrue( null );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailWhenNull():void {
			var message:String = "Failure Message";
			
			Assert.failNotTrue( message, Boolean(null) );
		}
		
		[Test]
		public function shouldPassIfNull():void {
			Assert.assertFalse( null, null );
		}

		[Test]
		public function shouldPassIfConditionNull():void {
			Assert.failTrue( null, Boolean(null) );
		}
		
		[Test]
		public function shouldPasswhenNull():void {
			Assert.assertNull( null );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailWithNullArg():void {
			var message:String = "Failure Message";
			
			Assert.failNull( message, null );
		}
			
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailWithNullArgMessage():void {
			var message:String = "Failure Message";
			
			Assert.failNull( message, null );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailWithNull():void {
			Assert.assertNotNull( null );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailWithNullMessage():void {
			var message:String = "Failure Message";
			
			Assert.assertNotNull( message, null );
		}
		
		[Test]
		public function shouldPassWithNullArg():void {
			Assert.failNotNull( null, null );
		}

		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldThrowErrorWithNullMessage():void {
			Assert.fail( null );
		}

	}
}