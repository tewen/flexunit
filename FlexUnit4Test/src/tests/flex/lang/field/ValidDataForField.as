package tests.flex.lang.field {
	import flex.lang.reflect.Field;
	import flex.lang.reflect.metadata.MetaDataAnnotation;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.assertTrue;

	public class ValidDataForField {
		[Test]
		public function shouldReturnName():void {
			var fieldXML:XML = <variable name="testVariable" type="Array"/>;
			
			var field:Field = new Field( fieldXML, false, String, false );
			assertEquals( "testVariable", field.name );
		}
		
		[Test]
		public function shouldReturnTrueWhenStatic():void {
			var fieldXML:XML = <variable name="testVariable" type="Array"/>;
			
			var field:Field = new Field( fieldXML, true, String, false );
			assertTrue( field.isStatic );
		}
		
		[Test]
		public function shouldReturnFalseWhenInstance():void {
			var fieldXML:XML = <variable name="testVariable" type="Array"/>;
			
			var field:Field = new Field( fieldXML, false, String, false );
			assertFalse( field.isStatic );
		}

		[Test]
		public function shouldReturnStringAsDefinedBy():void {
			var fieldXML:XML = <variable name="testVariable" type="Array"/>;
			
			var field:Field = new Field( fieldXML, false, String, false );
			assertEquals( String, field.definedBy );
		}

		[Test]
		public function shouldReturnElementTypeWhenDefined():void {
			var fieldXML:XML = <variable name="myArray" type="Array"><metadata name="ArrayElementType"><arg key="" value="int"/></metadata></variable>;
			
			var field:Field = new Field( fieldXML, false, String, false );
			assertEquals( int, field.elementType );
		}
		
		[Test]
		public function shouldReturnNullWhenFieldNotArray():void {
			var fieldXML:XML = <variable name="myArray" type="String"><metadata name="ArrayElementType"><arg key="" value="int"/></metadata></variable>;
			
			var field:Field = new Field( fieldXML, false, String, false );
			assertNull( field.elementType );
		}
		
		[Test]
		public function shouldReturnNullWhenTypeNotFound():void {
			var fieldXML:XML = <variable name="myArray" type="Array"><metadata name="ArrayElementType"><arg key="" value="monkey"/></metadata></variable>;
			
			var field:Field = new Field( fieldXML, false, String, false );
			assertNull( field.elementType );
		}
		
/*		[Ignore("Needed functionality but not yet implemented")]
		[Test]
		public function shouldReturnElementTypeWithMultipleMetaData():void {
		}*/
		
		[Test]
		public function shouldReturnEmptyArrayWhenNoMetaDataDefined():void {
			var fieldXML:XML = <variable name="myArray" type="Array"/>;
			
			var field:Field = new Field( fieldXML, false, String, false );
			assertNotNull( field.metadata );
			assertEquals( 0, field.metadata.length );
		}
		
		[Test]
		public function shouldReturnArrayWithMetaDataAnnotation():void {
			var fieldXML:XML = <variable name="myArray" type="String"><metadata name="ArrayElementType"><arg key="" value="int"/></metadata></variable>;
			
			var field:Field = new Field( fieldXML, false, String, false );
			assertNotNull( field.metadata );
			assertEquals( 1, field.metadata.length );
			assertTrue( field.metadata[ 0 ] is MetaDataAnnotation );
			
			//We don't want to test MetaDataAnnotation here, but we do need to test that field
			//managed to pass it through correctly
			assertEquals( "ArrayElementType", ( field.metadata[ 0 ] as MetaDataAnnotation ).name );
		}

		[Test]
		public function shouldReturnStringWhenAskedForType():void {
			var fieldXML:XML = <variable name="myArray" type="String"/>;

			//This uses parts of Klass, but we will test that in Klass
			//We only want to ensure that the type from the XML passes through correctly
			var field:Field = new Field( fieldXML, false, Array, false );
			assertEquals( String, field.type );
		}

		[Test]
		public function shouldReturnTrueWhenAskingForValidMetaData():void {
			var fieldXML:XML = <variable name="myArray" type="String"><metadata name="ArrayElementType"><arg key="" value="int"/></metadata></variable>;
			
			var field:Field = new Field( fieldXML, false, String, false );

			assertTrue( field.hasMetaData( "ArrayElementType" ) );
		}

		[Test]
		public function shouldReturnFalseWhenNoMetaData():void {
			var fieldXML:XML = <variable name="myArray" type="String"/>;
			
			var field:Field = new Field( fieldXML, false, String, false );
			
			assertFalse( field.hasMetaData( "ArrayElementType" ) );
		}

		[Test]
		public function shouldReturnFalseWhenMetaDataNotPresent():void {
			var fieldXML:XML = <variable name="myArray" type="String"><metadata name="ArrayElementType"><arg key="" value="int"/></metadata></variable>;
			
			var field:Field = new Field( fieldXML, false, String, false );
			
			assertFalse( field.hasMetaData( "Test" ) );
		}

		[Test]
		public function shouldReturnAnnotationWhenPresent():void {
			var fieldXML:XML = <variable name="myArray" type="String"><metadata name="ArrayElementType"><arg key="" value="int"/></metadata></variable>;
			
			var field:Field = new Field( fieldXML, false, String, false );
			
			assertNotNull( field.getMetaData( "ArrayElementType" ) );

			//We don't want to test MetaDataAnnotation here, but we do need to test that field
			//managed to pass it through correctly
			assertEquals( "ArrayElementType", field.getMetaData( "ArrayElementType" ).name );
		}

		[Test]
		public function shouldReturnNullWhenAnnotationNotPresent():void {
			var fieldXML:XML = <variable name="myArray" type="String"><metadata name="ArrayElementType"><arg key="" value="int"/></metadata></variable>;
			
			var field:Field = new Field( fieldXML, false, String, false );
			
			assertNull( field.getMetaData( "Test" ) );
		}
	}
}