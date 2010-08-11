package tests.org.flexunit.assert.equals
{
	import flexunit.framework.AssertionFailedError;
	
	import org.flexunit.Assert;
	
	public class AssertEqualsClassCase
	{
		[Test]
		public function shouldPassWhenBothNull():void {
			Assert.assertEquals( null, null );
		}
		
		[Test]
		public function shouldPassWhenSameNumber():void {
			Assert.assertEquals( 5, 5 );
		}
		
		[Test]
		public function shouldPassWhenSameObject():void {
			var o:Object = new Object();
			
			Assert.assertEquals( o, o );
		}
		
		[Test]
		public function shouldPassWhenEqualStrings():void {
			Assert.assertEquals( "5", "5" );
		}
		
		[Test]
		public function shouldNotEnforceStrictEqualityBetweenNumAndString():void {
			Assert.assertEquals( "5", 5 );
		}
		
		[Test]
		public function shouldNotEnforceStrictEqualityBetweenNumAndInt():void {
			Assert.assertEquals( Number( 5.00 ), int( 5 ) );
		}
		
		[Test]
		public function shouldCompareTwoNumbersAsEqual():void {
			Assert.assertEquals( 5, 5 );
		}
		
		[Test]
		public function shouldCompareTwoNumbersAsEqualWithCustomMessage():void {
			Assert.assertEquals( "Assert equals fail", 5, 5 );
		}
		
		[Test]
		public function shouldFailWhenNotEqual():void {
			var failed:Boolean = false;
			var message:String;
			
			try {
				Assert.assertEquals( 2, 4 );
			} catch ( error : AssertionFailedError ) {
				failed = true;
				message = error.message;
			}
			
			if ( !failed ) {
				Assert.fail( "Assert equals didn't fail" );
			}
			
			Assert.assertEquals( "expected:<2> but was:<4>", message );
		}
		
		
		[Test(description="Ensure that the assertEquals alias function fails when two items are not equal and the proper passed message is displayed")]
		public function shouldFailWhenNotEqualWithCustomMessage():void {
			var failed:Boolean = false;
			var message:String;
			
			try {
				Assert.assertEquals( "Yo Yo Yo", 2, 4 );
				// if we get an error with the right message we pass
			} catch (error:AssertionFailedError) {
				failed = true;
				message = error.message;
			}
			
			if ( !failed ) {
				Assert.fail( "Assert equals didn't fail" );
			}
			
			Assert.assertEquals( "Yo Yo Yo" + " - expected:<2> but was:<4>", message );
		}
		
		[Test]
		public function shouldAddAssertEqualsToCount():void {
			var count:int = Assert.assertionsMade;
			
			Assert.assertEquals( count, Assert.assertionsMade );
			Assert.assertEquals( count + 1, Assert.assertionsMade );
		}
	}
}