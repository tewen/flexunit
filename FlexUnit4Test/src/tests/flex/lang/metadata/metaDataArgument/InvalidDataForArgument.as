package tests.flex.lang.metadata.metaDataArgument {
	import flex.lang.reflect.metadata.MetaDataArgument;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNull;

	public class InvalidDataForArgument {

		[Test(expects="ArgumentError")]
		public function shouldThrowError():void {
			var argument:MetaDataArgument = new MetaDataArgument( null );
		}

		[Test]
		public function shouldReturnEmptyStringForKey():void {
			var xml:XML = <arg/>; 
			var argument:MetaDataArgument = new MetaDataArgument( xml );
			
			assertEquals( 0, argument.key.length );
		}

		[Test]
		public function shouldReturnValueAndKeyAsString():void {
			var xml:XML = <arg/>; 
			var argument:MetaDataArgument = new MetaDataArgument( xml );
			
			assertEquals( "", argument.key );
			assertEquals( "", argument.value );
		}

		[Test]
		public function shouldNotBeUnpaired():void {
			var xml:XML = <arg/>; 
			var argument:MetaDataArgument = new MetaDataArgument( xml );
			
			assertFalse( argument.unpaired );
		}
		
	}
}