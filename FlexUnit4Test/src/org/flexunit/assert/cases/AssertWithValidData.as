package org.flexunit.assert.cases
{
	import org.flexunit.Assert;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	
	public class AssertWithValidData
	{
		[Test]
		public function shouldReturnZeroCount():void {
			var count:int = 0;
			
			assertEquals( count, Assert.assertionsMade );
		}
		
		[Test]
		public function shouldReturnAssertionsCount():void {
			var startCount:int = 0;
			var endCount:int = 1;
			
			assertEquals( startCount, Assert.assertionsMade );
			assertEquals( endCount, Assert.assertionsMade );
		}
		
		[Test]
		public function shouldSetCountToZero():void {
			var startCount:int = 0;
			var endCount:int = 1;
			
			assertEquals( startCount, Assert.assertionsMade );
			assertEquals( endCount, Assert.assertionsMade );
			
			Assert.resetAssertionsFields();
			
			assertEquals( startCount, Assert.assertionsMade );
		}
		
		//Convenience method, we may be able to do this with a bit more grace at a later point
		[Test]
		public function shouldApplyFunction():void {
			var count:int = 0;
			var myArray:Array = [new Object()];
			
			function assertWithApplyFunction( obj:Object ):void {
				count++;
			}
			
			Assert.assertWithApply( assertWithApplyFunction, myArray );
			assertEquals( 1, count );
		}
		
		[Test]
		public function shouldAddAssertWithApplyToCount():void {
			var myArray:Array = [new Object()];
			var myFunction:Function = new Function();
			var startCount:int = 0;
			var endCount:int = 2;
			
			assertEquals( startCount, Assert.assertionsMade )
			
			Assert.assertWithApply( myFunction, myArray );
			
			assertEquals( endCount, Assert.assertionsMade );
			
		}
		
		//Convenience method, we may be able to do this with a bit more grace at a later point
		[Test]
		public function shouldRunFunction():void {
			var count:int = 0;
			var myObject:Object = new Object();
			
			function assertWithFunction( obj:Object ):void {
				count++;
			}
			
			Assert.assertWith( assertWithFunction, myObject );
			assertEquals( 1, count );
		}
		
		[Test]
		public function shouldAddAssertWithToCount():void {
			var myObject:Object = new Object();
			var myFunction:Function = new Function();
			var startCount:int = 0;
			var endCount:int = 2;
			
			assertEquals( startCount, Assert.assertionsMade )
			
			Assert.assertWith( myFunction, myObject );
			
			assertEquals( endCount, Assert.assertionsMade );
		}
		
		[Test]
		public function shouldReturnTrueIfTwoArgsEqual():void {
			var arg1:int = 5;
			var arg2:int = 5;
			
			Assert.assertEquals( arg1, arg2 );
		}
		
		[Test]
		public function shouldAddAssertEqualsToCount():void {
			var startCount:int = 0;
			var endCount:int = 1;
			
			assertEquals( startCount, Assert.assertionsMade );
			assertEquals( endCount, Assert.assertionsMade );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailIfTwoArgsUnequal():void {
			var arg1:int = 0;
			var arg2:int = 5;
			
			assertFalse( Assert.assertEquals( arg1, arg2 ) );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldReturnFailWithMessage():void {
			var arg1:int = 0;
			var arg2:int = 5;
			
			var message:String = "Failure Message";
			
			assertFalse( Assert.assertEquals( message, arg1, arg2 ) );
		}
		
		[Test]
		public function shouldPassIfTwoArgsEqual():void {
			var arg1:String = "MyString";
			var arg2:String = "MyString";
			
			var message:String = "Failure Message";
			
			Assert.failNotEquals( message, arg1, arg2);
		}
		
		[Test]
		public function shouldPassIfStringIntEqual():void {
			var arg1:int = 7;
			var arg2:String = "7";
			
			var message:String = "Failure Message";
			
			Assert.failNotEquals( message, arg1, arg2);
		}
		
		//Need to find out how to test that a particular failure message was sent
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailWithMessage():void {
			var arg1:int = 5;
			var arg2:int = 7;
			
			var message:String = "Failure Message";
			
			Assert.failNotEquals( message, arg1, arg2);
		}
		
		[Test]
		public function shouldReturnTrueIfTwoArgsSrictlyEqual():void {
			var myObject:Object = new Object();
			
			Assert.assertStrictlyEquals( myObject, myObject );
		}

		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailIfTwoArgsStrictlyUnequal():void {
			var myObject1:Object = new Object();
			var myObject2:Object = new Object();
			
			Assert.assertStrictlyEquals( myObject1, myObject2 );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldReturnStrictFailWithMessage():void {
			var arg1:Object = new Object();
			var arg2:Object = new Object();
			var message:String = "Failure Message";
			
			Assert.assertStrictlyEquals( message, arg1, arg2 );
		}
		
		[Test]
		public function shouldAddAssertStrictlyEqualsToCount():void {
			var myObject:Object = new Object();
			var startCount:int = 0;
			var endCount:int = 2;
			
			assertEquals( startCount, Assert.assertionsMade )
			
			Assert.assertStrictlyEquals( myObject, myObject );
			
			assertEquals( endCount, Assert.assertionsMade );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailWithStrictlyUnequalMessage():void {
			var myObject1:Object = new Object();
			var myObject2:Object = new Object();
			
			var message:String = "Failure Message";
			
			Assert.failNotStrictlyEquals( message, myObject1, myObject2 );
		}
		
		[Test]
		public function shouldPassIfArgsStrictlyEqual():void {
			var myObject:Object = new Object();
			var message:String = "Failure Message";
			
			Assert.failNotStrictlyEquals( message, myObject, myObject );
		}
		
		[Test]
		public function shouldReturnTrue():void {
			var arg:Boolean = true;
			
			Assert.assertTrue( arg );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailIfFalse():void {
			var arg:Boolean = false;
			
			Assert.assertTrue( arg );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailIfFalseWithMessage():void {
			var arg:Boolean = false;
			
			var message:String = "Failure Message";
			
			Assert.assertTrue( message, arg );
		}
		
		[Test]
		public function shouldAddAssertTrueToCount():void {
			var arg:Boolean = true;
			var startCount:int = 0;
			var endCount:int = 2;
			
			assertEquals( startCount, Assert.assertionsMade )
			
			Assert.assertTrue( arg );
			
			assertEquals( endCount, Assert.assertionsMade );
		}
		
		[Test]
		public function shouldPassIfTrue():void {
			var arg:Boolean = true;
			var message:String = "Failure Message";
			
			Assert.failNotTrue( message, arg );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailNotTrueWithMessage():void {
			var arg:Boolean = false;
			var message:String = "Failure Message";
			
			Assert.failNotTrue( message, arg );
		}
		
		[Test]
		public function shouldPassIfFalse():void {
			var arg:Boolean = false;
			
			Assert.assertFalse( arg );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailIfNotFalse():void {
			var arg:Boolean = true;
			
			Assert.assertFalse( arg );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailIfNotFalseWithMessage():void {
			var arg:Boolean = true;
			var message:String = "Failure Message";
			
			Assert.assertFalse( message, arg );
		}
		
		[Test]
		public function shouldAddAssertFalseToCount():void {
			var arg:Boolean = false;
			var startCount:int = 0;
			var endCount:int = 2;
			
			assertEquals( startCount, Assert.assertionsMade )
			
			Assert.assertFalse( arg );
			
			assertEquals( endCount, Assert.assertionsMade );
		}
		
		[Test]
		public function shouldPassIfConditionFalse():void {
			var arg:Boolean = false;
			var message:String = "Failure Message";
			
			Assert.failTrue( message, arg );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailConditionWithMessage():void {
			var arg:Boolean = true;
			var message:String = "Failure Message";
			
			Assert.failTrue( message, arg );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailIfStringEmpty():void {
			var arg:String = "";
			
			Assert.assertNull( arg );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailIfNotNull():void {
			var myObject:Object = new Object();
			
			Assert.assertNull( myObject );
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailIfNotNullWithMessage():void {
			var myObject:Object = new Object();
			var message:String = "Failure Message";
			
			Assert.assertNull( message, myObject );
		}
		
		[Test]
		public function shouldAddAssertNullToCount():void {
			var startCount:int = 0;
			var endCount:int = 2;
			
			assertEquals( startCount, Assert.assertionsMade )
			
			Assert.assertNull( null );
			
			assertEquals( endCount, Assert.assertionsMade );
		}

		[Test]
		public function shouldPassWithNotNullArg():void {
			var myObject:Object = new Object();
			var message:String = "FailureMessage";
			
			Assert.failNull( message, myObject );
		}
		
		[Test]
		public function shouldPassWithDefined():void {
			var myObject:Object = new Object();
			
			Assert.assertNotNull( myObject );
		}
			
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailWithNotNullArgMessage():void {
			var myObject:Object = new Object();
			var message:String = "FailureMessage";
			
			Assert.failNotNull( message, myObject );
		}

		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldThrowError():void {
			Assert.fail();
		}
		
		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldThrowErrorWithMessage():void {
			var message:String = "FailureMessage";
			
			Assert.fail( message );
		}
	}
}